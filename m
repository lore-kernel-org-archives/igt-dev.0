Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24EBC5DF70
	for <igt-dev@archiver.kernel.org>; Mon, 17 Aug 2026 17:04:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B1FA10E425;
	Mon, 17 Aug 2026 17:04:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bpfIvZaj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB5B10E425
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Aug 2026 17:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786986236; x=1818522236;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=qeUNV6b8ZSA/wMuJk+eSSPHJdIR5/0gG6koLDq4WqJA=;
 b=bpfIvZaj9wodATDJQmINzNM6aoXX6B+KfFu2h8U59LTSCye2Mq46z24y
 9fGH4RqbaUIXR0FhGUPBHQje6z96JspkS8XU+l7eFhv3tIweCo4AVAHX4
 6jYSIJBENNHhZJSIkbCBDFCwVpQgpFAFwngl70Fb0FhURI38bJzQFVffy
 9r1Nc9Q5NygFLWmI/ebvc0YWB7SsB/TOnoTgAhMdF/Hf+/5hdF3GGTFbJ
 5OV6pS7tmzmOC1GzG9k0WWeq7IAUWK9LhgIxbok5XspDXMJtiHXhmTFV4
 KmDoi6WlYCisSFYvlKf1JOjsCZHzUNjeidXo9AhnzNS9zWW7rfyn7Y3k6 g==;
X-CSE-ConnectionGUID: fQdJCCJFSVuiuqFeSemFBg==
X-CSE-MsgGUID: eQQbycKmQCOmnka+oBwf8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="91279407"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; d="scan'208";a="91279407"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 10:03:55 -0700
X-CSE-ConnectionGUID: SpaQF8w3Ri62lO139399+A==
X-CSE-MsgGUID: nilcufI8TYalB2vQ5rj0iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; d="scan'208";a="289773507"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 10:03:54 -0700
Date: Mon, 17 Aug 2026 19:03:52 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mark Yacoub <markyacoub@google.com>
Cc: igt-dev@lists.freedesktop.org, louis.chauvet@bootlin.com,
 sebastian.brzezinka@intel.com
Subject: Re: [PATCH v5] lib/igt_rc: Introduce generic config parser
Message-ID: <20260817170352.q2rtta7jtbr4bqte@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mark Yacoub <markyacoub@google.com>, igt-dev@lists.freedesktop.org,
 louis.chauvet@bootlin.com, sebastian.brzezinka@intel.com
References: <20260813162602.2250541-1-markyacoub@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260813162602.2250541-1-markyacoub@google.com>
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
On 2026-08-13 at 12:25:59 -0400, Mark Yacoub wrote:
> Currently, libraries like unigraf and igt_core explicitly rely on GKeyFile
> for reading configuration from .igtrc. Android builds do not natively supply
> GLib, meaning these tools cannot be cleanly compiled.
> 
> This patch avoids platform-specific diverging implementations by dropping
> the native GLib dependency from generic configuration access and parsing
> `.igtrc` natively using a stripped-down, thread-safe `igt_list` implementation.
> 
> To prevent regressions for deeply-entrenched legacy Linux tools (such as Chamelium),
> the native GLib fallback `GKeyFile` structures are retained and populated
> parallel to the generic parser at startup.
> 
> v5:
>  - Rebased onto upstream 'lib/igt_core: move igt_load_igtrc to igt_rc'
>  - Safely run GLib loader parallel to generic parser at startup for Chamelium
> 
> v4:
>  - Implement igt_rc_get_double() to parse floating point configs natively.
>  - Migrate igt_core.c over to igt_rc_get_double() to drop GKeyFile dependencies.
>  - Add robust standard bounds checking (ERANGE and unmatched digits) to number parsers.
> 
> v3:
>  - Drop Android-specific fallback paths; use IGT_CONFIG_PATH natively.
>  - Drop glib Linux wrappers entirely; unify a single generic parser for all platforms.
>  - Port manual linked-list tracking over to standard igt_list.h APIs.
>  - Inherit base 0 for strtol to safely parse hex masks.
>  - Use robust PATH_MAX for dynamic config paths.
>  - Update pointer assignments, array indexing [0], and public docstrings.
> 
> v2:
>  - Drop the GKeyFile abstraction fakes from android/glib.h.
>  - Introduce a generic wrapper (igt_rc.h) instead of modifying glib.h.
> ---
>  lib/igt_core.c               |  37 ++----
>  lib/igt_rc.c                 | 248 ++++++++++++++++++++++++++++++++++-
>  lib/igt_rc.h                 |   6 +
>  lib/vendor/unigraf/unigraf.c |  92 ++++++-------
>  4 files changed, 297 insertions(+), 86 deletions(-)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 2f737b01a..b3efab247 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -974,39 +974,24 @@ static void oom_adjust_for_doom(void)
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
> @@ -1016,11 +1001,7 @@ static void common_init_config(void)
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
> diff --git a/lib/igt_rc.c b/lib/igt_rc.c
> index b7f1731fe..b5035d788 100644
> --- a/lib/igt_rc.c
> +++ b/lib/igt_rc.c
> @@ -3,16 +3,252 @@
>   * Copyright © 2026 Intel Corporation
>   */
>  
> +#include "igt_rc.h"
> +
>  #include <stdio.h>
>  #include <stdlib.h>
> +#include <errno.h>
> +#include <locale.h>
> +#include <string.h>
> +#include <strings.h>
> +#include <ctype.h>
> +#include <pthread.h>
> +#include <limits.h>

