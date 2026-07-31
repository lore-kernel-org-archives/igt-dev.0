Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4049C55167
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 17:14:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5013A10E199;
	Fri, 31 Jul 2026 17:14:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="wOj/bhm9";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47DE010E199
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 17:14:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id CD2531A1349
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 17:14:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 93AEF6039A;
 Fri, 31 Jul 2026 17:14:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EAE6B11C16B7B; 
 Fri, 31 Jul 2026 19:14:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1785518053; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=UY+4SIQsvQPTNQrcnmYY58/cR8ShT4OiDp43uhYdTHM=;
 b=wOj/bhm9OOVz5C5MtLt12qJtK3+Hb+7WOckP9QFBdyCi9B5sYNzSBucTTKQjxZmFxOns5T
 uafzq70D4MiA2L6ndAOMGDLZ6xoPlKuofb9vDswEVq+Lb+njICdOy7oATOxiGcNhoa7l3c
 jizP8XypDpbunRM+QUUx6rkc064aChTW5O7EzrpgoyjeKomgMm93gtcLrZlCkZ3aGRxUIo
 X9jDhHZUzFjZ5jLn5uwih3hH5p0jFSkSoDWO2jtsaTAzwD5m/3vS+PEBBQHecATf9QadNt
 Q4NFt3BoATSX0T+6OJdeSmRyptevKzUTSdyZxQXsZF0+r1jGpjzKNvSGstQJwQ==
Message-ID: <7a8feae5-b874-4e6a-bea6-f01e2b77198c@bootlin.com>
Date: Fri, 31 Jul 2026 19:13:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] android: glib: add g_key_file_get_boolean stub
To: Mark Yacoub <markyacoub@google.com>, igt-dev@lists.freedesktop.org
References: <20260727142200.3042096-1-markyacoub@google.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260727142200.3042096-1-markyacoub@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 7/27/26 16:22, Mark Yacoub wrote:
> This stub function is necessary to allow IGT Unigraf dependencies to successfully compile on the Android platform.
> 
> Suggested-by: Mark Yacoub <markyacoub@google.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
>   include/android/glib.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/include/android/glib.h b/include/android/glib.h
> index 0b6658287..aacfcf138 100644
> --- a/include/android/glib.h
> +++ b/include/android/glib.h
> @@ -55,6 +55,9 @@ static inline double g_key_file_get_double(GKeyFile *key_file,
>   	const char *group_name, const char *key, GError **error) { return 0.0; }
>   static inline bool g_key_file_load_from_file(GKeyFile *key_file,
>   	const char *file, int flags, GError **error) { return false; }
> +static inline bool g_key_file_get_boolean(GKeyFile *key_file,
> +	const char *group_name, const char *key, GError **error) { return false; }
> +
>   
>   static inline GRegex *g_regex_new(const char *pattern, int compile_options,
>   	int match_options, GError **error) { return NULL; }

