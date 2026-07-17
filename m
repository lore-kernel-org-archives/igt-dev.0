Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A567FC44507
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 08:21:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5537110E423;
	Fri, 17 Jul 2026 08:21:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="IQcE1Mgz";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 780A110E423
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 08:20:34 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C103C1A1044;
 Fri, 17 Jul 2026 08:20:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 95A2660361;
 Fri, 17 Jul 2026 08:20:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A85CC11BD013E; 
 Fri, 17 Jul 2026 10:20:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1784276432; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=zt58HaRJYnEn42Up6iekxeMkGosL+l08bDNKc90Hhnc=;
 b=IQcE1Mgzc6aZA104yWyr+/cB3rLzAzW8UVgJVu90pn2HP26UYtwOv9r+liydTphIQU2D2X
 Babthzlejj56HuOGpOrxU2EqcKRfp6EDdV2ItEZcO0AQ6gPyYOmmjzcRgLfnzcSyYA84la
 5kxm4zIN4Fhc8wcYovlZpxKhTrLEv7yXME0MGGFJYEGlC3gPcOvY22E71RTva+R4MsmYhA
 2CkSuEOTh0AZxEt4ZwzahoqtmwUKRmR1J+5Xv22db4WaH+c7w7E3Be8QR+Pcwv4jTZojoE
 Bre5isR/F+euONj0coxUcdYJ1V9p3k0fg8UvAgEJ4d7dMbqPwSCDixfGSgb6/Q==
Message-ID: <11a2d7a3-bee7-4533-a29f-d9a7f9b9e154@bootlin.com>
Date: Fri, 17 Jul 2026 10:20:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] android: Implement lightweight GKeyFile INI string
 parser in glib shim
To: Mark Yacoub <markyacoub@google.com>, igt-dev@lists.freedesktop.org
References: <20260715192949.1984280-1-markyacoub@google.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260715192949.1984280-1-markyacoub@google.com>
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



On 7/15/26 21:29, Mark Yacoub wrote:
> [Why]
> Android's Bionic C library lacks libglib2, requiring IGT to build against
> an Android-specific mock header (include/android/glib.h). The existing mock
> implementation of GKeyFile and g_key_file_load_from_file is a hardcoded
> no-op returning NULL, which prevents tests relying on configuration files
> (such as .igtrc) from dynamically retrieving values on Android.

Hello Mark,

I don't think it's a good idea to keep a custom parser inside IGT that 
isn't always used, especially when it behaves differently (no character 
escaping, first key value is used versus the last, 1/true/yes versus 
1/true for booleans, spaces around =, etc.).

I agree that external dependencies can be a pain to manage and are 
sometimes unavailable. After a quick look, extracting the full GLib 
parser doesn't seem feasible (it's tightly coupled to GLib internals). 
However, IGT could easily implement a minimal subset, as you have 
already done. That way, GLib would only be required for a few tests.

I don't know what maintainers thinks about it?

> [How]
> Expand the dummy GKeyFile structure to record the file path upon calling
> g_key_file_load_from_file. Implement a minimal internal INI parser function
> (__android_g_key_file_get) inside g_key_file_get_string to traverse the file
> line-by-line, matching requested [group] and key strings, stripping trailing
> newlines, and returning a heap-allocated duplicate string (strdup).
> 
> Signed-off-by: Mark Yacoub <markyacoub@google.com>

Anyway, if there is a v2 of this patch, can you run checkpatch and fix 
the issues?

