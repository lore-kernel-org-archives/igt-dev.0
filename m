Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62FBC4345F
	for <igt-dev@archiver.kernel.org>; Tue, 16 Apr 2024 20:12:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D95610ED61;
	Tue, 16 Apr 2024 20:12:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="e9zDA7e1";
	dkim-atps=neutral
X-Greylist: delayed 2189 seconds by postgrey-1.36 at gabe;
 Mon, 15 Apr 2024 12:05:41 UTC
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A131124E9
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Apr 2024 12:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SR8cDQqGF1Js8yA0izRQxEi9EpIW6SMqymOreqsAWXw=; b=e9zDA7e1UGBeN89lzQQxpWRR78
 +5yyRAeoX2t8ySiws2gd9PtrXHPjdlJRknnwpax9aE7nNmG+xPGQa3NhMk7vAFHhMP50afVFPms5g
 1o/4RrnERUQf981DKQeqZ8T9Qn6uUZOqZRU+gO6iuI4N66TONWrtOZbJ01+Y9ADr2F4FSmcxA1NvQ
 nvFMhEgnDIA/6341KZNp9GcBq3zWQr4lph3C9UqYPk5eRJGb694pBtNmg4fPzV1ZcYv8SfCG9fwIa
 LTKpvSYASzfpmlceOEfxBESO0p7Yz2N6dq0C91e4FVRDxRBn7mCFHq9oM0F1BKXcPx/Sp6QknXUzA
 YVFN7DSw==;
Received: from [84.65.0.132] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rwKWJ-004k0U-9q; Mon, 15 Apr 2024 13:29:07 +0200
Message-ID: <4e09815e-9c17-4c02-8be8-9d106738f2b9@igalia.com>
Date: Mon, 15 Apr 2024 12:29:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tools/gputop: Fix engine columns with amdgpu
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Tvrtko Ursulin <tursulin@igalia.com>
Cc: igt-dev@lists.freedesktop.org
References: <20240403150057.25765-1-tursulin@igalia.com>
 <zpnpvxz7bvryul7c5awkiqj3xdgm4ihat3u2obl4rdfszfmjq4@scbuwrratvhx>
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <zpnpvxz7bvryul7c5awkiqj3xdgm4ihat3u2obl4rdfszfmjq4@scbuwrratvhx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 16 Apr 2024 20:12:45 +0000
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


On 03/04/2024 21:27, Lucas De Marchi wrote:
> On Wed, Apr 03, 2024 at 04:00:57PM +0100, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> Amdgpu kernel driver skips output of fdinfo keys for unused engines. That
>> is completely legal but corrupts the column formatting in the current
>> code.
>>
>> Fix it by simply treating change in detected engines used by a client
>> as trigger to re-emit a new header. This ensures columns are always
> 
> That would be kind of ugly if each client uses a different engine.
> 
> Why not outputing all the engine classes regardless of what the
> clients are using?

It is a bit ugly but gputop doesn't know what are all the engine classes 
- it simply auto-detects them from the ones listed in fdinfo. To know 
"all" would need more code to be added. See ->

> 
> Lucas De Marchi
> 
>> correctly aligned, albeit with a cost of potentially duplicating the
>> header for the same DRM minor.
>>
>> This is considered good enough for a reference implementation. The
>> alternative would be to add some real per DRM minor state tracking which
>> sounds like an overkill, at least until gputop gains a nicer (any) UI.

-> this paragraph.

Can you live with it for now? Until someone decides to write a nicer UI 
for it?

Regards,

Tvrtko

>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> ---
>> tools/gputop.c | 27 ++++++++++++++++++++++++++-
>> 1 file changed, 26 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/gputop.c b/tools/gputop.c
>> index 71e28f43ee4c..76075c5dde8b 100644
>> --- a/tools/gputop.c
>> +++ b/tools/gputop.c
>> @@ -119,11 +119,36 @@ print_client_header(struct igt_drm_client *c, 
>> int lines, int con_w, int con_h,
>>     return lines;
>> }
>>
>> +static bool
>> +engines_identical(const struct igt_drm_client *c,
>> +          const struct igt_drm_client *pc)
>> +{
>> +    unsigned int i;
>> +
>> +    if (c->engines->num_engines != pc->engines->num_engines ||
>> +        c->engines->max_engine_id != pc->engines->max_engine_id)
>> +        return false;
>> +
>> +    for (i = 0; i <= c->engines->max_engine_id; i++)
>> +        if (c->engines->capacity[i] != pc->engines->capacity[i] ||
>> +            !!c->engines->names[i] != !!pc->engines->names[i] ||
>> +            strcmp(c->engines->names[i], pc->engines->names[i]))
>> +            return false;
>> +
>> +    return true;
>> +}
>>
>> static bool
>> newheader(const struct igt_drm_client *c, const struct igt_drm_client 
>> *pc)
>> {
>> -    return !pc || c->drm_minor != pc->drm_minor;
>> +    return !pc || c->drm_minor != pc->drm_minor ||
>> +           /*
>> +        * Below is a a hack for drivers like amdgpu which omit listing
>> +        * unused engines. Simply treat them as separate minors which
>> +        * will ensure the per-engine columns are correctly sized in all
>> +        * cases.
>> +        */
>> +           !engines_identical(c, pc);
>> }
>>
>> static int
>> -- 
>> 2.44.0
>>
