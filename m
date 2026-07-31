Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B932C5516F
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 17:49:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC9510F38F;
	Fri, 31 Jul 2026 17:49:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="zD7E37LS";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4149189289
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 17:48:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 98F074E4105B;
 Fri, 31 Jul 2026 17:48:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6DC9B6039A;
 Fri, 31 Jul 2026 17:48:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EA3E711C16BDF; 
 Fri, 31 Jul 2026 19:48:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1785520110; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=SpSA12YTFanj2SP0cmChNVTDypn80fubiPyxbYcQqoc=;
 b=zD7E37LSohvOgiEzit6M1BUVLgYu7qWAK1wcLjsc7g8PitpmhcxiFte/8XAulsalhSSaOI
 5FBOghGN4kWPAJMurdJMBQ1gQSFF8GHHzQgHUQUgZW96DF+CGNlkbKaFmfwX/fhDCXSLb9
 MFrlSPwC2FBNR/75ODHFSiM7tlzmNY05UpEheNjbvuVlAq9Q4/IiH5CZ3Rn1smTQfof05o
 MvuGBErQVXA0GJKyf6Qi3NL5E/Co2FhbsrQx3JYZh+LdMYSj1U7dY1XK+rJOfNrL9Q0G/+
 ezTX1ptT9pHLKFIjEtAr1zZe0Dz7UF+YUrCDZtZ394yu3qdJQtL4IRwKp8meuA==
Message-ID: <2a7b89cc-977d-47f9-8b6b-1aa0fcc64ea7@bootlin.com>
Date: Fri, 31 Jul 2026 19:48:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] lib/igt_rc: Introduce generic config parser
To: Mark Yacoub <markyacoub@google.com>, igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com
References: <20260715192949.1984280-1-markyacoub@google.com>
 <20260720185026.93121-1-markyacoub@google.com>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
In-Reply-To: <20260720185026.93121-1-markyacoub@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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



On 7/20/26 20:50, Mark Yacoub wrote:
> Currently, libraries like unigraf explicitly rely on GKeyFile
> for reading configuration from .igtrc. Android builds do not
> natively supply glib, meaning these tools cannot be cleanly
> compiled.
> 
> This patch abstracts config parsing into a dedicated `igt_rc` module.
> On standard Linux, `igt_rc` seamlessly wraps glib's native methods.
> On Android environments, `igt_rc` natively parses `.igtrc` using
> a stripped-down, thread-safe linked-list implementation (lib/android/igt_rc.c).

Can you add documentation to all public functions? I think you must at 
least mention who is responsible to free which pointer.

> v2:
>   - Drop the GKeyFile abstraction fakes from android/glib.h (Review feedback)
>   - Introduce a generic wrapper (igt_rc.h) instead of modifying glib.h.
>   - Provide a pure glib backend for Linux to avoid regressions.
>   - Isolate Android parsing implementation cleanly into lib/android/igt_rc.c.
> ---
>   lib/android/igt_rc.c         | 172 +++++++++++++++++++++++++++++++++++
>   lib/igt_rc.c                 |  61 +++++++++++++
>   lib/igt_rc.h                 |   5 +
>   lib/meson.build              |   1 +
>   lib/vendor/unigraf/unigraf.c |  92 ++++++++-----------
>   5 files changed, 279 insertions(+), 52 deletions(-)
>   create mode 100644 lib/android/igt_rc.c
>   create mode 100644 lib/igt_rc.c
> 
> diff --git a/lib/android/igt_rc.c b/lib/android/igt_rc.c
> new file mode 100644
> index 000000000..6d9b348f7
> --- /dev/null
> +++ b/lib/android/igt_rc.c

I think the goal is to avoid all android-specific implementation, those 
functions should be in the generic igt_rc.c I think.

