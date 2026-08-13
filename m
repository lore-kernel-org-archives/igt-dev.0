Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B01C5C5B572
	for <igt-dev@archiver.kernel.org>; Thu, 13 Aug 2026 14:15:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2250910E054;
	Thu, 13 Aug 2026 14:15:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aDR0icru";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DCEB10E054
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2026 14:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786630499; x=1818166499;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=jORwBVBpFP/vytCnB8QywrKCq8CBix8+/aDaYYn3E5Y=;
 b=aDR0icrulrBo9YjDxr49Ju6e0uT6mKSq1Cnzc2aRkS+GUEANxT/fO6r1
 N9YgP+hrMK6MKTENKyqZ6VZZQUXdHxa2WF4R9/MbE0sytsomezt4jhC/q
 iBxL3ahS9HeNd9lD8j/D51wDByhWd6A40IHBTABDeCfeWmRkDpEM171xr
 VFIDrncjuwfS6b1yzSlJuOxenRAtvT+D4V8QhqfCpwZknRKzit613ETdr
 PUrNN0kTmAuQdCKnFrW3GD4CfbjE24q1dLOM+mOfExA5ERzGO39JhAv08
 izl15lu6BYCS1oNxVzY1iLgGPx/SWKKxdhqziu+x1e85y49zxmCyGKkfr g==;
X-CSE-ConnectionGUID: iPzz6GigTUC4tKD9u1m8Vw==
X-CSE-MsgGUID: 9my3Ml6sTUafiisXtn23+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="97551199"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="97551199"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 07:14:58 -0700
X-CSE-ConnectionGUID: vOhWY7E3Qaa360LZEt/nhA==
X-CSE-MsgGUID: VWctbrlDTW+LchjGa5eofg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="267466210"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 07:14:57 -0700
Date: Thu, 13 Aug 2026 16:14:54 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mark Yacoub <markyacoub@google.com>
Cc: igt-dev@lists.freedesktop.org, louis.chauvet@bootlin.com
Subject: Re: [PATCH v4] lib/igt_rc: Introduce generic config parser
Message-ID: <20260813141454.rp5e4ggtu4itgxhe@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mark Yacoub <markyacoub@google.com>, igt-dev@lists.freedesktop.org,
 louis.chauvet@bootlin.com
References: <20260720185026.93121-1-markyacoub@google.com>
 <20260812145822.3349593-1-markyacoub@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260812145822.3349593-1-markyacoub@google.com>
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
On 2026-08-12 at 10:58:09 -0400, Mark Yacoub wrote:
> Currently, libraries like unigraf and igt_core explicitly rely on GKeyFile
> for reading configuration from .igtrc. Android builds do not
> natively supply glib, meaning these tools cannot be cleanly
> compiled.
> 
> This patch abstracts config parsing into a dedicated `igt_rc` module.
> To avoid platform-specific diverging implementations and glib dependencies,
> `igt_rc` now natively parses `.igtrc` using a stripped-down, thread-safe
> `igt_list` implementation for all platforms.
> 

Please rebase on current IGT sources as there is now lib/igt_rc.c
from tools changes here: https://patchwork.freedesktop.org/series/170485/
tools: remove unnecessary shared library dependencies from standalone tools

Also, please change subject, or add a cover letter to this one
patch, as now patchwork lumps together this with your old series.
I suggest, for example:

[PATCH v5] lib/igt_rc: Create generic config parser

or

[PATCH v5] lib/igt_rc: Add generic config parser

or with cover letter you are free to make other uniqe subject
and keep current one unchanged.


Regards,
Kamil

PS. please also do not link new patches to old ones with X-header-line,
this also applies to your last change
[v2] tests/unigraf: Enhance link rate support checking and hardware retrain timing
Now a series is marked by patchwork with: 
SERIES REVISION LOOKS STRANGE. Please double-check patch list and the ordering before proceeding.

See https://patchwork.freedesktop.org/series/170509/

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
>  - Update pointer assignments, array indexing [0], and public docstrings (Louis Chauvet).
> 
> v2:
>  - Drop the GKeyFile abstraction fakes from android/glib.h.
>  - Introduce a generic wrapper (igt_rc.h) instead of modifying glib.h.
> ---
>  lib/igt_core.c               |   7 +-
>  lib/igt_rc.c                 | 245 +++++++++++++++++++++++++++++++++++
>  lib/igt_rc.h                 |   6 +
>  lib/meson.build              |   1 +
>  lib/vendor/unigraf/unigraf.c |  92 ++++++-------
>  5 files changed, 293 insertions(+), 58 deletions(-)
>  create mode 100644 lib/igt_rc.c
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index a7c097d9e..433727644 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -1044,16 +1044,11 @@ static void common_init_config(void)
>  	if (ret != 0)
>  		igt_set_autoresume_delay(ret);
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
> diff --git a/lib/igt_rc.c b/lib/igt_rc.c
> new file mode 100644
> index 000000000..2a1cd0532
> --- /dev/null
> +++ b/lib/igt_rc.c
> @@ -0,0 +1,245 @@
> +#include "igt_rc.h"
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <errno.h>
> +#include <locale.h>
> +#include <string.h>
> +#include <strings.h>
> +#include <ctype.h>
> +#include <pthread.h>
> +#include <limits.h>
> +#include "igt_list.h"
> +
> +struct igt_key_entry {
> +	char *group;
> +	char *key;
> +	char *value;
> +	struct igt_list_head link;
> +};
> +
> +static IGT_LIST_HEAD(rc_entries);
> +static pthread_once_t rc_once_control = PTHREAD_ONCE_INIT;
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
> +	char *config_path = getenv("IGT_CONFIG_PATH");
> +	if (config_path) {
> +		snprintf(path, sizeof(path), "%s", config_path);
> +	} else {
> +		char *home = getenv("HOME");
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
> diff --git a/lib/igt_rc.h b/lib/igt_rc.h
> index d871b3b26..f5f8d6081 100644
> --- a/lib/igt_rc.h
> +++ b/lib/igt_rc.h
> @@ -1,3 +1,4 @@
> +#include <stdbool.h>
>  /*
>   * Copyright © 2017 Intel Corporation
>   *
> @@ -33,4 +34,9 @@
>  
>  extern GKeyFile *igt_key_file;
>  
> +char *igt_rc_get_string(const char *group_name, const char *key);
> +bool igt_rc_get_boolean(const char *group_name, const char *key, bool *out);
> +bool igt_rc_get_integer(const char *group_name, const char *key, int *out);
> +bool igt_rc_get_double(const char *group_name, const char *key, double *out);
> +
>  #endif /* IGT_RC_H */
> diff --git a/lib/meson.build b/lib/meson.build
> index 12d78de20..5348f2da0 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -97,6 +97,7 @@ lib_sources = [
>  	'igt_kms.c',
>  	'igt_fb.c',
>  	'igt_core.c',
> +	'igt_rc.c',
>  	'igt_dir.c',
>  	'igt_draw.c',
>  	'igt_list.c',
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
> 2.55.0.679.g6767b8d81c-goog
> 
