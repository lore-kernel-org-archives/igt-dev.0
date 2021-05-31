Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09196E918
 for <igt-dev@lists.freedesktop.org>; Mon, 31 May 2021 12:32:56 +0000 (UTC)
References: <20210531105138.169530-1-maarten.lankhorst@linux.intel.com>
 <YLTFtxka3CyIrIH4@platvala-desk.ger.corp.intel.com>
 <d0d6b74b-fb74-57bb-5cd2-ec1bb52eedcf@linux.intel.com>
 <YLTV2awY6g7y6C37@platvala-desk.ger.corp.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <12bdebeb-aa42-6dfd-a8c9-6d25cea70548@linux.intel.com>
Date: Mon, 31 May 2021 14:32:46 +0200
MIME-Version: 1.0
In-Reply-To: <YLTV2awY6g7y6C37@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] Fixup clang compiler warnings.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Op 31-05-2021 om 14:26 schreef Petri Latvala:
> On Mon, May 31, 2021 at 02:18:24PM +0200, Maarten Lankhorst wrote:
>> Op 31-05-2021 om 13:17 schreef Petri Latvala:
>>> On Mon, May 31, 2021 at 12:51:38PM +0200, Maarten Lankhorst wrote:
>>>> Allows building cleanly with clang again. It complains about using
>>>> invalid initialisers like char[][] = { 0 }.
>>>>
>>>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>> ---
>>>>  lib/igt_kms.c               | 2 +-
>>>>  lib/igt_nouveau.c           | 2 +-
>>>>  tests/i915/gem_exec_fence.c | 4 ++--
>>>>  3 files changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>>>> index 28fb9c094eb2..fb7a14f940ea 100644
>>>> --- a/lib/igt_kms.c
>>>> +++ b/lib/igt_kms.c
>>>> @@ -292,7 +292,7 @@ struct edid **igt_kms_get_tiled_edid(uint8_t htile, uint8_t vtile)
>>>>  {
>>>>  	uint8_t top[2];
>>>>  	int edids, i;
>>>> -	static  char raw_edid[MAX_EDID][256] = {0};
>>>> +	static  char raw_edid[MAX_EDID][256] = {{0}};
>>> Can't this be {} ?
>>>
>>>
>> If you make this a r-b. Sure!
>>
> If clang (and gcc of course) likes it,
> Reviewed-by: Petri Latvala <petri.latvala@intel.com>

They do, thank you.

Pushed!

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