> @@ -0,0 +1,172 @@
> +#include "igt_rc.h"
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <strings.h>
> +#include <ctype.h>
> +#include <pthread.h>
> +
> +struct igt_key_entry {
> +	char *group;
> +	char *key;
> +	char *value;
> +	struct igt_key_entry *next;
> +};
> +
> +static struct igt_key_entry *rc_entries = NULL;
> +static pthread_once_t rc_once_control = PTHREAD_ONCE_INIT;
> +
> +static char *trim_whitespace(char *str)
> +{
> +	char *end;
> +
> +	while (isspace((unsigned char)*str))
> +		str++;
> +
> +	if (*str == 0)
> +		return str;
> +
> +	end = str + strlen(str) - 1;
> +	while (end > str && isspace((unsigned char)*end))
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
> +	struct igt_key_entry *tail = NULL;
> +	char path[512];
> +
> +	snprintf(path, sizeof(path), "%s/.igtrc", "/data/local/tmp/igt");

I think you must keep the behavior of igt_load_igtrc to choose the file 
and at least keep a way to override this hardcoded path with an 
environment variable.

> +	fp = fopen(path, "r");
> +	if (!fp)
> +		return;
> +
> +	while ((read = getline(&line, &len, fp)) != -1) {
> +		char *trimmed = trim_whitespace(line);
> +
> +		if (*trimmed == '\0' || *trimmed == '#' || *trimmed == ';')

Can you use [0] instead of dereference? It is easier to read.

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
> +				*eq = '\0';

Can you store here the "value" pointer?

value = eq+1;

> +				key = trim_whitespace(trimmed);
> +				value = trim_whitespace(eq + 1);

This way it is easier to understand here that you are trimming a valid data.

> +
> +				entry = calloc(1, sizeof(*entry));
> +				entry->group = strdup(current_group);
> +				entry->key = strdup(key);
> +				entry->value = strdup(value);
> +				entry->next = NULL;
> +
> +				if (!rc_entries) {
> +					rc_entries = entry;
> +					tail = entry;
> +				} else {
> +					tail->next = entry;
> +					tail = entry;
> +				}

I think you could use igt_list.h to avoid this manual manipulation.

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
> +	struct igt_key_entry *curr, *next;
> +
> +	curr = rc_entries;
> +	while (curr) {
> +		next = curr->next;
> +		free(curr->group);
> +		free(curr->key);
> +		free(curr->value);
> +		free(curr);
> +		curr = next;
> +	}

Same thing, I think you can use igt_list_for_each_entry_safe.

> +	rc_entries = NULL;
> +}
> +
> +char *igt_rc_get_string(const char *group_name, const char *key)
> +{
> +	char *last_match = NULL;
> +	struct igt_key_entry *curr;
> +
> +	pthread_once(&rc_once_control, load_igtrc_once);
> +
> +	curr = rc_entries;
> +	while (curr) {

igt_list_for_each_entry

> +		if (strcmp(curr->group, group_name) == 0 && strcmp(curr->key, key) == 0)
> +			last_match = curr->value;
> +		curr = curr->next;
> +	}
> +
> +	return last_match ? strdup(last_match) : NULL;
> +}
> +
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
> +int igt_rc_get_integer(const char *group_name, const char *key, int *out)
> +{
> +	char *val = igt_rc_get_string(group_name, key);
> +	char *endptr;
> +	long lval;
> +
> +	if (!val)
> +		return false;
> +
> +	lval = strtol(val, &endptr, 10);
> +	if (*endptr != '\0') {
> +		free(val);
> +		return false;
> +	}
> +
> +	*out = (int)lval;
> +	free(val);
> +	return true;

I think you should change the return type of the function to be a boolean?

> +}
> diff --git a/lib/igt_rc.c b/lib/igt_rc.c
> new file mode 100644
> index 000000000..31eb07bc0
> --- /dev/null
> +++ b/lib/igt_rc.c
> @@ -0,0 +1,61 @@
> +#include "igt_rc.h"
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <strings.h>
> +#include <ctype.h>
> +
> +#include <glib.h>
> +
> +char *igt_rc_get_string(const char *group_name, const char *key)
> +{
> +	GError *error = NULL;

The goal is to completly replace rc parsing from glib by a custom parser 
(please correct me if I am wrong @Kamil).

So I think here you can just copy/paste the code you created for android.

And I think there are more places where you should replace 
g_key_file_get_* functions.

> +	char *val;
> +
> +	if (!igt_key_file)
> +		return NULL;
> +
> +	val = g_key_file_get_string(igt_key_file, group_name, key, &error);
> +	if (error) {
> +		g_error_free(error);
> +		return NULL;
> +	}
> +
> +	return val;
> +}
> +
> +bool igt_rc_get_boolean(const char *group_name, const char *key, bool *out)
> +{
> +	GError *error = NULL;
> +	gboolean val;
> +
> +	if (!igt_key_file)
> +		return false;
> +
> +	val = g_key_file_get_boolean(igt_key_file, group_name, key, &error);
> +	if (error) {
> +		g_error_free(error);
> +		return false;
> +	}
> +
> +	*out = val;
> +	return true;
> +}
> +
> +int igt_rc_get_integer(const char *group_name, const char *key, int *out)
> +{
> +	GError *error = NULL;
> +	int val;
> +
> +	if (!igt_key_file)
> +		return false;
> +
> +	val = g_key_file_get_integer(igt_key_file, group_name, key, &error);
> +	if (error) {
> +		g_error_free(error);
> +		return false;
> +	}
> +
> +	*out = val;
> +	return true;
> +}
> diff --git a/lib/igt_rc.h b/lib/igt_rc.h
> index d871b3b26..a0942f8d0 100644
> --- a/lib/igt_rc.h
> +++ b/lib/igt_rc.h
> @@ -1,3 +1,4 @@
> +#include <stdbool.h>
>   /*
>    * Copyright © 2017 Intel Corporation
>    *
> @@ -33,4 +34,8 @@
>   
>   extern GKeyFile *igt_key_file;
>   
> +char *igt_rc_get_string(const char *group_name, const char *key);
> +bool igt_rc_get_boolean(const char *group_name, const char *key, bool *out);
> +int igt_rc_get_integer(const char *group_name, const char *key, int *out);
> +
>   #endif /* IGT_RC_H */
> diff --git a/lib/meson.build b/lib/meson.build
> index 8db9fffde..20c2f34d7 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -97,6 +97,7 @@ lib_sources = [
>   	'igt_kms.c',
>   	'igt_fb.c',
>   	'igt_core.c',
> +	'igt_rc.c',
>   	'igt_dir.c',
>   	'igt_draw.c',
>   	'igt_list.c',
> diff --git a/lib/vendor/unigraf/unigraf.c b/lib/vendor/unigraf/unigraf.c
> index 30ee3c72b..64268db34 100644
> --- a/lib/vendor/unigraf/unigraf.c
> +++ b/lib/vendor/unigraf/unigraf.c
> @@ -364,7 +364,6 @@ int unigraf_get_connector_id_by_stream(int drm_fd, int stream_id)
>   bool unigraf_open_device(int drm_fd)
>   {
>   	TSI_RESULT r;
> -	GError *cfg_error = NULL;
>   	char *cfg_device = NULL;
>   	char *cfg_role = NULL;
>   	char *cfg_input = NULL;
> @@ -382,63 +381,52 @@ bool unigraf_open_device(int drm_fd)
>   
>   	unigraf_init();
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
> +		unigraf_debug("No default EDID set, use IGT default.\n");

While on it, can you correct the typo `use` => `using`?

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
>   	}
>   
>   	unigraf_assert(TSIX_DEV_RescanDevices(0, TSI_DEVCAP_VIDEO_CAPTURE, 0));

