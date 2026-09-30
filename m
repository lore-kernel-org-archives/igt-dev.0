Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4691CA5FC4
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 21:03:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43E2310E293;
	Wed, 30 Sep 2026 21:03:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Urhrs/6w";
	dkim-atps=neutral
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012038.outbound.protection.outlook.com
 [40.93.195.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3488B10E128
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 21:02:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fRCbt5aLNOSC3QAzLqiqln59lcHaIKy+QRH0mmgeCo+l6DzXh0SOybXi0JqJ2r3t2MbiXc0wj2mbPlccJEB8bsb4gcn9x4cKtEhoLcVF7Ek6K/+58TkF5xN8DA7gl6sUokuWgD/YEuMpxm869eA+EbglsK/b6TXGyUgUGsxfp8hgDhgtm2ZEe0sI7lSD4F51PqriEmqlJ7XPfTuI9nzky2FoyM7XOisEvE48C8fyD/7yIKIq+5X6zOdzSHztpm2Tkv0dC848y5btBqUeXvhlDcWhkKvI951N/sFmnVrZFEjUZ/zNzmj4oI50ZaJMR6QuTINA9naJ8YlIulTmzgmLdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcyp7sMZxA5ircuFja8REWlGbN5PgL/t3pko+c/FsLE=;
 b=qy0U+afQPeBMXPFWX6d5wE2qnhiPIhLVmL1a6VaTv7vjmdOItMML1iDdl1GY8R6CuUZ2M1kzxbMxyoQPWTJLD3fAcmhCVkW66WMojyPdlv3wnBPFjn29VDJWB+jmWOxLaHduf4cwyDJckAuetdUP45F6zAEZPs3jHTqNQ41ihuMIUblPJ1Kc3nMve2+Td0OdAKgZvg88aGYmYFgJzvqzTGTi56cSFuIvqi0gCS+HagzFCOUo5e0AJR1lerQvRaUnDCfZ4rlgtf3yboJnZK/wugr7qtb+J02yKp2gc+bt7EJ28chvN/FR3eSaByNyGef4q8RVt+vDpakWHVRT/9UCfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcyp7sMZxA5ircuFja8REWlGbN5PgL/t3pko+c/FsLE=;
 b=Urhrs/6wUOOFeblVCCOUXlAR817m4IiWxl2ODq6WdYgt/hVEB3JIqlgr9679bOzzraLJsRNj47qvv8qww/d4aGIarqZ4vExOAsdSIeLsez7MBOEZcRmmrNFOgfZPYA7saIhIv/ME85VvDXw+e7SnSODeJA+6XZl6rvVtwCQ9PZQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB7007.namprd12.prod.outlook.com (2603:10b6:a03:486::8)
 by CH2PR12MB4101.namprd12.prod.outlook.com (2603:10b6:610:a8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 21:02:14 +0000
Received: from SJ0PR12MB7007.namprd12.prod.outlook.com
 ([fe80::6f95:c4a2:894d:9e8a]) by SJ0PR12MB7007.namprd12.prod.outlook.com
 ([fe80::6f95:c4a2:894d:9e8a%3]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 21:02:13 +0000
Message-ID: <0187ff72-a5a2-44de-84ac-147cc263ce47@amd.com>
Date: Wed, 30 Sep 2026 17:02:08 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 4/8] tests/kms_properties: give non-primary
 planes their own fb
To: Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, kernel-dev@igalia.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Alex Hung <alex.hung@amd.com>, Swati Sharma <swati2.sharma@intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Simon Ser <contact@emersion.fr>,
 Xaver Hugl <xaver.hugl@kde.org>, Uma Shankar <uma.shankar@intel.com>
References: <20260902180016.303482-1-mwen@igalia.com>
 <20260902180016.303482-5-mwen@igalia.com>
 <a68bfa15-1a1b-4ba8-aab6-7a8089d13b3f@amd.com>
 <9845a127-4b17-4ffa-afc5-582acaf5a64e@igalia.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <9845a127-4b17-4ffa-afc5-582acaf5a64e@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0394.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:108::23) To SJ0PR12MB7007.namprd12.prod.outlook.com
 (2603:10b6:a03:486::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB7007:EE_|CH2PR12MB4101:EE_
X-MS-Office365-Filtering-Correlation-Id: 563ccac0-85a0-4a07-eff8-08df1f361a1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|7416014|4143699003|10067099003|11063799006|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: PEdGAws031Q5g7G0yOP1OeZ5DYtpKhGTAnMotBlS4TD8mvCevE79nB782JdOCezV+1rVNnEewxXCO3eraFmbIcFhyvoSjDycaUxCb6sP4c3qEwfC3RJUNZ2ciXovQtB09/A/boTJ2e1/z0UQC4MnyI02akFVwOWRgRYudyVMxYkhN6IgwZCq3sV42IZx/dbo53xLIZh7UriJGg9h5ZpwNDb/XXNZ24a+9dgxW8ylwrBbagr8kri+mROzbQ4a5eWb8SSGDUXGkNa6N0a25y7eiZmjnMtBI+6L1gBnqVuHQljwV8Gz2KEF5fSDT6I3izgKdyNPM4LYpPtc1dgrDdMbyXBuoXf9ArXuY/HadCVOV3rDWoNBuMWJgtNjL63MsZVQMoYh8Ny/UDWlLo8WsykMkcdIR9+HoD828ZjhIPF/Eytxn/c5IEarigtX8zU1+MEkmy9JjcxAyIHFxX7dnsDIP0CufICLDxcVNEpy6GNwrXfM8pCSttX6M6XUXgvtKS9I5CzxDVwsaVC6FzzJpIkK/LbwPkkB5QpwjzuXcVuG1tSIKGDECh+r2QhW1TFeIaytEFHliqpx4Y7+xgn+NONVS7W2COhSFebDWUlKVIlrjFjFjEcT1PE674YhZ1K5Yf/uszexs9v6lMf+HGvb8PBoL3obFQjX4p7elTw48Yd6D/s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB7007.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(4143699003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnFKZExOMFk1cnV6cVFDM2Uzc2RSa3A4dUVsSjVjMzJIeUZ0d1BQY0hkVVJq?=
 =?utf-8?B?OEdwUDRWSUg3MDY2KzllV0VqMWlTaWNydElxa3QrR1NWbitkc043UnF0OWhM?=
 =?utf-8?B?ci9XcUpYV3VLTTFhTStoYTByMnRaTmNjTUkremhBWVkwelVIbDloRmp6ODhn?=
 =?utf-8?B?dTQ3SXRaMTI4ckVLOWxxdTNKSXE2K2ZuMnBWLzd0RldrUmN2ZGlITDBhbzVV?=
 =?utf-8?B?ZkhMMjRkVkxjaGFPbVJwR1F3ZlVYbkNSSVRSRWsvZEVSeStLdnE0ZFkvV1kx?=
 =?utf-8?B?Y1V3Q3VEY3dVakNNbndQM0FmWW5uZjRkeU8xVVQrU2orWnBVTDdwUVJkK3Zq?=
 =?utf-8?B?aERzTFp5eXhiZ1h2RWZKQTdlYWsxeE5xaHhsRzNlTklnVHRvbzFiTzFyeWlG?=
 =?utf-8?B?RzJ5MHBzSG9aa1JPMW43R212cmZKNU5YY2dkcEJJRDVJV3c1TFlEc2xseVBo?=
 =?utf-8?B?VE82TzRLakZxNHh2RURuakFkY0xuZzhOaGs4SXZYeFNxQzl0MnZYVWRNRE92?=
 =?utf-8?B?TUVLU3hEN3g2a0lSS0VCM1hsb3hXWnJOZml6MUV4UnpnNFk5RG8rbkdIM2dO?=
 =?utf-8?B?RTgzbGh4aVI1Q1dqdnVrNTdxOWxGcDkrcjFzRjlET3ZCOWdudzQ5UzFsRXZu?=
 =?utf-8?B?WXpRemtFWUJxejR0aUhxRS9iMVRCM2lSOVppR0x4UXl0Q3dnZXA0OTAyUWVW?=
 =?utf-8?B?TnNMMFpXRnY1OUdIaHZiSXpXSEVaWWpWRURBcFpJb0pJeGpBY3V5SFBQR09Z?=
 =?utf-8?B?S2t1SXpWcVBQeWFqa0VVSGpzWW9VMzR6VUdXejY0d3dDNVVtekVIU3dNK2RY?=
 =?utf-8?B?VGpqRzVXY0RBSWI5WnpkVW8razl5R0NGSU1TcVRrcXZwenVTSE5GUkhVMk9R?=
 =?utf-8?B?VmlCU20vOC91K2pqUldhVndrRVZqcFZJZ0JpemgzYzdWbEJxNE5aVzVHeDFN?=
 =?utf-8?B?SEJ3SXdZdzNpMVBkMTZyTXE0ZGFtdnhib1hiQTlxRU5JVDFGeXR1VVlaT0hE?=
 =?utf-8?B?V3NaWGswYXpMYzJVMEFDTnhpM3R1bGtqOU9vSEovNXltd0dMSTF0SDh0YnZo?=
 =?utf-8?B?YUdYN1JQNExHZGRXMmg5WHd0U0JRU2xoM0xVRUJMUHBRc1YxNjNrTEc0ZHdu?=
 =?utf-8?B?YkZlUmR6ZFdQWjNwSWRZUDczYzJzbCtZcmJLUkg5YWJub1FVZm9NUWtkYlI2?=
 =?utf-8?B?NzZjWm5tS2tZdXByUlhRdmRka1cxdnhOS2YrMnV0cE1kNUJiMUk5V3ZyNXFE?=
 =?utf-8?B?Yk9TRFZpYUhmN2hZTFBob1NqK3EvMmJhTDZvNW1vWUtoSnJQU3RwNHBhSFI1?=
 =?utf-8?B?b2twd1lZYVZ2eEhJYTJ3anZwZElwSkNpMmVzNmFHQXROT3M4LzUxUVBnQ3hG?=
 =?utf-8?B?WXhheDdxajlYemtBOVVVaS9xekxtY1c4cTM4bVVEMnlxMFJDTDZkLzBER0xr?=
 =?utf-8?B?cXZQQ0FpU0F5WkVJU2NQS285ejNMNi96UVpWSVRud0ljZHZEcWxFRzd5aFQ1?=
 =?utf-8?B?M0g3elJhVUQ4MXBzYlpubFlHS0tsdVE3VUtEbXduZjVvekZXSGRka0pNeVpS?=
 =?utf-8?B?ZldYZ3BicFFMQ3A0cSsxR2RPL0NHc21zd1VRWXFqd0l4aWgvKyt4VVZhaFpl?=
 =?utf-8?B?NUxHWHBtRHZneUxiZFVhelZEUWxVS2VIN2lRekgyZnl1L2FlVWhTWDFqTUpo?=
 =?utf-8?B?UFR6UVE0TjVpQWxDMTB5MjhySTBCUGczQk9XdlV6WUpyT2NPSWJ0a0FsMzhJ?=
 =?utf-8?B?VGJYVkhJUk1QNkxTMzhZQXY0Q01LKzd2WXVqb2xCNEFqc2ZjUldCSkN4ODAy?=
 =?utf-8?B?REd5d2RHMFJWMktZR2ZPcE5lOXZ5Q3VQZkpFNGZFdXd6TVlBZUZSRW1ZUk9h?=
 =?utf-8?B?Q2pjRTc3M0lUUXV1U0hTQmVrNTV3SExNQy9pNFVzZWdJRk82VGwzS25zb3hP?=
 =?utf-8?B?dWN4RTFONDJWVkxoMWVyaWkxeTlMSm0wY2N4Nm41WEZkUVduLy9zOVVPWWhG?=
 =?utf-8?B?OXJnSmFCRDJXU1ZPT1I0cURNYkp6bm9ORDVjcmhDNEszRFZKRDlDZ0o4TlUr?=
 =?utf-8?B?UjFuaGh0VzZNcEFXYWN5bGw2QXdyeGVEc2N2UUhFdlNiRFA3bGNvaWFPb0Rk?=
 =?utf-8?B?VVdoOEQxU0NML25jYzd3bzE3eFFaZkhQaUU3QUZ5bnJjOHA4emZScXhsZlBJ?=
 =?utf-8?B?L3pFenF3dHp5WElHTXdsd0xRamdLL0lyTVAvYmt5cHlpTW50dTR3blFTREt6?=
 =?utf-8?B?cWVnSkptV09IOExlRW1weklva0VzY3ZBbXJKZDh2Rk1jTmlQV01qQmUzZjBW?=
 =?utf-8?B?eVNIOGlxclBHbWF6eUxxUTBwYWdsdlE3R0dUcDhoODlmbC9INzluQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 563ccac0-85a0-4a07-eff8-08df1f361a1f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB7007.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 21:02:13.8526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uxlryR3p0SGyzOluS9ODyvCmEpnYoYj/C1tS7uVp9rabqO4L9iqByUjBAjiaRGvREz9BCabYuNC46tcR7r+DFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4101
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



On 2026-09-30 15:37, Melissa Wen wrote:
> 
> 
> On 30/09/2026 18:06, Harry Wentland wrote:
>>
>>
>> On 2026-09-02 13:58, Melissa Wen wrote:
>>> On AMD drivers, a CRTC remains active only while its primary plane is
>>> enabled; therefore, handing the primary's fb over to a non-primary plane
>>> would take the CRTC down with it. Create a dedicated fb for each
>>> non-primary plane before testing its colorops and discard it again
>>> afterward, leaving the primary plane and its prepare_crtc() fb intact.
>>> This is groundwork for the next commit, which checks colorop properties
>>> on an active color pipeline.
>>>
>>
>> This patch confuses me a bit. You mention that amdgpu needs an
>> FB on primary planes for a crtc to be active, which makes sense.
>> But this patch then only deals with non-primary planes. Does
>> amdgpu have a need for (non-primary) planes to have an attached
>> FB before allowing a COLOR_PIPELINE?
> 
> Sorry, reading it again I see I could have explained better what I'm 
> actually changing.
> 
> The issue this commit wants to solve is: we can only test/change colorop 
> properties of a given color pipeline if its color pipeline is active 
> (set in COLOR PIPELINE plane prop) which also means its plane has to be 
> active too.
> In the original version, the primary plane is active, but other planes 
> in a given CRTC isn't.
> 
> Before iterating over planes in a given CRTC, a frame buffer is already 
> attached to the primary plane (by prepare_crtc), yes.
> But then, when iterating over planes to check their color pipelines, if 
> it's not a primary plane, we need to set a separate fb to activate it 
> before setting the COLOR PIPELINE prop, keeping the primary plane active 
> with their own fb.
> I guess this confusing commit message came from my attempts to solve it 
> by initially reusing the "prepare_crtc" fb on overlay planes to activate 
> it >.<
> 

Thanks, that explains it and I was almost suspecting something like this.

With a rewritten commit message that makes it clear that the subsequent 
patch needs an FB for non-primary planes, in addition to the primary 
plane FB this patch is

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> I hope I was able to explain it better now. I'll rewrite the commit 
> message.
> 
> Melissa
> 
> 
>>
>> Harry
>>
>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>> ---
>>>
>>> v2:
>>> - detach different changes from a single commit (Chaitanya)
>>> v3:
>>> - move hunk from next patch to fix mem leak (Alex H/Chaitanya)
>>> ---
>>>   tests/kms_properties.c | 20 +++++++++++++++++++-
>>>   1 file changed, 19 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
>>> index 2b4cb152b..c55a271da 100644
>>> --- a/tests/kms_properties.c
>>> +++ b/tests/kms_properties.c
>>> @@ -237,7 +237,7 @@ static void 
>>> run_colorop_property_tests(igt_display_t *display,
>>>                          igt_crtc_t *crtc, igt_output_t *output,
>>>                          bool atomic)
>>>   {
>>> -    struct igt_fb fb;
>>> +    struct igt_fb fb, afb;
>>>       igt_plane_t *plane;
>>>       igt_colorop_t *colorop;
>>>       int i;
>>> @@ -255,6 +255,18 @@ static void 
>>> run_colorop_property_tests(igt_display_t *display,
>>>                igt_crtc_name(crtc), plane->index,
>>>                kmstest_plane_type_name(plane->type), output->name);
>>>   +        /* A non-primary plane needs an fb of its own: AMD keeps the
>>> +         * CRTC active only while the primary plane is enabled.
>>> +         */
>>> +        if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
>>> +            drmModeModeInfo *mode = igt_output_get_mode(output);
>>> +
>>> +            igt_create_pattern_fb(display->drm_fd, mode->hdisplay, 
>>> mode->vdisplay,
>>> +                          DRM_FORMAT_XRGB8888, 
>>> DRM_FORMAT_MOD_LINEAR, &afb);
>>> +
>>> +            igt_plane_set_fb(plane, &afb);
>>> +        }
>>> +
>>>           /* iterate over all color pipelines on plane */
>>>           for (i = 0; i < plane->num_color_pipelines; ++i) {
>>>               /* iterate over all colorops in pipeline*/
>>> @@ -272,6 +284,12 @@ static void 
>>> run_colorop_property_tests(igt_display_t *display,
>>>                   colorop = igt_find_colorop(display, colorop_id);
>>>               }
>>>           }
>>> +
>>> +        /* only the fb created above needs to go away here */
>>> +        if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
>>> +            igt_plane_set_fb(plane, NULL);
>>> +            igt_remove_fb(display->drm_fd, &afb);
>>> +        }
>>>       }
>>>         cleanup_crtc(display, crtc, output,
>>
> 