Add newline here. Also sort headers above in alphabetic order.

> +#include "igt_list.h"
>  
> -#ifndef ANDROID
> -#include <glib.h>
> -#else
> -#include "android/glib.h"
> -#endif
> +struct igt_key_entry {
> +	char *group;
> +	char *key;
> +	char *value;
> +	struct igt_list_head link;
> +};
>  
> -#include "igt_rc.h"
> +static IGT_LIST_HEAD(rc_entries);
> +static pthread_once_t rc_once_control = PTHREAD_ONCE_INIT;

Please do not use pthread_once_t for one-time init.
You can use same way intel_allocator_init() is called
from igt_core.

Also, this could remove compilation error from armhf:

[1708/1800] Linking target tools/lsgpu
FAILED: tools/lsgpu
/usr/bin/arm-linux-gnueabihf-gcc  -o tools/lsgpu tools/lsgpu.p/lsgpu.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,--start-group lib/libigt_device_scan.a lib/libigt_drm_stub.a lib/libigt_tools_stub.a /usr/lib/arm-linux-gnueabihf/libdrm.so /usr/lib/arm-linux-gnueabihf/libpciaccess.so /usr/lib/arm-linux-gnueabihf/libglib-2.0.so /usr/lib/arm-linux-gnueabihf/libudev.so /usr/lib/arm-linux-gnueabihf/libpci.so -Wl,--end-group
/usr/lib/gcc-cross/arm-linux-gnueabihf/10/../../../../arm-linux-gnueabihf/bin/ld: lib/libigt_device_scan.a(igt_rc.c.o): undefined reference to symbol 'pthread_once@@GLIBC_2.4'
/usr/lib/gcc-cross/arm-linux-gnueabihf/10/../../../../arm-linux-gnueabihf/bin/ld: /lib/arm-linux-gnueabihf/libpthread.so.0: error adding symbols: DSO missing from command line
collect2: error: ld returned 1 exit status
ninja: build stopped: subcommand failed.

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
> +static void load_igtrc_once(void)
> +{
> +	FILE *fp;
> +	char *line = NULL;
> +	size_t len = 0;
> +	ssize_t read;
> +	char *current_group = NULL;
> +	char path[PATH_MAX];
> +

Why newline here?

> +	char *config_path = getenv("IGT_CONFIG_PATH");

Put newline here.

> +	if (config_path) {
> +		snprintf(path, sizeof(path), "%s", config_path);
> +	} else {
> +		char *home = getenv("HOME");

Put newline here.

> +		if (!home)
> +			home = "";
> +		snprintf(path, sizeof(path), "%s/.igtrc", home);
> +	}
> +
> +	fp = fopen(path, "r");
> +	if (!fp)
> +		return;
> +
> +	while ((read = getline(&line, &len, fp)) != -1) {
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
> +__attribute__((destructor))

Please do not use these.

> +static void free_igtrc(void)
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
> +	char *last_match = NULL;
> +	struct igt_key_entry *curr;
> +
> +	pthread_once(&rc_once_control, load_igtrc_once);
> +
> +	igt_list_for_each_entry(curr, &rc_entries, link) {
> +		if (strcmp(curr->group, group_name) == 0 && strcmp(curr->key, key) == 0)
> +			last_match = curr->value;
> +	}
> +
> +	return last_match ? strdup(last_match) : NULL;
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
> +	if (endptr == val || endptr[0] != '\0' || errno == ERANGE) {
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
> +

Why newline here?

Please use checkpatch.pl before sending patch, there was
one whitespace error left.


Regards,
Kamil

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
> index 3b7179808..1fa4f9a11 100644
> --- a/lib/igt_rc.h
> +++ b/lib/igt_rc.h
> @@ -30,9 +30,15 @@
>  #else
>  #include "android/glib.h"
>  #endif
> +#include <stdbool.h>
>  
>  extern GKeyFile *igt_key_file;
>  
>  struct _GKeyFile *igt_load_igtrc(void);
>  
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
> 2.55.0.691.gc56d675ccc-goog
> 
