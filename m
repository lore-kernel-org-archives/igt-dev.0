Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D67610E315
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jun 2022 16:14:19 +0000 (UTC)
Date: Wed, 29 Jun 2022 18:13:34 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Ryszard Knop <ryszard.knop@intel.com>
Message-ID: <20220629181334.60fc4f83@maurocar-mobl2>
In-Reply-To: <20220628094435.854519-5-ryszard.knop@intel.com>
References: <20220628094435.854519-1-ryszard.knop@intel.com>
 <20220628094435.854519-5-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 4/7] runner: Add the --environment flag
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

On Tue, 28 Jun 2022 11:44:32 +0200
Ryszard Knop <ryszard.knop@intel.com> wrote:

> Allows specifying additional environment variables to be set for the
> launched test processes. This commit introduces the argument parsing.
> 
> Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
> ---
>  runner/settings.c | 116 +++++++++++++++++++++++++++++++++++++++++++++-
>  runner/settings.h |   9 ++++
>  2 files changed, 124 insertions(+), 1 deletion(-)
> 
> diff --git a/runner/settings.c b/runner/settings.c
> index d153954a..de339484 100644
> --- a/runner/settings.c
> +++ b/runner/settings.c
> @@ -35,6 +35,7 @@ enum {
>  	OPT_DRY_RUN = 'd',
>  	OPT_INCLUDE = 't',
>  	OPT_EXCLUDE = 'x',
> +	OPT_ENVIRONMENT = 'e',
>  	OPT_SYNC = 's',
>  	OPT_LOG_LEVEL = 'l',
>  	OPT_OVERWRITE = 'o',
> @@ -389,6 +390,113 @@ static void free_regexes(struct regex_list *regexes)
>  	free(regexes->regexes);
>  }
>  
> +/**
> + * string_trim_and_duplicate() - returns a duplicated, trimmed string
> + * @string: string to trim and duplicate
> + * 
> + * If the provided string is NULL, a NULL is returned. In any other case, a
> + * newly-allocated string of length up to strlen(string) is returned. The
> + * returned string has its whitespace removed (as detected by isspace), while
> + * the original string is left unmodified.
> + */
> +static char *string_trim_and_duplicate(const char *string) {
> +	size_t length;
> +
> +	if (string == NULL)
> +		return NULL;
> +
> +	length = strlen(string);
> +
> +	while (length > 0 && isspace(string[0])) {
> +		string++;
> +		length--;
> +	}
> +
> +	while (length > 0 && isspace(string[length - 1])) {
> +		length--;
> +	}
> +
> +	return strndup(string, length);
> +}
> +
> +/**
> + * add_env_var() - Adds a new environment variable to the runner settings.
> + * @env_vars: Pointer to the env var list head from the settings.
> + * @env_kv: Environment variable key-value pair string to add.
> + *
> + * env_kv must be a string like "KEY=VALUE" or just "KEY" if the value is to
> + * be loaded from the runner's environment variables. In the latter case, if
> + * the requested variable is not set, the operation will fail.
> + * 
> + * An empty variable may be set by providing an env_kv of "KEY=" or setting
> + * an empty variable for the runner process, then providing just "KEY".
> + */
> +static bool add_env_var(struct igt_list_head *env_vars, char *env_kv) {
> +	char *current_env_value, *kv_split;
> +	struct environment_variable *var = NULL;
> +
> +	if (env_vars == NULL || env_kv == NULL || strlen(env_kv) == 0)
> +		goto error;

As you had already allocated env_vars at this point, as otherwise env_vars
would be NULL, the best is to just call IGT_INIT_LIST_HEAD(env_vars) when 
it was allocated.

> +
> +	env_kv = strdup(env_kv);
> +	kv_split = strchr(env_kv, '=');

Better to use strtok().

> +	if (kv_split == env_kv) {
> +		fprintf(stderr, "Missing key for --environment \"%s\"\n", env_kv);
> +		goto error;
> +	}
> +
> +	var = malloc(sizeof(struct environment_variable));
> +	if (kv_split != NULL) {
> +		/* value provided - copy string contents after '=' */
> +		kv_split[0] = NULL;
> +
> +		var->key = string_trim_and_duplicate(env_kv);
> +		var->value = strdup(kv_split + 1); /* Can be empty, that's okay */
> +	} else {
> +		/* use the runner's environment, if set */
> +		current_env_value = getenv(env_kv);
> +		if (current_env_value == NULL) {
> +			fprintf(stderr, "No value provided for --environment \"%s\" and "
> +			                "variable is not set for igt_runner\n", env_kv);
> +			goto error;
> +		}
> +
> +		var->key = string_trim_and_duplicate(env_kv);
> +		var->value = strdup(current_env_value);
> +	}


It sounds weird to accept things like:

	"ENV=     var"
or even:
	"   ENV=var"

So, I would code the above with something based on this:

	key = strtok(env_kv, ", \n\t=");
	if (!key || !*key)
		goto err;
	value = strtok(NULL, ", \n\t");

Simpler, easier to understand and will give errors if spaces are
found where they shouldn't be. It can even be used inside a loop,
if someone would want to use it as:

	--environment "VAR1=foo, VAR2=bar"

> +
> +	if (igt_list_empty_or_null(env_vars))
> +		IGT_INIT_LIST_HEAD(env_vars);
> +
> +	igt_list_add_tail(var, env_vars);
> +
> +	free(env_kv);
> +	return true;
> +
> +error:
> +	if (var != NULL)
> +		free(var);
> +
> +	if (env_kv != NULL)
> +		free(env_kv);
> +
> +	return false;
> +}
> +
> +static void free_env_vars(struct igt_list_head *env_vars) {
> +	struct environment_variable *iter;
> +
> +	while (!igt_list_empty_or_null(env_vars)) {
> +		iter = igt_list_first_entry(env_vars, iter, link);
> +
> +		free(iter->key);
> +		free(iter->value);
> +
> +		igt_list_del(iter);
> +		free(iter);
> +	}
> +}
> +
>  static bool readable_file(const char *filename)
>  {
>  	return !access(filename, R_OK);
> @@ -496,6 +604,7 @@ void clear_settings(struct settings *settings)
>  
>  	free_regexes(&settings->include_regexes);
>  	free_regexes(&settings->exclude_regexes);
> +	free_env_vars(&settings->env_vars);
>  
>  	init_settings(settings);
>  }
> @@ -514,6 +623,7 @@ bool parse_options(int argc, char **argv,
>  		{"allow-non-root", no_argument, NULL, OPT_ALLOW_NON_ROOT},
>  		{"include-tests", required_argument, NULL, OPT_INCLUDE},
>  		{"exclude-tests", required_argument, NULL, OPT_EXCLUDE},
> +		{"environment", required_argument, NULL, OPT_ENVIRONMENT},
>  		{"abort-on-monitored-error", optional_argument, NULL, OPT_ABORT_ON_ERROR},
>  		{"disk-usage-limit", required_argument, NULL, OPT_DISK_USAGE_LIMIT},
>  		{"sync", no_argument, NULL, OPT_SYNC},
> @@ -543,7 +653,7 @@ bool parse_options(int argc, char **argv,
>  
>  	settings->dmesg_warn_level = -1;
>  
> -	while ((c = getopt_long(argc, argv, "hn:dt:x:sl:omb:L",
> +	while ((c = getopt_long(argc, argv, "hn:dt:x:e:sl:omb:L",
>  				long_options, NULL)) != -1) {
>  		switch (c) {
>  		case OPT_VERSION:
> @@ -569,6 +679,10 @@ bool parse_options(int argc, char **argv,
>  			if (!add_regex(&settings->exclude_regexes, strdup(optarg)))
>  				goto error;
>  			break;
> +		case OPT_ENVIRONMENT:
> +			if (!add_env_var(&settings->env_vars, optarg))
> +				goto error;
> +			break;
>  		case OPT_ABORT_ON_ERROR:
>  			if (!parse_abort_conditions(settings, optarg))
>  				goto error;
> diff --git a/runner/settings.h b/runner/settings.h
> index 6d444d01..819c3460 100644
> --- a/runner/settings.h
> +++ b/runner/settings.h
> @@ -7,6 +7,8 @@
>  #include <stdio.h>
>  #include <glib.h>
>  
> +#include "igt_list.h"
> +
>  enum {
>  	LOG_LEVEL_NORMAL = 0,
>  	LOG_LEVEL_QUIET = -1,
> @@ -37,6 +39,12 @@ struct regex_list {
>  	size_t size;
>  };
>  
> +struct environment_variable {
> +	struct igt_list_head link;
> +	char * key;
> +	char * value;
> +};
> +
>  struct settings {
>  	int abort_mask;
>  	size_t disk_usage_limit;
> @@ -46,6 +54,7 @@ struct settings {
>  	bool allow_non_root;
>  	struct regex_list include_regexes;
>  	struct regex_list exclude_regexes;
> +	struct igt_list_head env_vars;
>  	bool sync;
>  	int log_level;
>  	bool overwrite;
