Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FFF5CD1284
	for <igt-dev@archiver.kernel.org>; Thu,  4 Apr 2024 09:08:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 988C611A506;
	Thu,  4 Apr 2024 09:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="U73Q/vXH";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2125.outbound.protection.outlook.com [40.107.243.125])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7427711A506
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Apr 2024 09:08:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j4LVRcgtTsDqoKG2kRG080S+dowN+1CBRFZzXwSfkmZd+aV5tJNb0hQ7lpu99whd/6yQlqBVdQ/wk1YSnAC3eqN/IKnLbVlGuA4nakF1IdhLCIX8fKQ6F6sENcXg6jTuLJQjfzEuiidn3xIDw8pN2zkRA/RBpp1JlprBl1mwaL/hMHuQsJZIiDoo6dCRAIhLm/elhWVmL/xicLxhGxtmQZRLL0zEjdG+X2Ql0NT30vNpL7+awCRirVprhwzsu2a6IcrQie+cJNjBKkoP1rb9cp1yMQqEsgsr3Qwyz93aiMVgBzt6uoLwKzq14nZRxEqFt35VCFOf15FJNeX6ALx6+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q/YNAtCAfwJApLGxjeqv2LkymVenUmA13XtmFH/eC6Q=;
 b=AIo2C+w01W/X4LMwMB6siBtPEEIqyP63ttDp94j2RWyU8oNSr0WAYexkj5tIDe+oQIzkzpEAMRx3cHZlc7drMEPTzXF93kruoOjcY/2daV9JyuJ/+nrSI3XWjEAoNmu+t1KEcr99l5kqByXio3b7lmvzzVNf2RRWqhJk+rQ5tKdJyji4lgGHMTfkgI4QW09FMc3eBaEyP3X40JWKEHFx443QEU4TP//x/xZZjm82qY1yzmyirt3mtZs3a+s/yNYCoP/fuTBQA7uoQ0OGIwf1GufpOF1rkWbbsAFP3hUtbzNQZREJWCT6WI1w4PSk/hq/IKNC8M48R44MaDVn3rPP/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q/YNAtCAfwJApLGxjeqv2LkymVenUmA13XtmFH/eC6Q=;
 b=U73Q/vXHQMk6ofrtecNaxR0mvpSvEZz7uevDaCBMCErcbD6l5/6bUFdlGW25QptJUKwU9XGvGUAfxbKKP6h/Ok26IA0KBk4aa3uuT03xgiyhRDObzZlgw6TyI7tTIc7ecglmcHWsCOnedsOuWhi31IP31I3etSdAVmXT02gPJHQ=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4283.namprd12.prod.outlook.com (2603:10b6:5:211::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 4 Apr
 2024 09:08:21 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7409.042; Thu, 4 Apr 2024
 09:08:21 +0000
Message-ID: <0691d5fd-ab4a-4680-954f-6150cdf78e46@amd.com>
Date: Thu, 4 Apr 2024 11:08:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tools/gputop: Fix engine columns with amdgpu
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tursulin@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20240403150057.25765-1-tursulin@igalia.com>
 <20240403181858.kqf2r53zj7l332nu@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240403181858.kqf2r53zj7l332nu@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4283:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oSgXgsEfNYUCKuzZO27gjpst1CDrSamiLGsQH3ZW3SdOfaDQ7v+259JcLeHKzyAvT0pUE9Mjn+ZgX/OTxPGOrf40VcF4j8MT3Lll4ODt+Qr+IRxMShnHON7ILlQtcDksAhTiS9Mo+ZMY1Jfgm8kU42jKhfT5poWn9LN6R+fCogCc19IVLw0yO9D7zUCxRT2anl2g8gtD4pH/sKnAjjsR4q+fItCruT8ESkJeS0U2FFuhVEk0q+pVcZQWAYcIznnEixqZhfhNiSJ4BjUQnY15H4dAaJWWq6yYIHIdDe0zSAYlZ774BVtwiH3wxeVqa6m8+qkIxZqM4HwhJWstkyiXpvZ6cELE9bODy2xC0KHfenIIR6qwkWCB6JEJNHHXHjzEmOemqaewTYYYZ/AivuYOyl2NPgPwr1iIVV8odE+ifPNAhs2371P7pBps3Eaj9T/O20g0KOP2bGTNDEmGKI/ER8q2qAt8EpQ7C0/Qusz3zVlP4B3nLikJg1D0zqJAksF3TNFYI07NpTjnRbrn8dFZdZkTiTrFYB5c+sdsPgy2ZrTkan0RCQ8xaqnDXYHd3vsEctaB/ONgAz3Ft/cH7o+aU1JZWtfCcua0KJ1HvVlLHdTlLSOsfHzhPR/+dNXUWzk/jgb4aaz1ZVCe7AIYsx78pF+iVs4CD3xU8cUNd/gF218=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFhQQUtSOERQb0NadmhRN1VZdldoaXhudHRzMTEzV2I3Z3g4eE91TlkwUGtt?=
 =?utf-8?B?ZFM1WkVjMVNUWkNta2FvbkgwVmtteHNJUUNPeGVpcTk5L1ZlTXZDbmVXckRj?=
 =?utf-8?B?Mkl1VzJxc0lqbEJ3bHNGQTZuZGk4UmVLYTQ5L0J1YU1yejhlaUI4SW5uaWtr?=
 =?utf-8?B?bHcxb1dONCtXcWoyMkY0QXhKTk5scEV0REJiTi92QzFrRjZNa05ReFdoeitV?=
 =?utf-8?B?RFUyRVN0UXQ0ZUZPUDFZa2NBVmFTZGR6eHhKK2QzVnA5QzVFS2lhTE5PWEtv?=
 =?utf-8?B?WTBiNDlBODJ5VXdoa3BBTlZKZHBLdkR1a3BDbm5PcEIvdlk3M1FOVjVydG14?=
 =?utf-8?B?dGtMUTE2NFNGUVNMME5BMU5lSzRwNkdnK3FsRDlFSi9uNUZ1T0hUckF0akJ5?=
 =?utf-8?B?VTl1aUQvclBoUXl4bG5DYTk1MUE2Q3hhMkxCMGlkRmdvNXVpa00yVFlFN2FL?=
 =?utf-8?B?elI5NkZDMVVnL2twZ1VxcC83OUFCNitMS3FVMTNkbVBRZ0VCeHpMeDhZT1NS?=
 =?utf-8?B?blBoMERocGZ0ZStvamJqSG5CcVdKbG1YQnJQcGVxd1FnQ1ZuOVpXWEg1Nm1H?=
 =?utf-8?B?UnRrSTVkb1JxUUR4UkU1UXNRVFdZSWtBbUZyQlpldENNSHZmTmtGTkwvQXZh?=
 =?utf-8?B?L2MydWE2MlhaYjV2QzlCeHFoSTZzeFJiTzI0WmVydGJoMTl5TVI4UHVKRUJB?=
 =?utf-8?B?Tlkwb3grV0prN2FPeVIyZFNkVDQ0enRTb1Y3TW9ScXFRYjZXQ05PS0xZR1FB?=
 =?utf-8?B?S2xGVmxvM1hueVpaZEg2a0xWcUZDRHBsNFk2SGZ0cGwxMVlkdHU5OU9MOU5P?=
 =?utf-8?B?eklaZ0RYYkw2S2tUNHBxWUdBS3JDYi9BdDRSVWJWWi9PRXRZV2J2L2xpQUEw?=
 =?utf-8?B?Uy9EUXJ0YXRrMGdrUER3TkxneG1MQ1FEN0dIR3dUdzNrcitFVHJzV3Rtc1dW?=
 =?utf-8?B?NzhjWkJYMFhwU1dKaVFWNjgxWkFXSWNPeEVDQ2U2YUkvK05GWXN0TE00V3Qw?=
 =?utf-8?B?aldoZWZBTzJxYU1DcGZrRk1IemltZzV3RTNXa0U3STA5UzhObWtiVER3NENh?=
 =?utf-8?B?RU81bWpDSmpOcS93bzFsdTFRQTVZS3I0WlYwaG9CbWVTbW1Pcnk1dEdrV0g0?=
 =?utf-8?B?WmR5VnRSbkpiUit3azlWZWxmSGpzdGZ4ZDNtWEpjSC9wR3pWQmJHT1FQVlJx?=
 =?utf-8?B?eC9uQkFpTXVVMUMxOUIxOFI1NjdlSTVFaE94djkwQlVOS0RQdUovY3pFVTdR?=
 =?utf-8?B?MmdIVDVYeTlKeDFmYlJIOFk2MkRobkYzZk9MeVZjanlWSE50MGozUnhWY1d2?=
 =?utf-8?B?UVZNMmtxOC9haFdWV2lMS09TRHZUcGZQVFB5d1ZGWThJRElEekdkalgzNGZu?=
 =?utf-8?B?a2pKOXlSOGhWd3FOQ2FUUUdyTVZ3YytZRDNVc0ZrMjNMNG9nUkthMHJHZmRt?=
 =?utf-8?B?QnplUk0rRkRxanNyVDBKUzlrajBaKzhqRlBLZVVkMTZEMXZEcFphcGNXWXhY?=
 =?utf-8?B?Nkw1blVzcHdvTXZvdkxpWVpDQnNKQjZIRllDRVhuMUQ4bEJmL2V3eUdibW1Q?=
 =?utf-8?B?cDZ3SzZsNkxJWG5YSkwvbURUbXZCb3paOTdNbjJibjJTaENqdDdyVjkxV1lT?=
 =?utf-8?B?UFVmaXNFNWJydUpqQk9QV1dKdzFtamdmKzhHdWZ0Z2F6MHNrazZ2V0ZHdEJi?=
 =?utf-8?B?dHY3eE1nZkRDTFR6ZFlLbEVYSVZvaUxkazRiU3N4bUVzVFFBK3VkTDB2YjVz?=
 =?utf-8?B?dmhJSTdJakpTU05Xd2NHTWxIb3ZYZzNYNlQwY2tPbmVVRkFGUVNqZG1ZOUVF?=
 =?utf-8?B?Nk9KaEp2cEI0ajV1WU9BelhVVDZOMWVKbDY0S1NtUzU1QUtiNHVjM2lMcnpy?=
 =?utf-8?B?cnR5bkZzTWVSSzE2VEkvTzNjNHdITDg1VWNTT0MxMFEreGtCaXhuN1AySEJh?=
 =?utf-8?B?RzEvbUJnM3JhY1FUbmR0OFY3WTJrWUU5SXhuOTlMVFNvc01lazkrZ0M3WXFH?=
 =?utf-8?B?ZWZZNzU3VXd5eFg0dWc5cWZaL0RHR2t2aWh0MjJDWlFIcStEV2duQldUM2dR?=
 =?utf-8?B?VGZodU5KYmp5cjZveTFnNDczN2FvRStKQytJbkV4YUNSTGVJb09HTlRqL0ZK?=
 =?utf-8?Q?inrL3Drnfulo6RaKU8ZR5y/BD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3a1d133-6e4d-422a-eafe-08dc5486c666
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 09:08:21.2342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o78rumH1Waxesrc0v6CKdpyRqr4oX4aj62OdxhaMn6mojK/y5nzUQocA4a5YFt+E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4283
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

Am 03.04.24 um 20:18 schrieb Kamil Konieczny:
> Hi Tvrtko,
> On 2024-04-03 at 16:00:57 +0100, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> Amdgpu kernel driver skips output of fdinfo keys for unused engines. That
>> is completely legal but corrupts the column formatting in the current
>> code.
>>
>> Fix it by simply treating change in detected engines used by a client
>> as trigger to re-emit a new header. This ensures columns are always
>> correctly aligned, albeit with a cost of potentially duplicating the
>> header for the same DRM minor.
>>
>> This is considered good enough for a reference implementation. The
>> alternative would be to add some real per DRM minor state tracking which
>> sounds like an overkill, at least until gputop gains a nicer (any) UI.
> +Cc few amd devs:
>
> Alex Deucher <alexander.deucher@amd.com>
> Christian Koenig <christian.koenig@amd.com>
> Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> Change looks ok so from me:
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Acked-by: Christian König <christian.koenig@amd.com>

Thanks for taking care of this,
Christian.

>
> Regards,
> Kamil
>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> ---
>>   tools/gputop.c | 27 ++++++++++++++++++++++++++-
>>   1 file changed, 26 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/gputop.c b/tools/gputop.c
>> index 71e28f43ee4c..76075c5dde8b 100644
>> --- a/tools/gputop.c
>> +++ b/tools/gputop.c
>> @@ -119,11 +119,36 @@ print_client_header(struct igt_drm_client *c, int lines, int con_w, int con_h,
>>   	return lines;
>>   }
>>   
>> +static bool
>> +engines_identical(const struct igt_drm_client *c,
>> +		  const struct igt_drm_client *pc)
>> +{
>> +	unsigned int i;
>> +
>> +	if (c->engines->num_engines != pc->engines->num_engines ||
>> +	    c->engines->max_engine_id != pc->engines->max_engine_id)
>> +		return false;
>> +
>> +	for (i = 0; i <= c->engines->max_engine_id; i++)
>> +		if (c->engines->capacity[i] != pc->engines->capacity[i] ||
>> +		    !!c->engines->names[i] != !!pc->engines->names[i] ||
>> +		    strcmp(c->engines->names[i], pc->engines->names[i]))
>> +			return false;
>> +
>> +	return true;
>> +}
>>   
>>   static bool
>>   newheader(const struct igt_drm_client *c, const struct igt_drm_client *pc)
>>   {
>> -	return !pc || c->drm_minor != pc->drm_minor;
>> +	return !pc || c->drm_minor != pc->drm_minor ||
>> +	       /*
>> +		* Below is a a hack for drivers like amdgpu which omit listing
>> +		* unused engines. Simply treat them as separate minors which
>> +		* will ensure the per-engine columns are correctly sized in all
>> +		* cases.
>> +		*/
>> +	       !engines_identical(c, pc);
>>   }
>>   
>>   static int
>> -- 
>> 2.44.0
>>

