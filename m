Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D3610E486
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jun 2022 16:36:24 +0000 (UTC)
Date: Wed, 29 Jun 2022 18:36:19 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Ryszard Knop <ryszard.knop@intel.com>
Message-ID: <20220629183619.03808eb8@maurocar-mobl2>
In-Reply-To: <20220628094435.854519-6-ryszard.knop@intel.com>
References: <20220628094435.854519-1-ryszard.knop@intel.com>
 <20220628094435.854519-6-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 5/7] runner: Serialize the provided
 environment flags
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, 28 Jun 2022 11:44:33 +0200
Ryszard Knop <ryszard.knop@intel.com> wrote:

> Settings serialization now creates a separate file, environment.txt,
> which contains KEY=VALUE pairs of environment variables to use for test
> process spawning. Only vars created with --environment are serialized.
> Also add misc warning fixes.
> 
> Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
> ---
>  runner/settings.c | 206 +++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 169 insertions(+), 37 deletions(-)
> 
> diff --git a/runner/settings.c b/runner/settings.c
> index de339484..1926e197 100644
> --- a/runner/settings.c
> +++ b/runner/settings.c
> @@ -79,6 +79,9 @@ static struct {
>  	{ 0, 0 },
>  };
>  
> +static char settings_filename[] = "metadata.txt";
> +static char env_filename[] = "environment.txt";
> +

are the above const? If so, add such attribute.

