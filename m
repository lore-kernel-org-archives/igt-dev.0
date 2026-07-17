Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C78C44515
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 19:23:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6199110E4CA;
	Fri, 17 Jul 2026 19:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="cbBJFEsq";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7ED810E4CA
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 19:23:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id DE7C34E40E24;
 Fri, 17 Jul 2026 19:23:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B26DB60361;
 Fri, 17 Jul 2026 19:23:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2BF2C11BD013E; 
 Fri, 17 Jul 2026 21:23:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1784316200; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=lPqPhDQNe4n8xNqo2becoqticUmGNYz+v+iFgNZDSk0=;
 b=cbBJFEsqqVi7sphX8FTS99RAUtPeExeseoruxlxnDUAOerf3EV0qLmX3t4jpaniu8A9eGs
 p3vSBIm9TopmddelcdbRkBnhOU6H6dX/cD8fOJrhjP8MPVuGOrZJtabbS6MX9c11tfxqo0
 VzUB8HoPVBexdYpSLWDgfyLWeGBDaPo6yPLvm9QcPSlZFaLZDULCjwebpDgmNiDpPmDftH
 d2bUt0QzG0Dse3/Z/byhFkQMeJg73KeAXezndncKRhO9PhZnQFIJazskB+sWAxmWVclIqj
 h1dn+6/KNFmrh86OOIqPO9CeUVarPUvlMX2wQyXi6z/r/QiCVptbbE8QsKDODw==
Message-ID: <b324163f-69d1-4f4b-b4ad-f48df1fc0bfb@bootlin.com>
Date: Fri, 17 Jul 2026 21:23:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] android: Implement lightweight GKeyFile INI string
 parser in glib shim
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mark Yacoub <markyacoub@google.com>, igt-dev@lists.freedesktop.org,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20260715192949.1984280-1-markyacoub@google.com>
 <11a2d7a3-bee7-4533-a29f-d9a7f9b9e154@bootlin.com>
 <20260717101803.lef2fjwyrptuq6ol@kamilkon-DESK.igk.intel.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260717101803.lef2fjwyrptuq6ol@kamilkon-DESK.igk.intel.com>
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



On 7/17/26 12:18, Kamil Konieczny wrote:
> Hi Louis,
> On 2026-07-17 at 10:20:30 +0200, Louis Chauvet wrote:
>>
>>
>> On 7/15/26 21:29, Mark Yacoub wrote:
>>> [Why]
>>> Android's Bionic C library lacks libglib2, requiring IGT to build against
>>> an Android-specific mock header (include/android/glib.h). The existing mock
>>> implementation of GKeyFile and g_key_file_load_from_file is a hardcoded
>>> no-op returning NULL, which prevents tests relying on configuration files
>>> (such as .igtrc) from dynamically retrieving values on Android.
>>
>> Hello Mark,
>>
>> I don't think it's a good idea to keep a custom parser inside IGT that isn't
>> always used, especially when it behaves differently (no character escaping,
>> first key value is used versus the last, 1/true/yes versus 1/true for
>> booleans, spaces around =, etc.).
>>
>> I agree that external dependencies can be a pain to manage and are sometimes
>> unavailable. After a quick look, extracting the full GLib parser doesn't
>> seem feasible (it's tightly coupled to GLib internals). However, IGT could
>> easily implement a minimal subset, as you have already done. That way, GLib
>> would only be required for a few tests.
>>
>> I don't know what maintainers thinks about it?
>>
> 
> This is a good idea to have as little as possible number of
> external libs linked. I am afraid removing glib would be hard as
> there are some other parts used in igt, like udev changes
> monitoring.

I did not explore the whole codebase, just android/glib.h. I think that 
the tests requiring udev don't use glib but libudev?

> What about placing this code in lib with name igt_ini.c?
> Or igt_config.c?

There is already igt_rc.h, why not igt_rc.c?

> +cc Ashutosh, Karthik, Swati and Zbigniew
> 
>>> [How]
>>> Expand the dummy GKeyFile structure to record the file path upon calling
>>> g_key_file_load_from_file. Implement a minimal internal INI parser function
>>> (__android_g_key_file_get) inside g_key_file_get_string to traverse the file
>>> line-by-line, matching requested [group] and key strings, stripping trailing
>>> newlines, and returning a heap-allocated duplicate string (strdup).
>>>
>>> Signed-off-by: Mark Yacoub <markyacoub@google.com>
>>
>> Anyway, if there is a v2 of this patch, can you run checkpatch and fix the
>> issues?
>>
>>> ---
>>>    include/android/glib.h | 120 +++++++++++++++++++++++++++++++++++++----
>>>    1 file changed, 111 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/include/android/glib.h b/include/android/glib.h
>>> index 0b6658287..5b8ba86c7 100644
>>> --- a/include/android/glib.h
>>> +++ b/include/android/glib.h
>>> @@ -16,8 +16,7 @@ typedef struct _GError {
>>>    } GError;
>>>    typedef struct _GKeyFile {
>>> -	char *key;
>>> -	char *value;
>>> +	char path[512];
> 
> Why did you drop key/value from here?
> 
>>>    } GKeyFile;
>>>    typedef struct _GMatchInfo {
> [cut]
> 
> Regards,
> Kamil