> ---
>   include/android/glib.h | 120 +++++++++++++++++++++++++++++++++++++----
>   1 file changed, 111 insertions(+), 9 deletions(-)
> 
> diff --git a/include/android/glib.h b/include/android/glib.h
> index 0b6658287..5b8ba86c7 100644
> --- a/include/android/glib.h
> +++ b/include/android/glib.h
> @@ -16,8 +16,7 @@ typedef struct _GError {
>   } GError;
>   
>   typedef struct _GKeyFile {
> -	char *key;
> -	char *value;
> +	char path[512];
>   } GKeyFile;
>   
>   typedef struct _GMatchInfo {
> @@ -45,16 +44,119 @@ static inline void g_error_free(GError *error) { }
>   
>   static inline const char *g_get_home_dir(void) { return "/data/local/tmp/igt"; }
>   
> -static inline void g_key_file_free(GKeyFile *file) { }
> -static inline GKeyFile *g_key_file_new(void) { return NULL; }
> +/*
> + * __android_g_key_file_get: Minimal INI parser to mock GLib's GKeyFile getters.
> + *
> + * This function manually traverses a provided INI-style configuration file
> + * (e.g., .igtrc) searching for a specific [group] and key. It parses line-by-line
> + * without relying on the heavy libglib2 parsing dictionary framework natively
> + * required by standard IGT.
> + *
> + * It operates strictly on the specific file path saved in the GKeyFile struct during
> + * g_key_file_load_from_file(). This ensures it properly acts as a decoupled file
> + * parser and prevents it from hijacking other distinct config operations.
> + *
> + * Parameters:
> + * - key_file: The mocked GKeyFile struct holding the parsed file path.
> + * - target_group: The [group] section to search within (e.g. "Unigraf").
> + * - target_key: The key to matching inside the group (e.g. "Connector").
> + *
> + * Returns:
> + * A newly allocated string (`strdup`) containing the right-side value of the
> + * matched key, or NULL if not found. The caller is responsible for freeing it.
> + */
> +static inline char *__android_g_key_file_get(GKeyFile *key_file, const char *target_group, const char *target_key)
> +{
> +	/* Ensure a valid file path was actively loaded into our GKeyFile mock */
> +	if (!key_file || !key_file->path[0]) return NULL;
> +
> +	FILE *fp = fopen(key_file->path, "r");
> +	if (!fp)
> +		return NULL;
> +
> +	char line[256];
> +	bool in_group = false;
> +	size_t key_len = strlen(target_key);
> +
> +	while (fgets(line, sizeof(line), fp)) {

You may read twice the same line if the line is longer than 256 chars 
(probably not an issue, but that a limitation that should be documented 
somewhere).

> +		char *trim = line;
> +
> +		/* Skip any leading whitespace (spaces or tabs) for the current line */
> +		while (*trim == ' ' || *trim == '\t') trim++;
> +
> +		/* Check if this line declares a new [Group] section */
> +		if (trim[0] == '[') {
> +			/* Verify if it perfectly matches the user's requested [target_group] */
> +			in_group = (strncmp(trim + 1, target_group, strlen(target_group)) == 0 &&
> +				    trim[1 + strlen(target_group)] == ']');
> +			continue; /* Move to the next line of the file */
> +		}
> +
> +		/* If we are inside the correct group, evaluate if the line starts with `target_key=` */
> +		if (in_group && strncmp(trim, target_key, key_len) == 0 && trim[key_len] == '=') {

If you want to stick with glib behavior: there could be a space between 
the key and the =

> +			/* Pointer to the start of the value (immediately right of '=') */
> +			char *val = trim + key_len + 1;

Same, there can be spaces after the =

> +			char *end = val + strlen(val);

The line may ends with some spaces.

> +			/* Strip any trailing whitespace, carriage returns, or newlines by inserting null terminators */
> +			while (end > val && (end[-1] == '\r' || end[-1] == '\n' || end[-1] == ' ' || end[-1] == '\t'))
> +				end[-1] = '\0';

Why did you use a while and not a if here?

> +
> +			fclose(fp);
> +			/* Return a standard heap-allocated copy of the value string just as GLib would */
> +			return strdup(val);

If you want to stick with glib behavior: you must return the last value, 
not the first.

> +		}
> +	}
> +
> +	fclose(fp);
> +	return NULL;
> +}
> +
> +static inline void g_key_file_free(GKeyFile *file) { free(file); }
> +
> +static inline GKeyFile *g_key_file_new(void) { return (GKeyFile *)calloc(1, sizeof(GKeyFile)); }
> +
>   static inline int g_key_file_get_integer(GKeyFile *key_file,
> -	const char *group_name, const char *key, GError **error) { return 0; }
> +	const char *group_name, const char *key, GError **error) {

That could be nice to fill error in case of error, many places rely on 
the error pointer content to detect issues during parsing.

> +	char *val = __android_g_key_file_get(key_file, group_name, key);
> +	if (!val) return 0;
> +	int res = atoi(val);

If you fill the error pointer, you can use strtol to check the result.

> +	free(val);
> +	return res;
> +}
> +
>   static inline char *g_key_file_get_string(GKeyFile *key_file,
> -	const char *group_name, const char *key, GError **error) { return NULL; }
> +	const char *group_name, const char *key, GError **error) {
> +	return __android_g_key_file_get(key_file, group_name, key);
> +}
> +
>   static inline double g_key_file_get_double(GKeyFile *key_file,
> -	const char *group_name, const char *key, GError **error) { return 0.0; }
> -static inline bool g_key_file_load_from_file(GKeyFile *key_file,
> -	const char *file, int flags, GError **error) { return false; }
> +	const char *group_name, const char *key, GError **error) {
> +	char *val = __android_g_key_file_get(key_file, group_name, key);
> +	if (!val) return 0.0;

The caller need to know if the value is set to 0 (then use 0) or not 
present (then use some default value), see usage for DisplayDetectTimeout.

> +	double res = strtod(val, NULL);
> +	free(val);
> +	return res;
> +}
> +
> +static inline bool g_key_file_get_boolean(GKeyFile *key_file,
> +	const char *group_name, const char *key, GError **error) {
> +	char *val = __android_g_key_file_get(key_file, group_name, key);
> +	if (!val) return false;
> +	bool res = (strcmp(val, "true") == 0 || strcmp(val, "1") == 0 || strcmp(val, "yes") == 0);

To stick with glib behavior: only true/1 and false/0 are valid booleans.

> +	free(val);
> +	return res;
> +}
> +
> +static inline bool
> +		g_key_file_load_from_file(GKeyFile *key_file,
> +	const char *file, int flags, GError **error) {
> +	if (key_file && file) {
> +		snprintf(key_file->path, sizeof(key_file->path), "%s", file);
> +		return true;
> +	}
> +	return false;
> +}
>   
>   static inline GRegex *g_regex_new(const char *pattern, int compile_options,
>   	int match_options, GError **error) { return NULL; }