>  static bool set_log_level(struct settings* settings, const char *level)
>  {
>  	typeof(*log_levels) *it;
> @@ -296,6 +299,7 @@ static const char *usage_str =
>  	"                        this option if given.\n"
>  	;
>  
> +__attribute__ ((format(printf, 2, 3)))
>  static void usage(FILE *f, const char *extra_message, ...)
>  {
>  	if (extra_message) {
> @@ -448,7 +452,7 @@ static bool add_env_var(struct igt_list_head *env_vars, char *env_kv) {
>  	var = malloc(sizeof(struct environment_variable));
>  	if (kv_split != NULL) {
>  		/* value provided - copy string contents after '=' */
> -		kv_split[0] = NULL;
> +		kv_split[0] = '\0';

Why is this here? Should be at the patch that added it.

>  
>  		var->key = string_trim_and_duplicate(env_kv);
>  		var->value = strdup(kv_split + 1); /* Can be empty, that's okay */
> @@ -468,7 +472,7 @@ static bool add_env_var(struct igt_list_head *env_vars, char *env_kv) {
>  	if (igt_list_empty_or_null(env_vars))
>  		IGT_INIT_LIST_HEAD(env_vars);
>  
> -	igt_list_add_tail(var, env_vars);
> +	igt_list_add_tail(&var->link, env_vars);
>  
>  	free(env_kv);
>  	return true;
> @@ -492,11 +496,16 @@ static void free_env_vars(struct igt_list_head *env_vars) {
>  		free(iter->key);
>  		free(iter->value);
>  
> -		igt_list_del(iter);
> +		igt_list_del(&iter->link);
>  		free(iter);
>  	}
>  }
>  
> +static bool file_exists_at(int dirfd, const char *filename)
> +{
> +	return faccessat(dirfd, filename, F_OK, 0) == 0;
> +}
> +
>  static bool readable_file(const char *filename)
>  {
>  	return !access(filename, R_OK);
> @@ -885,14 +894,78 @@ bool validate_settings(struct settings *settings)
>  	return true;
>  }
>  
> -static char settings_filename[] = "metadata.txt";
> +/**
> + * fopenat() - wrapper for fdopen(openat(dirfd, filename))
> + * @dirfd: directory fd to pass to openat
> + * @filename: file name to open with openat
> + * @flags: flags to pass to openat
> + * @openat_mode: (octal) mode to pass to openat
> + * @fdopen_mode: (text) mode to pass to fdopen
> + */
> +static FILE *fopenat(int dirfd, char *filename, int flags, mode_t openat_mode, const char *fdopen_mode)
> +{
> +	int fd;
> +	FILE *f;
> +
> +	if ((fd = openat(dirfd, filename, flags, openat_mode)) < 0) {
> +		usage(stderr, "fopenat(%s, %d) failed: %s",
> +		      filename, flags, strerror(errno));
> +		return NULL;
> +	}
> +
> +	f = fdopen(fd, fdopen_mode);
> +	if (!f) {
> +		close(fd);
> +		return NULL;
> +	}
> +
> +	return f;
> +}
> +
> +static FILE *fopenat_read(int dirfd, char *filename)
> +{
> +	return fopenat(dirfd, filename, O_RDONLY, 0000, "r");
> +}
> +
> +static FILE *fopenat_create(int dirfd, char *filename, bool overwrite)
> +{
> +	mode_t mode_if_exists = overwrite ? O_TRUNC : O_EXCL;
> +	return fopenat(dirfd, filename, O_CREAT | O_RDWR | mode_if_exists, 0666, "w");
> +}
> +
> +static bool serialize_environment(struct settings *settings, int dirfd)
> +{
> +	struct environment_variable *iter;
> +	FILE *f;
> +
> +	if (file_exists_at(dirfd, env_filename) && !settings->overwrite) {
> +		usage(stderr, "%s already exists, not overwriting", env_filename);
> +		return false;
> +	}
> +
> +	if ((f = fopenat_create(dirfd, env_filename, settings->overwrite)) == NULL)
> +		return false;
> +
> +	igt_list_for_each_entry(iter, &settings->env_vars, link) {
> +		fprintf(f, "%s=%s\n", iter->key, iter->value);
> +	}
> +
> +	if (settings->sync) {
> +		fflush(f);
> +		fsync(fileno(f));
> +	}
> +
> +	fclose(f);
> +	return true;
> +}
> +
>  bool serialize_settings(struct settings *settings)
>  {
>  #define SERIALIZE_LINE(f, s, name, format) fprintf(f, "%s : " format "\n", #name, s->name)
>  
> -	int dirfd, covfd, fd;
> -	char path[PATH_MAX];
>  	FILE *f;
> +	int dirfd, covfd;
> +	char path[PATH_MAX];
>  
>  	if (!settings->results_path) {
>  		usage(stderr, "No results-path set; this shouldn't happen");
> @@ -920,28 +993,13 @@ bool serialize_settings(struct settings *settings)
>  		}
>  	}
>  
> -	if (!settings->overwrite &&
> -	    faccessat(dirfd, settings_filename, F_OK, 0) == 0) {
> -		usage(stderr, "Settings metadata already exists and not overwriting");
> -		return false;
> -	}
> -
> -	if (settings->overwrite &&
> -	    unlinkat(dirfd, settings_filename, 0) != 0 &&
> -	    errno != ENOENT) {
> -		usage(stderr, "Error removing old settings metadata");
> -		return false;
> -	}
> -
> -	if ((fd = openat(dirfd, settings_filename, O_CREAT | O_EXCL | O_WRONLY, 0666)) < 0) {
> -		usage(msg, "Creating settings serialization file failed: %s", strerror(errno));
> +	if (file_exists_at(dirfd, settings_filename) && !settings->overwrite) {
> +		usage(stderr, "%s already exists, not overwriting", settings_filename);
>  		close(dirfd);
>  		return false;
>  	}
>  
> -	f = fdopen(fd, "w");
> -	if (!f) {
> -		close(fd);
> +	if ((f = fopenat_create(dirfd, settings_filename, settings->overwrite)) == NULL) {
>  		close(dirfd);
>  		return false;
>  	}
> @@ -972,11 +1030,22 @@ bool serialize_settings(struct settings *settings)
>  	SERIALIZE_LINE(f, settings, code_coverage_script, "%s");
>  
>  	if (settings->sync) {
> -		fsync(fd);
> -		fsync(dirfd);
> +		fflush(f);
> +		fsync(fileno(f));
>  	}
>  
>  	fclose(f);
> +
> +	if (!igt_list_empty_or_null(&settings->env_vars)) {

See my past comments.

> +		if (!serialize_environment(settings, dirfd)) {
> +			close(dirfd);
> +			return false;
> +		}
> +	}
> +
> +	if (settings->sync)
> +		fsync(dirfd);
> +
>  	close(dirfd);
>  	return true;
>  
> @@ -1045,28 +1114,91 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
>  #undef PARSE_LINE
>  }
>  
> +static bool should_skip_env_line(char *line) {
> +	char *trimmed_line;
> +	bool is_comment, missing_split;
> +
> +	if (line == NULL)
> +		return true;
> +
> +	trimmed_line = string_trim_and_duplicate(line);

Why do you need to trim whitespaces here?

> +	if (trimmed_line == NULL)
> +		return true;
> +
> +	is_comment = strlen(trimmed_line) == 0 || trimmed_line[0] == '#';
> +	missing_split = strchr(trimmed_line, '=') == NULL;
> +
> +	free(trimmed_line);
> +	return is_comment || missing_split;
> +}
> +
> +/**
> + * read_env_vars_from_file() - load env vars from a file
> + * @env_vars: list head to add env var entries to
> + * @dirfd: file descriptor of the directory containing env vars
> + * 
> + * Loads the environment.txt file and adds each line-separated KEY=VALUE pair
> + * into the provided env_vars list. Lines not containing the '=' K-V separator
> + * or starting with a '#' are ignored.
> + * 
> + * The function returns true if the env vars were read successfully, or there
> + * was nothing to be read.
> + */
> +static bool read_env_vars_from_file(struct igt_list_head *env_vars, FILE *f)
> +{
> +	char *line = NULL;
> +	ssize_t line_length;
> +	size_t line_buffer_length = 0;
> +
> +	while ((line_length = getline(&line, &line_buffer_length, f)) != -1) {
> +		if (should_skip_env_line(line))
> +			continue;
> +
> +		/* Strip the line feed, but keep trailing whitespace */
> +		if (line_length > 0 && line[line_length - 2] == '\n')
> +			line[line_length - 2] = '\0';
> +
> +		add_env_var(env_vars, line);
> +	}
> +
> +	/* input file can be empty */
> +	if (line != NULL)
> +		free(line);
> +
> +	return true;
> +}
> +
>  bool read_settings_from_dir(struct settings *settings, int dirfd)
>  {
> -	int fd;
>  	FILE *f;
>  
>  	clear_settings(settings);
>  
> -	if ((fd = openat(dirfd, settings_filename, O_RDONLY)) < 0)
> -		return false;
> +	/* settings are always there */
> +	{

Why are you adding a '{' here?

> +		if ((f = fopenat_read(dirfd, settings_filename)) == NULL)
> +			return false;
>  
> -	f = fdopen(fd, "r");
> -	if (!f) {
> -		close(fd);
> -		return false;
> -	}
> +		if (!read_settings_from_file(settings, f)) {
> +			fclose(f);
> +			return false;
> +		}
>  
> -	if (!read_settings_from_file(settings, f)) {
>  		fclose(f);
> -		return false;
>  	}
>  
> -	fclose(f);
> +	/* env file may not exist if no --environment was set */
> +	if (file_exists_at(dirfd, env_filename)) {
> +		if ((f = fopenat_read(dirfd, env_filename)) == NULL)
> +			return false;
> +
> +		if (!read_env_vars_from_file(&settings->env_vars, f)) {
> +			fclose(f);
> +			return false;
> +		}
> +
> +		fclose(f);
> +	}
>  
>  	return true;
>  }
