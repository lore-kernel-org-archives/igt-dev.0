Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E6BC5DF7D
	for <igt-dev@archiver.kernel.org>; Fri, 21 Aug 2026 13:51:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23BE810E27F;
	Fri, 21 Aug 2026 13:51:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ngNg0Rpc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C492D10E2B8
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Aug 2026 13:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787320256; x=1818856256;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=IvOG5B46bbSbxTiNxOLHrhZn2z9oBsG+op36wyIHElg=;
 b=ngNg0RpcRlOLqzDzTu0pcCYtM0BeRENTViTITYPgPoqv019bI78vDNXm
 jwlXOMI+oS591YmDrRRKHdQ+OdAo81mgYbIJUeQavhuRBJazM5JRf5j70
 uVBNjVUbD7+xadsg15tREddpGtAucw/ICJP6S1wvE8XDMAkk9QAJDBTIl
 kaJIGjHIJmTdRzG0onhLzfdlnD+JaEIUWcpoRN5fyvrQWsEHiBHJZzcmx
 +p2wR+axQOqBFWeiJJANkvN6Ch0S57FjHK5BzE/C1ejYBvzFlrt2EgJ/K
 bhdEzjBal9SFrqlPLwB2nGmrbqMB3XFiPqweWGhvbM5qmmy4c8OOCsYli Q==;
X-CSE-ConnectionGUID: crzF0sC8RCOKWxAemzRbsg==
X-CSE-MsgGUID: XREO603nSP+CBUVDZbuLaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="86816903"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="86816903"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 06:50:55 -0700
X-CSE-ConnectionGUID: EHjyeDrDR66UeBpIosuh1A==
X-CSE-MsgGUID: mwkqMIQ0RDmF2g8iwUhbbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="269831166"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 06:50:54 -0700
Date: Fri, 21 Aug 2026 15:50:37 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mark Yacoub <markyacoub@google.com>
Cc: igt-dev@lists.freedesktop.org, louis.chauvet@bootlin.com,
 sebastian.brzezinka@intel.com
Subject: Re: [PATCH v6] lib/igt_rc: Introduce generic config parser
Message-ID: <20260821135037.nlaexgbnunzwm7i5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mark Yacoub <markyacoub@google.com>, igt-dev@lists.freedesktop.org,
 louis.chauvet@bootlin.com, sebastian.brzezinka@intel.com
References: <20260819142337.3232406-1-markyacoub@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260819142337.3232406-1-markyacoub@google.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Mark,
On 2026-08-19 at 10:23:34 -0400, Mark Yacoub wrote:
> Currently, libraries like unigraf and igt_core explicitly rely on
> GKeyFile for reading configuration from .igtrc. Android builds do
> not natively supply GLib, meaning these tools cannot be cleanly
> compiled.
> 
> This patch avoids platform-specific diverging implementations by
> dropping the native GLib dependency from generic configuration access
> and parsing `.igtrc` natively using a stripped-down `igt_list`
> implementation.
> 
> To prevent regressions for deeply-entrenched legacy Linux tools (such
> as Chamelium), the native GLib fallback `GKeyFile` structures are
> retained and populated parallel to the generic parser at startup.

Please move cc,  s-o-b, and ack and/or r-b here, and add version
info after a line starting with '---' so it will not enter git
log history.

Few more nits below.

