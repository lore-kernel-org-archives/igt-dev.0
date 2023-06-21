Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4917C10E3E7
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jun 2023 08:00:41 +0000 (UTC)
Date: Wed, 21 Jun 2023 10:00:26 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230621100026.05ecc168@maurocar-mobl2>
In-Reply-To: <20230620183106.26435-1-kamil.konieczny@linux.intel.com>
References: <20230620183106.26435-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] RFC: runner/resultgen: compress dmesg
 if size limit hit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, 20 Jun 2023 20:31:06 +0200
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Create possibility for compressing dmesg kernel output in case
> when disk limit option is used and file size actually exceed it.
> Instead of cutting down file, which may later limit search for
> problem solution, copy a few lines from beginning and end of it
> into results.json and then compresses it with the help of
> external program.
> 
> Bug: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/129

It makes sense to me, but:

- IGT should check if bzip2 tool is installed;
- it probably makes sense to have an option to select the compress
  tool;
- it probably makes sense to add an option to always or never
  compress.

> 
> Cc: Petri Latvala <adrinael@adrinael.net>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  runner/resultgen.c | 38 +++++++++++++++++++++++++-------------
>  1 file changed, 25 insertions(+), 13 deletions(-)
> 
> diff --git a/runner/resultgen.c b/runner/resultgen.c
> index 26883ff9f..7291396ed 100644
> --- a/runner/resultgen.c
> +++ b/runner/resultgen.c
> @@ -27,6 +27,8 @@ _Static_assert(INCOMPLETE_EXITCODE != IGT_EXIT_SUCCESS, "exit code clash");
>  _Static_assert(INCOMPLETE_EXITCODE != IGT_EXIT_INVALID, "exit code clash");
>  _Static_assert(INCOMPLETE_EXITCODE != GRACEFUL_EXITCODE, "exit code clash");
>  
> +#define compressor_name "bzip2"
> +
>  struct subtest
>  {
>  	char *name;
> @@ -949,9 +951,9 @@ static void add_dmesg_limited(struct json_object *obj, const char *dname,
>  {
>  	char *small_buf;
>  	size_t small_len = 0;
> -	char *smsg, *stmp;
> +	const char *smsg, *stmp;
>  	int line;
> -	size_t len, delta;
> +	size_t len;
>  
>  	small_buf = malloc(DMESG_LIMIT_MAX_SIZE);
>  	if (!small_buf) {
> @@ -973,7 +975,7 @@ static void add_dmesg_limited(struct json_object *obj, const char *dname,
>  		smsg = stmp;
>  	}
>  
> -	small_len = dmesg_limit_append(DMESG_LIMIT_MAX_SIZE, small_buf, small_len, dmesg, sdmsg - dmesg);
> +	small_len = dmesg_limit_append(DMESG_LIMIT_MAX_SIZE, small_buf, small_len, dmesg, smsg - dmesg);
>  
>  	len = dmesglen - 1;
>  	smsg = dmesg + len;
> @@ -994,7 +996,9 @@ static void add_dmesg_limited(struct json_object *obj, const char *dname,
>  		small_len = dmesg_limit_append(DMESG_LIMIT_MAX_SIZE, small_buf, small_len, dmesg + len, dmesglen - len);
>  
>  	json_object_object_add(obj, dname,
> -			       new_escaped_json_string(dmsg_small, small_len));
> +			       new_escaped_json_string(small_buf, small_len));
> +
> +	free(small_buf);
>  }
>  
>  static void add_dmesg(struct json_object *obj,
> @@ -1003,14 +1007,14 @@ static void add_dmesg(struct json_object *obj,
>  		      size_t limit)
>  {
>  	if (limit)
> -		add_dmesg_limited(obj, "dmesg", dmesg, dmesglen);
> +		add_dmesg_limited(obj, "dmesg", dmesg, dmesglen, limit);
>  	else
>  		json_object_object_add(obj, "dmesg",
>  				       new_escaped_json_string(dmesg, dmesglen));
>  
>  	if (warnings) {
>  		if (limit)
> -			add_dmesg_limited(obj, "dmesg-warnings", warnings, warningslen);
> +			add_dmesg_limited(obj, "dmesg-warnings", warnings, warningslen, limit);
>  		else
>  			json_object_object_add(obj, "dmesg-warnings",
>  					       new_escaped_json_string(warnings, warningslen));
> @@ -1030,7 +1034,7 @@ static void add_empty_dmesgs_where_missing(struct json_object *tests,
>  		generate_piglit_name(binary, subtests->subs[i].name, piglit_name, sizeof(piglit_name));
>  		current_test = get_or_create_json_object(tests, piglit_name);
>  		if (!json_object_object_get_ex(current_test, "dmesg", NULL)) {
> -			add_dmesg(current_test, "", 0, NULL, 0);
> +			add_dmesg(current_test, "", 0, NULL, 0, 0);
>  		}
>  
>  		for (k = 0; k < subtests->subs[i].dynamic_size; k++) {
> @@ -1038,14 +1042,14 @@ static void add_empty_dmesgs_where_missing(struct json_object *tests,
>  							 dynamic_piglit_name, sizeof(dynamic_piglit_name));
>  			current_test = get_or_create_json_object(tests, dynamic_piglit_name);
>  			if (!json_object_object_get_ex(current_test, "dmesg", NULL)) {
> -				add_dmesg(current_test, "", 0, NULL, 0);
> +				add_dmesg(current_test, "", 0, NULL, 0, 0);
>  			}
>  		}
>  	}
>  
>  }
>  
> -static bool fill_from_dmesg(int fd,
> +static bool fill_from_dmesg(int fd, char *dirname,
>  			    struct settings *settings,
>  			    char *binary,
>  			    struct subtest_list *subtests,
> @@ -1076,7 +1080,7 @@ static bool fill_from_dmesg(int fd,
>  		return false;
>  	}
>  
> -	if (!fstat(f, &st)) {
> +	if (!fstat(fd, &st)) {
>  		fprintf(stderr, "Cannot stat file, errno: %d\n", errno);
>  		fclose(f);
>  		return false;
> @@ -1201,6 +1205,14 @@ static bool fill_from_dmesg(int fd,
>  	free(dynamic_warnings);
>  	g_regex_unref(re);
>  	fclose(f);
> +
> +	if (limit) {
> +		char comp[PATH_MAX + 256];
> +
> +		snprintf(comp, sizeof(comp), "%s %s/%s/%s", compressor_name, settings->results_path, dirname, "dmesg.txt");
> +		system(comp);
> +	}
> +
>  	return true;
>  }
>  
> @@ -2210,7 +2222,7 @@ static void add_to_totals(const char *binary,
>  	}
>  }
>  
> -static bool parse_test_directory(int dirfd,
> +static bool parse_test_directory(int dirfd, char *dirname,
>  				 struct job_list_entry *entry,
>  				 struct settings *settings,
>  				 struct results *results)
> @@ -2251,7 +2263,7 @@ static bool parse_test_directory(int dirfd,
>  		}
>  	}
>  
> -	if (!fill_from_dmesg(fds[_F_DMESG], settings, entry->binary, &subtests, results->tests)) {
> +	if (!fill_from_dmesg(fds[_F_DMESG], dirname, settings, entry->binary, &subtests, results->tests)) {
>  		fprintf(stderr, "Error parsing output files (dmesg.txt)\n");
>  		status = false;
>  		goto parse_output_end;
> @@ -2400,7 +2412,7 @@ struct json_object *generate_results_json(int dirfd)
>  			continue;
>  		}
>  
> -		if (!parse_test_directory(testdirfd, &job_list.entries[i], &settings, &results)) {
> +		if (!parse_test_directory(testdirfd, name, &job_list.entries[i], &settings, &results)) {
>  			close(testdirfd);
>  			return NULL;
>  		}