> 
> v6:
>  - Drop pthread_once dependency and expose idempotent igt_rc_init()
>    to fix armhf linking (Kamil).
>  - Replace __attribute__((destructor)) with explicit igt_rc_free()
>    called during igt_exit().
>  - Add 32-bit INT bounds checking in igt_rc_get_integer().
>  - Optimize igt_rc_get_string() using reverse list traversal for fast
>    INI override matching.
>  - Fix trailing whitespace and header comment formatting flagged by
>    checkpatch.pl.
> 
> v5:
>  - Rebased onto upstream 'lib/igt_core: move igt_load_igtrc to igt_rc'
>  - Safely run GLib loader parallel to generic parser at startup for
>    Chamelium
> 
> v4:
>  - Implement igt_rc_get_double() to parse floating point configs
>    natively.
>  - Migrate igt_core.c over to igt_rc_get_double() to drop GKeyFile
>    dependencies.
>  - Add robust standard bounds checking (ERANGE and unmatched digits)
>    to number parsers.
> 
> v3:
>  - Drop Android-specific fallback paths; use IGT_CONFIG_PATH natively.
>  - Drop glib Linux wrappers entirely; unify a single generic parser for
>    all platforms.
>  - Port manual linked-list tracking over to standard igt_list.h APIs.
>  - Inherit base 0 for strtol to safely parse hex masks.
>  - Use robust PATH_MAX for dynamic config paths.
>  - Update pointer assignments, array indexing [0], and public
>    docstrings.
> 
> v2:
>  - Drop the GKeyFile abstraction fakes from android/glib.h.
>  - Introduce a generic wrapper (igt_rc.h) instead of modifying glib.h.
> 
> Signed-off-by: Mark Yacoub <markyacoub@google.com>
> ---
>  lib/igt_core.c               |  39 ++----
>  lib/igt_rc.c                 | 248 ++++++++++++++++++++++++++++++++++-
>  lib/igt_rc.h                 |  12 +-
>  lib/vendor/unigraf/unigraf.c |  92 ++++++-------
>  4 files changed, 303 insertions(+), 88 deletions(-)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 2f737b01a..93489dffc 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -974,39 +974,25 @@ static void oom_adjust_for_doom(void)
>  
>  static void common_init_config(void)
>  {
> -	GError *error = NULL;
>  	int ret = 0;
>  	static double timeout = 0.0;
>  
> -	igt_key_file = igt_load_igtrc();
> -
> -	if (igt_key_file && !igt_frame_dump_path)
> -		igt_frame_dump_path =
> -			g_key_file_get_string(igt_key_file, "Common",
> -					      "FrameDumpPath", &error);
> -
> -	g_clear_error(&error);
> -
> -	if (igt_key_file)
> -		ret = g_key_file_get_integer(igt_key_file, "DUT", "SuspendResumeDelay",
> -					     &error);
> -	assert(!error || error->code != G_KEY_FILE_ERROR_INVALID_VALUE);
>  
> -	g_clear_error(&error);
> +	igt_rc_init();
> +	igt_key_file = igt_load_igtrc();
> +	if (!igt_frame_dump_path)
> +		igt_frame_dump_path = igt_rc_get_string("Common", "FrameDumpPath");
>  
> -	if (ret != 0)
> -		igt_set_autoresume_delay(ret);
> +	if (igt_rc_get_integer("DUT", "SuspendResumeDelay", &ret)) {
> +		if (ret != 0)
> +			igt_set_autoresume_delay(ret);
> +	}
>  
> -	if (igt_key_file)
> -		timeout = g_key_file_get_double(igt_key_file, "DUT", "DisplayDetectTimeout",
> -						&error);
> -	if (error) {
> +	if (!igt_rc_get_double("DUT", "DisplayDetectTimeout", &timeout)) {
>  		igt_debug("Failed to read DisplayDetectTimeout, defaulting to %f\n",
>  			  DEFAULT_DETECT_TIMEOUT);
> -		g_clear_error(&error);
>  		timeout = DEFAULT_DETECT_TIMEOUT;
>  	}
> -	g_clear_error(&error);
>  	igt_set_default_display_detect_timeout(timeout);
>  
>  	/* Adding filters, order .igtrc, IGT_DEVICE, --device filter */
> @@ -1016,11 +1002,7 @@ static void common_init_config(void)
>  		if (igt_rc_device) {
>  			igt_debug("Notice: using IGT_DEVICE env:\n");
>  		} else {
> -			if (igt_key_file)
> -				igt_rc_device =	g_key_file_get_string(igt_key_file,
> -								      "Common",
> -								      "Device", &error);
> -			g_clear_error(&error);
> +			igt_rc_device = igt_rc_get_string("Common", "Device");
>  			if (igt_rc_device)
>  				igt_debug("Notice: using .igtrc "
>  					  "Common::Device:\n");
> @@ -2374,6 +2356,7 @@ void igt_exit(void)
>  
>  	if (igt_key_file)
>  		g_key_file_free(igt_key_file);
> +	igt_rc_free();
>  
>  	if (run_single_subtest && !run_single_subtest_found) {
>  		igt_critical("Unknown subtest: %s\n", run_single_subtest);
> diff --git a/lib/igt_rc.c b/lib/igt_rc.c
> index b7f1731fe..4ae0acab5 100644
> --- a/lib/igt_rc.c
> +++ b/lib/igt_rc.c
> @@ -3,16 +3,252 @@
>   * Copyright © 2026 Intel Corporation
>   */
>  
> +#include "igt_rc.h"

Please move it after include igt_list.h below.

> +
> +#include <ctype.h>
> +#include <errno.h>
> +#include <limits.h>
> +#include <locale.h>
>  #include <stdio.h>
>  #include <stdlib.h>
> +#include <string.h>
> +#include <strings.h>
>  
> -#ifndef ANDROID
> -#include <glib.h>
> -#else
> -#include "android/glib.h"
> -#endif
> +#include "igt_list.h"
>  
> -#include "igt_rc.h"

Add newline after include.

> +struct igt_key_entry {
> +	char *group;
> +	char *key;
> +	char *value;
> +	struct igt_list_head link;
> +};
> +
> +static IGT_LIST_HEAD(rc_entries);
> +
> +static char *trim_whitespace(char *str)
> +{
> +	char *end;
> +
> +	while (isspace((unsigned char)str[0]))
> +		str++;
> +
> +	if (str[0] == 0)
> +		return str;
> +
> +	end = str + strlen(str) - 1;
> +	while (end > str && isspace((unsigned char)end[0]))
> +		end--;
> +
> +	end[1] = '\0';
> +	return str;
> +}
> +
> +void igt_rc_init(void)
> +{
> +	FILE *fp;
> +	char *line = NULL;
> +	size_t len = 0;
> +	ssize_t read;
> +	char *current_group = NULL;
> +	char path[PATH_MAX];
> +
> +	if (!igt_list_empty(&rc_entries))
> +		return;
> +
> +	char *config_path = getenv("IGT_CONFIG_PATH");

This should be declared above, and here only:
	config_path = getenv("IGT_CONFIG_PATH");

Now I see compiler warning:

../lib/igt_rc.c:58:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
   58 |         char *config_path = getenv("IGT_CONFIG_PATH");
      |         ^~~~

> +
> +	if (config_path) {
> +		snprintf(path, sizeof(path), "%s", config_path);
> +	} else {
> +		char *home = getenv("HOME");
> +
> +		if (!home)
> +			home = "";

../lib/igt_rc.c:66:30: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
   66 |                         home = "";
      |                              ^

You can avoid it with:
		const char *home = getenv("HOME") ?: "";

> +		snprintf(path, sizeof(path), "%s/.igtrc", home);

or use it in this snprintf:
		const char *home = getenv("HOME");

		snprintf(path, sizeof(path), "%s/.igtrc", home ? home : "");


> +	}
> +
> +	fp = fopen(path, "r");

Can you avoid using fopen() in favor of open()?

> +	if (!fp)
> +		return;
> +
> +	while ((read = getline(&line, &len, fp)) != -1) {

Here also, can you just read all file into allocated buffer
with one read, and then parse it?

Regards,
Kamil

> +		char *trimmed = trim_whitespace(line);
> +
> +		if (trimmed[0] == '\0' || trimmed[0] == '#' || trimmed[0] == ';')
> +			continue;
> +
> +		if (trimmed[0] == '[' && trimmed[strlen(trimmed) - 1] == ']') {
> +			free(current_group);
> +			trimmed[strlen(trimmed) - 1] = '\0';
> +			current_group = strdup(trimmed + 1);
> +			continue;
> +		}
> +
> +		if (current_group) {
> +			char *eq = strchr(trimmed, '=');
> +
> +			if (eq) {
> +				char *key;
> +				char *value;
> +				struct igt_key_entry *entry;
> +
> +				eq[0] = '\0';
> +				value = eq + 1;
> +				key = trim_whitespace(trimmed);
> +				value = trim_whitespace(value);
> +
> +				entry = calloc(1, sizeof(*entry));
> +				entry->group = strdup(current_group);
> +				entry->key = strdup(key);
> +				entry->value = strdup(value);
> +				igt_list_add_tail(&entry->link, &rc_entries);
> +			}
> +		}
> +	}
> +
> +	free(current_group);
> +	free(line);
> +	fclose(fp);
> +}
> +
> +void igt_rc_free(void)
> +{
> +	struct igt_key_entry *curr, *tmp;
> +
> +	igt_list_for_each_entry_safe(curr, tmp, &rc_entries, link) {
> +		free(curr->group);
> +		free(curr->key);
> +		free(curr->value);
> +		free(curr);
> +	}
> +	IGT_INIT_LIST_HEAD(&rc_entries);
> +}
> +
> +/**
> + * igt_rc_get_string:
> + * @group_name: The group name in the config file.
> + * @key: The key to look up.
> + *
> + * Looks up a string configuration value in the `.igtrc` file.
> + * The returned string is newly allocated and must be freed by
> + * the caller using free().
> + *
> + * Returns: A newly allocated string containing the value, or NULL if not found.
> + */
> +char *igt_rc_get_string(const char *group_name, const char *key)
> +{
> +	struct igt_key_entry *curr;
> +
> +	igt_list_for_each_entry_reverse(curr, &rc_entries, link) {
> +		if (strcmp(curr->group, group_name) == 0 && strcmp(curr->key, key) == 0)
> +			return strdup(curr->value);
> +	}
> +
> +	return NULL;
> +}
> +
> +/**
> + * igt_rc_get_boolean:
> + * @group_name: The group name in the config file.
> + * @key: The key to look up.
> + * @out: Pointer to a boolean where the result will be stored.
> + *
> + * Looks up a boolean configuration value in the `.igtrc` file.
> + * Parses standard boolean representations like "true", "false", "1", "0".
> + *
> + * Returns: true if the key exists and was successfully parsed, false otherwise.
> + */
> +bool igt_rc_get_boolean(const char *group_name, const char *key, bool *out)
> +{
> +	char *val = igt_rc_get_string(group_name, key);
> +
> +	if (!val)
> +		return false;
> +
> +	if (strcasecmp(val, "true") == 0 || strcmp(val, "1") == 0) {
> +		*out = true;
> +	} else if (strcasecmp(val, "false") == 0 || strcmp(val, "0") == 0) {
> +		*out = false;
> +	} else {
> +		free(val);
> +		return false;
> +	}
> +
> +	free(val);
> +	return true;
> +}
> +
> +/**
> + * igt_rc_get_integer:
> + * @group_name: The group name in the config file.
> + * @key: The key to look up.
> + * @out: Pointer to an integer where the result will be stored.
> + *
> + * Looks up an integer configuration value in the `.igtrc` file.
> + *
> + * Returns: true if the key exists and was successfully parsed, false otherwise.
> + */
> +bool igt_rc_get_integer(const char *group_name, const char *key, int *out)
> +{
> +	char *val = igt_rc_get_string(group_name, key);
> +	char *endptr;
> +	long lval;
> +
> +	if (!val)
> +		return false;
> +
> +	errno = 0;
> +	lval = strtol(val, &endptr, 0);
> +	if (endptr == val || endptr[0] != '\0' || errno == ERANGE ||
> +	    lval < INT_MIN || lval > INT_MAX) {
> +		free(val);
> +		return false;
> +	}
> +
> +	*out = (int)lval;
> +	free(val);
> +	return true;
> +}
> +
> +/**
> + * igt_rc_get_double:
> + * @group_name: The group name in the config file.
> + * @key: The key to look up.
> + * @out: Pointer to a double where the result will be stored.
> + *
> + * Looks up a double configuration value in the `.igtrc` file.
> + *
> + * Returns: true if the key exists and was successfully parsed, false otherwise.
> + */
> +bool igt_rc_get_double(const char *group_name, const char *key, double *out)
> +{
> +	char *val = igt_rc_get_string(group_name, key);
> +	char *endptr;
> +	double dval;
> +	char *dot;
> +	struct lconv *lc;
> +
> +	if (!val)
> +		return false;
> +
> +	/* Handle locale-specific decimal separator for strtod */
> +	dot = strchr(val, '.');
> +	lc = localeconv();
> +	if (dot && lc && lc->decimal_point && lc->decimal_point[0] != '.') {
> +		*dot = lc->decimal_point[0];
> +	}

You do not need braces for single-line of code.

> +
> +	errno = 0;
> +	dval = strtod(val, &endptr);
> +	if (endptr == val || endptr[0] != '\0' || errno == ERANGE) {
> +		free(val);
> +		return false;
> +	}
> +
> +	*out = dval;
> +	free(val);
> +	return true;
> +}
>  
>  /**
>   * igt_load_igtrc:
> diff --git a/lib/igt_rc.h b/lib/igt_rc.h
> index 3b7179808..61f883ee1 100644
> --- a/lib/igt_rc.h
> +++ b/lib/igt_rc.h
> @@ -21,10 +21,11 @@
>   * IN THE SOFTWARE.
>   */
>  
> -
>  #ifndef IGT_RC_H
>  #define IGT_RC_H
>  
> +#include <stdbool.h>
> +
>  #ifndef ANDROID
>  #include <glib.h>
>  #else
> @@ -32,7 +33,14 @@
>  #endif
>  
>  extern GKeyFile *igt_key_file;
> -
>  struct _GKeyFile *igt_load_igtrc(void);
>  
> +void igt_rc_init(void);
> +void igt_rc_free(void);
> +
> +char *igt_rc_get_string(const char *group_name, const char *key);
> +bool igt_rc_get_boolean(const char *group_name, const char *key, bool *out);
> +bool igt_rc_get_integer(const char *group_name, const char *key, int *out);
> +bool igt_rc_get_double(const char *group_name, const char *key, double *out);
> +
>  #endif /* IGT_RC_H */
> diff --git a/lib/vendor/unigraf/unigraf.c b/lib/vendor/unigraf/unigraf.c
> index 30ee3c72b..a6b3008eb 100644
> --- a/lib/vendor/unigraf/unigraf.c
> +++ b/lib/vendor/unigraf/unigraf.c
> @@ -364,7 +364,6 @@ int unigraf_get_connector_id_by_stream(int drm_fd, int stream_id)
>  bool unigraf_open_device(int drm_fd)
>  {
>  	TSI_RESULT r;
> -	GError *cfg_error = NULL;
>  	char *cfg_device = NULL;
>  	char *cfg_role = NULL;
>  	char *cfg_input = NULL;
> @@ -382,63 +381,52 @@ bool unigraf_open_device(int drm_fd)
>  
>  	unigraf_init();
>  
> -	if (igt_key_file) {
> -		cfg_device = g_key_file_get_string(igt_key_file, UNIGRAF_CONFIG_GROUP,
> -						   UNIGRAF_CONFIG_DEVICE_NAME, &cfg_error);
> -		if (cfg_error) {
> -			unigraf_debug("No device name configured, uses first device available.\n");
> -			cfg_device = NULL;
> -		}
> +	cfg_device = igt_rc_get_string(UNIGRAF_CONFIG_GROUP,
> +				       UNIGRAF_CONFIG_DEVICE_NAME);
> +	if (!cfg_device) {
> +		unigraf_debug("No device name configured, uses first device available.\n");
> +		cfg_device = NULL;
> +	}
>  
> -		cfg_error = NULL;
> -		cfg_role = g_key_file_get_string(igt_key_file, UNIGRAF_CONFIG_GROUP,
> -						 UNIGRAF_CONFIG_DEVICE_ROLE, &cfg_error);
> -		if (cfg_error) {
> -			unigraf_debug("No device role configured.\n");
> -			cfg_role = NULL;
> -		}
> +	cfg_role = igt_rc_get_string(UNIGRAF_CONFIG_GROUP,
> +				     UNIGRAF_CONFIG_DEVICE_ROLE);
> +	if (!cfg_role) {
> +		unigraf_debug("No device role configured.\n");
> +		cfg_role = NULL;
> +	}
>  
> -		cfg_error = NULL;
> -		cfg_input = g_key_file_get_string(igt_key_file, UNIGRAF_CONFIG_GROUP,
> -						  UNIGRAF_CONFIG_INPUT_NAME, &cfg_error);
> -		if (cfg_error) {
> -			unigraf_debug("No input name configured.\n");
> -			cfg_input = NULL;
> -		}
> +	cfg_input = igt_rc_get_string(UNIGRAF_CONFIG_GROUP,
> +				      UNIGRAF_CONFIG_INPUT_NAME);
> +	if (!cfg_input) {
> +		unigraf_debug("No input name configured.\n");
> +		cfg_input = NULL;
> +	}
>  
> -		cfg_error = NULL;
> -		unigraf_connector_name = g_key_file_get_string(igt_key_file, UNIGRAF_CONFIG_GROUP,
> -							       UNIGRAF_CONFIG_CONNECTOR_NAME,
> -							       &cfg_error);
> -		if (cfg_error) {
> -			unigraf_debug("No connector name configured, will autodetect.\n");
> -			unigraf_connector_name = NULL;
> -		}
> +	unigraf_connector_name = igt_rc_get_string(UNIGRAF_CONFIG_GROUP,
> +						   UNIGRAF_CONFIG_CONNECTOR_NAME);
> +	if (!unigraf_connector_name) {
> +		unigraf_debug("No connector name configured, will autodetect.\n");
> +		unigraf_connector_name = NULL;
> +	}
>  
> -		cfg_error = NULL;
> -		cfg_edid_name = g_key_file_get_string(igt_key_file, UNIGRAF_CONFIG_GROUP,
> -						      UNIGRAF_CONFIG_EDID_NAME, &cfg_error);
> -		if (cfg_error) {
> -			unigraf_debug("No default EDID set, use IGT default.\n");
> -			cfg_edid_name = NULL;
> -		}
> +	cfg_edid_name = igt_rc_get_string(UNIGRAF_CONFIG_GROUP,
> +					  UNIGRAF_CONFIG_EDID_NAME);
> +	if (!cfg_edid_name) {
> +		unigraf_debug("No default EDID set, using IGT default.\n");
> +		cfg_edid_name = NULL;
> +	}
>  
> -		cfg_error = NULL;
> -		unigraf_crc = g_key_file_get_boolean(igt_key_file, UNIGRAF_CONFIG_GROUP,
> -						     UNIGRAF_CONFIG_USE_CRC_NAME, &cfg_error);
> -		if (cfg_error) {
> -			unigraf_debug("CRC usage not configured, using unigraf CRC.\n");
> -			unigraf_crc = true;
> -		}
> +	if (!igt_rc_get_boolean(UNIGRAF_CONFIG_GROUP,
> +				UNIGRAF_CONFIG_USE_CRC_NAME, &unigraf_crc)) {
> +		unigraf_debug("CRC usage not configured, using unigraf CRC.\n");
> +		unigraf_crc = true;
> +	}
>  
> -		cfg_error = NULL;
> -		unigraf_stream_count = g_key_file_get_integer(igt_key_file, UNIGRAF_CONFIG_GROUP,
> -							      UNIGRAF_CONFIG_MST_STREAM_COUNT,
> -							      &cfg_error);
> -		if (cfg_error) {
> -			unigraf_debug("MST usage not configured, using SST.\n");
> -			unigraf_stream_count = 0;
> -		}
> +	if (!igt_rc_get_integer(UNIGRAF_CONFIG_GROUP,
> +				UNIGRAF_CONFIG_MST_STREAM_COUNT,
> +				&unigraf_stream_count)) {
> +		unigraf_debug("MST usage not configured, using SST.\n");
> +		unigraf_stream_count = 0;
>  	}
>  
>  	unigraf_assert(TSIX_DEV_RescanDevices(0, TSI_DEVCAP_VIDEO_CAPTURE, 0));
> -- 
> 2.55.0.737.g08866a6d13-goog
> 
