Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C508C48BF6
	for <igt-dev@archiver.kernel.org>; Wed, 21 Feb 2024 08:55:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B675010E21D;
	Wed, 21 Feb 2024 08:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gi+gZr1i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE7E10E0D9
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2024 08:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708505705; x=1740041705;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aPnRSQsml+0L11iZnOeDOVTupgaMR/T4cPF+cZoYM/Y=;
 b=Gi+gZr1iyaNdyHbfRJDiylx/pdkXCXKWgndqTbO6kjE6S2yroOf1JYJ5
 p9LuXLmMblO3kgW+o4D8fYQGmPM0H2ul9ZXGAWS5lDearRFo5NMNzVDrt
 ZfQLDyYWPd20sLea1taWVU2mSurhldLAizF1vFG1kWSbBCaFycm2fX4ZA
 Kn4YvrAI9V8fGr4E2At031egq6DiozdE+JaiQGMfqcQOxAMtZm9Y7Amb0
 LC7krd2ASd23SPAkc+UkVj30/2FU9KMTnlzE6j4+Ts7R+ZRCWolguv9wi
 q6qxeN5P8YkUujkgSJNQ/t26QTKD1pd5qv2VYWpqvuc+vGpqwklUdPp2a w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="13355784"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; d="scan'208";a="13355784"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 00:55:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; d="scan'208";a="35830542"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2024 00:55:04 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 00:55:03 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 00:55:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 21 Feb 2024 00:55:03 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 21 Feb 2024 00:55:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VFZj3boNpDHxxiFBALnJ3HOu/1PNyVdI7Bdu/AeTCPqzeiODn1nPLBA5GKfdElG/O+WV98CltO2GTT7koE5LEJ4P8WmzieKNcv17H/utzuA+lgnj98ZjiaHqTWcYpzMEFoYWdbPh2AfuDHiq7/7kD5QhMYD1+dG45H31/e5gxI39Ah1VlR+UOwGkcUcciq3Vwp/a6sdt+v2pzVzDkEtpHUhdfq3AzHZmC2YzrphLH/u+Sw3gmkHFy7rUuVHZX/bILTRT/XJqGOsoNmVWDaf2rAy8ksqPYoy17LERQldi6077GvksNH3Usmwjz/Xb7AULkgalqlHPmMxcM4krKsZQ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXDZcC25P7J0f2H4QFqur5Q0TTEwnKSnHKQMuH9fDQw=;
 b=IR8zdZDjl1zTlQw69Pl+f/ChSZ05uD/KhA1OS/R3DtAeZPzVtxjU18iKqDUaTNdLNbAqHvOmDvibHFpCxUkOlvLgbNGvGQQMRUiynJ+GWZMM/yJI7s31ZxTgyELCHhFprBaWmcRdwPeAVBMlzalFpK4HqBxJxkr5xoek5vBJyahtK0YANfrY9HbIjTSc+8ugSnFsXBHGhHTLITiFbvP7YLvTkYPgFKuDH2IKt+gd4V3gEoRhDt7TQRL5H9Cka+5TNqbQK22zKVVHI3vvcBOsGMmnDvGKgeWwRtHXN63NwPGdjqGfuONf0j26BSlhk/ltKD4UgDtkGyEbXvs7xBmUAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by CH3PR11MB7938.namprd11.prod.outlook.com (2603:10b6:610:12f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Wed, 21 Feb
 2024 08:54:55 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::bf71:4b0e:6d66:e035]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::bf71:4b0e:6d66:e035%3]) with mapi id 15.20.7292.036; Wed, 21 Feb 2024
 08:54:55 +0000
Message-ID: <c96dd3cc-a62e-4a75-b251-4a84d20ad8c4@intel.com>
Date: Wed, 21 Feb 2024 14:24:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] tests/intel/kms_psr2_sf: extend tests for panel
 replay sf
Content-Language: en-US
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>, "Manna, Animesh"
 <animesh.manna@intel.com>
References: <20240219163333.2339647-1-kunal1.joshi@intel.com>
 <20240219163333.2339647-4-kunal1.joshi@intel.com>
 <1d0592fafbc95232000a77cba80524a2843d42ff.camel@intel.com>
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <1d0592fafbc95232000a77cba80524a2843d42ff.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0067.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::7) To CY8PR11MB6889.namprd11.prod.outlook.com
 (2603:10b6:930:5e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB6889:EE_|CH3PR11MB7938:EE_
X-MS-Office365-Filtering-Correlation-Id: 0602e3ab-f7d1-491e-00c5-08dc32bac659
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +rxjgGmmYbdBWdEPb/3yShV8BSsLVj5elnd8oxaOyKacBUpr0yxbvhZaANMM/Y8lrywaIMQJn0Mh/Le+nlj7dpQ5DUJ9I7h5OvZZr8vEfwWtRYaDLwtT3AXe52xBv6V3Y8AZW7oDfp31tbfE80Ol68SpRpArZltDcv7pc8gUoAU1UyS8Y4T055c8qTFp1Ex+Qp62FJM294x2s4V+3Cm0WnZEfzgsyAl1KbaZuqur54AI3cnu771yo+20sxkNjXo20nq6vgMshhIPbu18s3z1wbqdZg2FITA3CTQcLFcwumZBLtp/OkvWfJ/8fH2yOmyB797Gep7p9f5bi1FlBnP6Deuadf480Y0KtkZXanOKNHxLu2PReVcgMaGbhD0AbB1Ru6qgUL/mGruo9NZkjQMx+0pQYFoOKb78111bfgxpsSNTFxpJEhAyiHWbbWbT700+ndfK8kP7rpbUoeuJrjETeZyQHnDPSVCxBa+qXVA1UpfvnQ5V1jMXqVWsuBiy6R7JKKU9Mi77knqVOnMmJyrXJbv3B3N+H+0S6k2HGmieeJ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zlh2ZVl1bnNXNVFETnBPcDB2Y2pWMWtsS0drQzB0Q2hEbW5QMlArbnU5cHJj?=
 =?utf-8?B?RnRsVDRiTjRZUThxVFV0VEM4bGJIOG9wL3kzZjBJdENtUTFxa2NWWlp6OEFZ?=
 =?utf-8?B?YWlCYmVwR2t3MGVkV3RQTWdTQWtPcVQ3d3Z4cWhHdlJTaS9ZVzNRckhWdmJG?=
 =?utf-8?B?YjdsWUl4QlFKTUp0cUZBbXlYLy9mRlRtT3FoSjNzd0tsd1VXVUtjVlRWQTZ6?=
 =?utf-8?B?UnR3blBBODFwajFCTy9yMkU2NjRxSU84YXBadnNxa0FNOWtjMENMbEp3bWph?=
 =?utf-8?B?eUIvUjFac0lIMGV3SDRJYkZKNiswVkNockJoVnlDTm5MZWcwcFJ6ckV3cFNK?=
 =?utf-8?B?Rys5bEh4UGFTUGMySXlNVVFIMW91UHQ4OTk1U1dSTFhBcmNOVjg5S0NWWjhw?=
 =?utf-8?B?VTdsUnhBUG1IWUtMeXFHK096VElIc25peTFRaTJvVGxnOWhYT2Q2ODNsMWNX?=
 =?utf-8?B?WkRnSkVpT3FvT1MzTlZ1NW1OeHFaMER1TVYrK3NKbGVsbldVMzBneVQrUjFx?=
 =?utf-8?B?WG5UWUZGTW1EejI1UlIwR0J1NVZFYzVHblRXWFpaUE95VzF1OURiN05WN2Z3?=
 =?utf-8?B?cGEzTUF0aWN1ajNqaVNVczJiUk92aENjQ2xVWTFWU09sV3lncjMzVUdXMVg1?=
 =?utf-8?B?VE5JelFrOGtnTHJpU1hSR3lIUU1ZTVVDWkpZZzNCUUcyblVhQngwczB2cGc2?=
 =?utf-8?B?NkNQd3dTNFliZzBDWVBGVW43K1dBeTI5cWFCQzh5WW45Z1FGZ29CQTExTDlM?=
 =?utf-8?B?UUx6REtSTWdOMGFlRzlDOG1QbUVSMDl5anJDemxObERQSFZERXRHdTJVQjA0?=
 =?utf-8?B?c1cvbC9Db3lHcGw1aXVjSHhHeFpLazdXY1VScnoyOVJaRUdpaXJVeEd1MTJ4?=
 =?utf-8?B?Tm8xaGk2czJSTC8raExpRFlyNFB5YTlkU2JkeGQ2TThUM0VNVkhWMUtOTmc3?=
 =?utf-8?B?TXB3T2V5QlVZaUtXRERlMWU3SUFTRzJSTmV1cFdVMFNRUU1rL2Q5WEk1dkY1?=
 =?utf-8?B?Q0JOeHpIbFl0QTZEY29SbnVaVkVOSVJLR2ZkYk9DakNrNkNuanB1OEZ4TXA0?=
 =?utf-8?B?Qm16QmUrNXgvZmRzbGNEckViNzIrQWdiOWZPNmlGTlNlbmViOFVZaXFnMUJO?=
 =?utf-8?B?SEE3MUpvM3ZJRTBndnJpWVc5TlkxU01PdWhXSDVJUUppcTdZUllJbW9sUlpV?=
 =?utf-8?B?eS9JYUI5UmxLQkZ0ejc2SzBDem9QUWNEZjFJUEtjcEltV1dvQW83WUYxREpS?=
 =?utf-8?B?UkRLdlIzd1k5ZzdhMmRyQytrOHFGa1hDZ0gvS1BlWHZaOWg4bDBGUGN1ZGow?=
 =?utf-8?B?ZTVZOEJBb3VDOUpvZ0pIUzNvdHUvaDU0Njk2RnNvR1AraVNEZXo3OTRDMGdQ?=
 =?utf-8?B?Ukx5bjRMSmFpV1l4b3V0RGk1SG55M1RxcjB4Nk5oMnhydEx0NWdrbFZ2elRh?=
 =?utf-8?B?ZWl2V0NVOGxCbWdaMFd3OWN6aUdrZHpuMzVUYWg0OXk3dDVNWDNLQllVbk9L?=
 =?utf-8?B?VHAweUhmeGFOV0NFdHNVaWpPS3RjYTJLNUVHNVhVMndOMFhYeEpNaEErNENJ?=
 =?utf-8?B?Q1oxMk9KSjJMd2paSHQ4WFdKeXppNkVFQlpuRFk4YzRFNHJRdmNkL3hub3NE?=
 =?utf-8?B?S3lrd1hHYWpiUkwxT0hVbXZLQnByUUJMV0E3UVVlVGxYVmdXMjlQMmMxK1dk?=
 =?utf-8?B?eTNCVDM2bWJUdXdMSGRPRm9ENUhhM2RHUEYzUFE2TmU5d3JHaERmb3lHaHhT?=
 =?utf-8?B?d3V0cGlqRExUeGYyUVRxUGhmKzZZbkxuTlJ6MEx3T1grZkpwbGZVNk53QlR6?=
 =?utf-8?B?d0M1Wk9kSGJyUU9ybXppL2JYK015NUtiQnJKNDNpbXdka0VJZld3YlZyMmtB?=
 =?utf-8?B?bmpGbnVJRkM1akhUbEtkSDQ0dnZIN1RTUHNma2dCZVZWdGlQTlphdWEvM0dS?=
 =?utf-8?B?bjdWTzVBZnNvOEN6VFZkbFpvaFFHajg3TnNocU1weGtlZjNGcjEwcEk0M3Jl?=
 =?utf-8?B?VmRHUitCUnYwMWh1VldBVlN5WUlyNEtVTGN1cVUxdkFLNXB2czJqY1hTYldt?=
 =?utf-8?B?T2lGVzA5R3BTTVp0WlF2VVBhNzhPNjQ1anBCZU9TTnN3TklVRTlDZGZXemg0?=
 =?utf-8?Q?4xjYsdF5m2xYEvj4E9NXi9GgK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0602e3ab-f7d1-491e-00c5-08dc32bac659
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 08:54:55.6226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Cxpn7Jt82k7TtewMVeVPmC9Ye+QM3bi1ptF2rTUQytrgtm98tjXMobMYnSM7/artJdskqPU1RKrIxGem75XVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7938
X-OriginatorOrg: intel.com
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

Hello Jouni,

On 2/20/2024 2:36 PM, Hogander, Jouni wrote:
> On Mon, 2024-02-19 at 22:03 +0530, Kunal Joshi wrote:
>> Extend the tests to cover panel replay selective fetch feature.
>>
>>  From kms_psr2_sf test point of view we have
>> check_pr_psr2_sel_fetch_support
>> function to check if PR/PSR2 selective fetch is supported for an
>> output
>> if output supports selective fetch then we check we if enter
>> DEEP_SLEEP mode
>> in run function
>>
>> v2: fixed dynamic test name
>> v3: use check_psr2_support (Jouni)
>> v4: correct order of checks in check_pr_psr2_sel_fetch_support
>> (Jouni)
>>      use appropriate psr mode in psr_wait_entry (Jouni)
>> v5: modify get_sel_fetch_mode_for_output to use member data (Jouni)
>>
>> Cc: Jouni Högander <jouni.hogander@intel.com>
>> Cc: Animesh Manna <animesh.manna@intel.com>
>> Cc: Arun R Murthy <arun.r.murthy@intel.com>
>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>> ---
>>   tests/intel/kms_psr2_sf.c | 191 +++++++++++++++++++++++++++---------
>> --
>>   1 file changed, 138 insertions(+), 53 deletions(-)
>>
>> diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
>> index 0fb300161..15046fd67 100644
>> --- a/tests/intel/kms_psr2_sf.c
>> +++ b/tests/intel/kms_psr2_sf.c
>> @@ -172,6 +172,7 @@ typedef struct {
>>          uint32_t screen_changes;
>>          int cur_x, cur_y;
>>          enum pipe pipe;
>> +       enum psr_mode psr_mode;
>>          enum {
>>                  FEATURE_NONE  = 0,
>>                  FEATURE_DSC   = 1,
>> @@ -179,6 +171,39 @@ typedef struct {
>>          } coexist_feature;
>>   } data_t;
>>   
>> +static bool get_sel_fetch_mode_for_output(data_t *data)
>> +{
>> +       bool supported = false;
>> +
>> +       if (psr_sink_support(data->drm_fd, data->debugfs_fd,
>> +                                                PR_MODE_SEL_FETCH,
>> data->output)) {
>> +               supported = true;
>> +               data->psr_mode = PR_MODE_SEL_FETCH;
>> +       } else if (psr_sink_support(data->drm_fd, data->debugfs_fd,
>> +                                                         PSR_MODE_2,
>> data->output)) {
>> +               supported = true;
>> +               data->psr_mode = PSR_MODE_2;
>> +       } else
>> +               igt_info("selective fetch not supported on output
>> %s\n", data->output->name);
>> +
>> +       return supported;
>> +}
>> +
>> +static const char *get_psr_mode_str_for_output(data_t *data)
>> +{
>> +       static const char *psr_mode;
> If get_sel_fetch_mode_for_output returns false for some reason you will
> have something in psr_mode pointer.
>
> If you want to call get_sel_fetch_mode_for_output here I think you
> should use assert. Another option is to leave it to caller. I think
> that would be more clear solution. Currently code below works because
> it is called here.
>
>> +
>> +       if (get_sel_fetch_mode_for_output(data)) {
>> +               if (data->psr_mode == PSR_MODE_2)
>> +                       psr_mode = "psr2";
>> +               else if (data->psr_mode == PR_MODE_SEL_FETCH)
>> +                       psr_mode = "pr";
>> +               else
>> +                       igt_assert_f(false, "Invalid psr mode\n");
>> +       }
>> +       return psr_mode;
>> +}
>> +
>>   static const char *op_str(enum operations op)
>>   {
>>          static const char * const name[] = {
>> @@ -688,7 +722,7 @@ static void damaged_plane_move(data_t *data)
>>   
>>          igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>   
>> -       igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2,
>> NULL));
>> +       igt_assert(psr_wait_entry(data->debugfs_fd, data->psr_mode,
>> data->output));
>>   
>>          expected_output(data);
>>   }
>> @@ -788,7 +822,7 @@ static void plane_move_continuous(data_t *data)
>>   {
>>          int target_x, target_y;
>>   
>> -       igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2,
>> NULL));
>> +       igt_assert(psr_wait_entry(data->debugfs_fd, data->psr_mode,
>> data->output));
>>   
>>          get_target_coords(data, &target_x, &target_y);
>>   
>> @@ -865,7 +899,7 @@ static void damaged_plane_update(data_t *data)
>>          igt_plane_set_position(data->test_plane, 0, 0);
>>          igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>   
>> -       igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2,
>> NULL));
>> +       igt_assert(psr_wait_entry(data->debugfs_fd, data->psr_mode,
>> data->output));
>>   
>>          expected_output(data);
>>   }
>> @@ -874,7 +908,7 @@ static void run(data_t *data)
>>   {
>>          int i;
>>   
>> -       igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2,
>> NULL));
>> +       igt_assert(psr_wait_entry(data->debugfs_fd, data->psr_mode,
>> data->output));
>>   
>>          if (data->fbc_flag == true && data->op_fbc_mode ==
>> FBC_ENABLED)
>>                  igt_assert_f(intel_fbc_wait_until_enabled(data-
>>> drm_fd,
>> @@ -952,14 +986,22 @@ static void cleanup(data_t *data)
>>          igt_remove_fb(data->drm_fd, &data->fb_test);
>>   }
>>   
>> -static int check_psr2_support(data_t *data)
>> +static bool check_pr_psr2_sel_fetch_support(data_t *data)
>>   {
>> -       int status;
>> +       bool status = false;
>> +
>> +       /* Check sink supports PR/PSR2 selective fetch */
>> +       if (!get_sel_fetch_mode_for_output(data))
>> +               return false;
>> +
>> +       /* Check if selective fetch can be enabled */
>> +       if (!selective_fetch_check(data->debugfs_fd, data->output))
>> +               igt_assert("Selective fetch is not enabled even
>> though panel should support it\n");
>>   
>>          prepare(data);
>> -       status = psr_wait_entry(data->debugfs_fd, PSR_MODE_2, NULL);
>> +       /* We enter into DEEP_SLEEP for both PSR2 and PR sel fetch */
>> +       status = psr_wait_entry(data->debugfs_fd, data->psr_mode,
>> data->output);
>>          cleanup(data);
>> -
>>          return status;
>>   }
>>   
>> @@ -981,6 +1023,8 @@ pipe_output_combo_valid(igt_display_t *display,
>>   
>>   igt_main
>>   {
>> +       bool output_supports_pr_psr2_sel_fetch = false;
>> +       bool pr_psr2_sel_fetch_supported = false;
>>          data_t data = {};
>>          igt_output_t *outputs[IGT_MAX_PIPES * IGT_MAX_PIPES];
>>          int i, j, k, y;
>> @@ -1000,11 +1044,6 @@ igt_main
>>                  data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
>>                  kmstest_set_vt_graphics_mode();
>>   
>> -               igt_require_f(psr_sink_support(data.drm_fd,
>> -                                              data.debugfs_fd,
>> PSR_MODE_2,
>> -                                              NULL),
>> -                             "Sink does not support PSR2\n");
>> -
>>                  display_init(&data);
>>   
>>                  if
>> ((intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 20) &&
>> @@ -1028,7 +1067,8 @@ igt_main
>>   
>>                  for_each_pipe_with_valid_output(&data.display,
>> data.pipe, data.output) {
>>                          coexist_features[n_pipes] = 0;
>> -                       if (check_psr2_support(&data)) {
>> +                       output_supports_pr_psr2_sel_fetch =
>> check_pr_psr2_sel_fetch_support(&data);
>> +                       if (output_supports_pr_psr2_sel_fetch) {
>>                                  pipes[n_pipes] = data.pipe;
>>                                  outputs[n_pipes] = data.output;
>>   
>> @@ -1037,7 +1077,10 @@ igt_main
>>   
>>                                  n_pipes++;
>>                          }
>> +                       pr_psr2_sel_fetch_supported |=
>> output_supports_pr_psr2_sel_fetch;
>>                  }
>> +               igt_require_f(pr_psr2_sel_fetch_supported,
>> +                                         "No output supports
>> selective fetch\n");
>>          }
>>   
>>          for (y = 0; y < ARRAY_SIZE(fbc_status); y++) {
>> @@ -1054,17 +1097,20 @@ igt_main
>>                          for (i = 0; i < n_pipes; i++) {
>>                                  if
>> (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
>>                                          continue;
>> +                               data.pipe = pipes[i];
>> +                               data.output = outputs[i];
>>   
>>                                  for (j = FEATURE_NONE; j <
>> FEATURE_COUNT; j++) {
>>                                          if (j != FEATURE_NONE &&
>> !(coexist_features[i] & j))
>>                                                  continue;
>> -                                       igt_dynamic_f("pipe-%s-%s%s",
>> kmstest_pipe_name(pipes[i]),
>> +                                       igt_dynamic_f("%s-pipe-%s-
>> %s%s", get_psr_mode_str_for_output(&data),
> Here it is not clear that data->psr_mode is actually initialized by
> get_psr_mode_str_for_output(&data). On first glance it looks like just
> getter for some string.
>
> BR,
>
> Jouni Högander

Thanks for reviewing this series :)
Have sent new revision address comments.

Regards
Kunal Joshi

>
>> +
>> kmstest_pipe_name(pipes[i]),
>>                                                       
>> igt_output_name(outputs[i]),
>>                                                       
>> coexist_feature_str(j)) {
>> -                                               data.pipe = pipes[i];
>> -                                               data.output =
>> outputs[i];
>>                                                  data.test_plane_id =
>> DRM_PLANE_TYPE_PRIMARY;
>>                                                  data.coexist_feature
>> = j;
>> +                                               igt_assert_f(get_sel_
>> fetch_mode_for_output(&data),
>> +
>>      "Invalid psr mode\n");
>>                                                  for (k = 1; k <=
>> MAX_DAMAGE_AREAS; k++) {
>>                                                          data.damage_a
>> rea_count = k;
>>                                                          prepare(&data
>> );
>> @@ -1087,18 +1133,21 @@ igt_main
>>                                          if
>> (!pipe_output_combo_valid(&data.display, pipes[i],
>>                                                                      
>> outputs[i]))
>>                                                  continue;
>> +                                       data.pipe = pipes[i];
>> +                                       data.output = outputs[i];
>>   
>>                                          for (j = FEATURE_NONE; j <
>> FEATURE_COUNT; j++) {
>>                                                  if (j != FEATURE_NONE
>> && !(coexist_features[i] & j))
>>                                                          continue;
>> -                                               igt_dynamic_f("pipe-
>> %s-%s%s",
>> +                                               igt_dynamic_f("%s-
>> pipe-%s-%s%s",
>> +
>> get_psr_mode_str_for_output(&data),
>>                                                               
>> kmstest_pipe_name(pipes[i]),
>>                                                               
>> igt_output_name(outputs[i]),
>>                                                               
>> coexist_feature_str(j)) {
>> -                                                       data.pipe =
>> pipes[i];
>> -                                                       data.output =
>> outputs[i];
>>                                                          data.test_pla
>> ne_id = DRM_PLANE_TYPE_PRIMARY;
>>                                                          data.coexist_
>> feature = j;
>> +                                                       igt_assert_f(
>> get_sel_fetch_mode_for_output(&data),
>> +
>>              "Invalid psr mode\n");
>>                                                          for (k = 1; k
>> <= MAX_DAMAGE_AREAS; k++) {
>>                                                                  data.
>> damage_area_count = k;
>>                                                                  prepa
>> re(&data);
>> @@ -1119,17 +1168,20 @@ igt_main
>>                          for (i = 0; i < n_pipes; i++) {
>>                                  if
>> (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
>>                                          continue;
>> +                               data.pipe = pipes[i];
>> +                               data.output = outputs[i];
>>   
>>                                  for (j = FEATURE_NONE; j <
>> FEATURE_COUNT; j++) {
>>                                          if (j != FEATURE_NONE &&
>> !(coexist_features[i] & j))
>>                                                  continue;
>> -                                       igt_dynamic_f("pipe-%s-%s%s",
>> kmstest_pipe_name(pipes[i]),
>> +                                       igt_dynamic_f("%s-pipe-%s-
>> %s%s", get_psr_mode_str_for_output(&data),
>> +
>> kmstest_pipe_name(pipes[i]),
>>                                                       
>> igt_output_name(outputs[i]),
>>                                                       
>> coexist_feature_str(j)) {
>> -                                               data.pipe = pipes[i];
>> -                                               data.output =
>> outputs[i];
>>                                                  data.test_plane_id =
>> DRM_PLANE_TYPE_OVERLAY;
>>                                                  data.coexist_feature
>> = j;
>> +                                               igt_assert_f(get_sel_
>> fetch_mode_for_output(&data),
>> +
>>      "Invalid psr mode\n");
>>                                                  for (k = 1; k <=
>> MAX_DAMAGE_AREAS; k++) {
>>                                                          data.damage_a
>> rea_count = k;
>>                                                          prepare(&data
>> );
>> @@ -1149,17 +1201,20 @@ igt_main
>>                          for (i = 0; i < n_pipes; i++) {
>>                                  if
>> (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
>>                                          continue;
>> +                               data.pipe = pipes[i];
>> +                               data.output = outputs[i];
>>   
>>                                  for (j = FEATURE_NONE; j <
>> FEATURE_COUNT; j++) {
>>                                          if (j != FEATURE_NONE &&
>> !(coexist_features[i] & j))
>>                                                  continue;
>> -                                       igt_dynamic_f("pipe-%s-%s%s",
>> kmstest_pipe_name(pipes[i]),
>> +                                       igt_dynamic_f("%s-pipe-%s-
>> %s%s", get_psr_mode_str_for_output(&data),
>> +
>> kmstest_pipe_name(pipes[i]),
>>                                                       
>> igt_output_name(outputs[i]),
>>                                                       
>> coexist_feature_str(j)) {
>> -                                               data.pipe = pipes[i];
>> -                                               data.output =
>> outputs[i];
>>                                                  data.test_plane_id =
>> DRM_PLANE_TYPE_CURSOR;
>>                                                  data.coexist_feature
>> = j;
>> +                                               igt_assert_f(get_sel_
>> fetch_mode_for_output(&data),
>> +
>>      "Invalid psr mode\n");
>>                                                  prepare(&data);
>>                                                  run(&data);
>>                                                  cleanup(&data);
>> @@ -1175,17 +1230,20 @@ igt_main
>>                          for (i = 0; i < n_pipes; i++) {
>>                                  if
>> (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
>>                                          continue;
>> +                               data.pipe = pipes[i];
>> +                               data.output = outputs[i];
>>   
>>                                  for (j = FEATURE_NONE; j <
>> FEATURE_COUNT; j++) {
>>                                          if (j != FEATURE_NONE &&
>> !(coexist_features[i] & j))
>>                                                  continue;
>> -                                       igt_dynamic_f("pipe-%s-%s%s",
>> kmstest_pipe_name(pipes[i]),
>> +                                       igt_dynamic_f("%s-pipe-%s-
>> %s%s", get_psr_mode_str_for_output(&data),
>> +
>> kmstest_pipe_name(pipes[i]),
>>                                                       
>> igt_output_name(outputs[i]),
>>                                                       
>> coexist_feature_str(j)) {
>> -                                               data.pipe = pipes[i];
>> -                                               data.output =
>> outputs[i];
>>                                                  data.test_plane_id =
>> DRM_PLANE_TYPE_CURSOR;
>>                                                  data.coexist_feature
>> = j;
>> +                                               igt_assert_f(get_sel_
>> fetch_mode_for_output(&data),
>> +
>>      "Invalid psr mode\n");
>>                                                  prepare(&data);
>>                                                  run(&data);
>>                                                  cleanup(&data);
>> @@ -1202,17 +1260,20 @@ igt_main
>>                          for (i = 0; i < n_pipes; i++) {
>>                                  if
>> (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
>>                                          continue;
>> +                               data.pipe = pipes[i];
>> +                               data.output = outputs[i];
>>   
>>                                  for (j = FEATURE_NONE; j <
>> FEATURE_COUNT; j++) {
>>                                          if (j != FEATURE_NONE &&
>> !(coexist_features[i] & j))
>>                                                  continue;
>> -                                       igt_dynamic_f("pipe-%s-%s%s",
>> kmstest_pipe_name(pipes[i]),
>> +                                       igt_dynamic_f("%s-pipe-%s-
>> %s%s", get_psr_mode_str_for_output(&data),
>> +
>> kmstest_pipe_name(pipes[i]),
>>                                                       
>> igt_output_name(outputs[i]),
>>                                                       
>> coexist_feature_str(j)) {
>> -                                               data.pipe = pipes[i];
>> -                                               data.output =
>> outputs[i];
>>                                                  data.test_plane_id =
>> DRM_PLANE_TYPE_CURSOR;
>>                                                  data.coexist_feature
>> = j;
>> +                                               igt_assert_f(get_sel_
>> fetch_mode_for_output(&data),
>> +
>>      "Invalid psr mode\n");
>>                                                  prepare(&data);
>>                                                  run(&data);
>>                                                  cleanup(&data);
>> @@ -1229,17 +1290,20 @@ igt_main
>>                          for (i = 0; i < n_pipes; i++) {
>>                                  if
>> (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
>>                                          continue;
>> +                               data.pipe = pipes[i];
>> +                               data.output = outputs[i];
>>   
>>                                  for (j = FEATURE_NONE; j <
>> FEATURE_COUNT; j++) {
>>                                          if (j != FEATURE_NONE &&
>> !(coexist_features[i] & j))
>>                                                  continue;
>> -                                       igt_dynamic_f("pipe-%s-%s%s",
>> kmstest_pipe_name(pipes[i]),
>> +                                       igt_dynamic_f("%s-pipe-%s-
>> %s%s", get_psr_mode_str_for_output(&data),
>> +
>> kmstest_pipe_name(pipes[i]),
>>                                                       
>> igt_output_name(outputs[i]),
>>                                                       
>> coexist_feature_str(j)) {
>> -                                               data.pipe = pipes[i];
>> -                                               data.output =
>> outputs[i];
>>                                                  data.test_plane_id =
>> DRM_PLANE_TYPE_CURSOR;
>>                                                  data.coexist_feature
>> = j;
>> +                                               igt_assert_f(get_sel_
>> fetch_mode_for_output(&data),
>> +
>>      "Invalid psr mode\n");
>>                                                  prepare(&data);
>>                                                  run(&data);
>>                                                  cleanup(&data);
>> @@ -1257,17 +1321,21 @@ igt_main
>>                          for (i = 0; i < n_pipes; i++) {
>>                                  if
>> (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
>>                                          continue;
>> +                               data.pipe = pipes[i];
>> +                               data.output = outputs[i];
>>   
>>                                  for (j = FEATURE_NONE; j <
>> FEATURE_COUNT; j++) {
>>                                          if (j != FEATURE_NONE &&
>> !(coexist_features[i] & j))
>>                                                  continue;
>> -                                       igt_dynamic_f("pipe-%s-%s%s",
>> kmstest_pipe_name(pipes[i]),
>> +                                       igt_dynamic_f("%s-pipe-%s-
>> %s%s",
>> +
>> get_psr_mode_str_for_output(&data),
>> +
>> kmstest_pipe_name(pipes[i]),
>>                                                       
>> igt_output_name(outputs[i]),
>>                                                       
>> coexist_feature_str(j)) {
>> -                                               data.pipe = pipes[i];
>> -                                               data.output =
>> outputs[i];
>>                                                  data.test_plane_id =
>> DRM_PLANE_TYPE_OVERLAY;
>>                                                  data.coexist_feature
>> = j;
>> +                                               igt_assert_f(get_sel_
>> fetch_mode_for_output(&data),
>> +
>>      "Invalid psr mode\n");
>>                                                  for (k =
>> POS_TOP_LEFT; k <= POS_BOTTOM_RIGHT ; k++) {
>>                                                          data.pos = k;
>>                                                          prepare(&data
>> );
>> @@ -1286,17 +1354,20 @@ igt_main
>>                  ��       for (i = 0; i < n_pipes; i++) {
>>                                  if
>> (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
>>                                          continue;
>> +                               data.pipe = pipes[i];
>> +                               data.output = outputs[i];
>>   
>>                                  for (j = FEATURE_NONE; j <
>> FEATURE_COUNT; j++) {
>>                                          if (j != FEATURE_NONE &&
>> !(coexist_features[i] & j))
>>                                                  continue;
>> -                                       igt_dynamic_f("pipe-%s-%s%s",
>> kmstest_pipe_name(pipes[i]),
>> +                                       igt_dynamic_f("%s-pipe-%s-
>> %s%s", get_psr_mode_str_for_output(&data),
>> +
>> kmstest_pipe_name(pipes[i]),
>>                                                       
>> igt_output_name(outputs[i]),
>>                                                       
>> coexist_feature_str(j)) {
>> -                                       data.pipe = pipes[i];
>> -                                       data.output = outputs[i];
>>                                          data.test_plane_id =
>> DRM_PLANE_TYPE_OVERLAY;
>>                                          data.coexist_feature = j;
>> +                                       igt_assert_f(get_sel_fetch_mo
>> de_for_output(&data),
>> +                                                               "Inva
>> lid psr mode\n");
>>                                          prepare(&data);
>>                                          run(&data);
>>                                          cleanup(&data);
>> @@ -1313,17 +1384,20 @@ igt_main
>>                          for (i = 0; i < n_pipes; i++) {
>>                                  if
>> (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
>>                                          continue;
>> +                               data.pipe = pipes[i];
>> +                               data.output = outputs[i];
>>   
>>                                  for (j = FEATURE_NONE; j <
>> FEATURE_COUNT; j++) {
>>                                          if (j != FEATURE_NONE &&
>> !(coexist_features[i] & j))
>>                                                  continue;
>> -                                       igt_dynamic_f("pipe-%s-%s%s",
>> kmstest_pipe_name(pipes[i]),
>> +                                       igt_dynamic_f("%s-pipe-%s-
>> %s%s", get_psr_mode_str_for_output(&data),
>> +
>> kmstest_pipe_name(pipes[i]),
>>                                                       
>> igt_output_name(outputs[i]),
>>                                                       
>> coexist_feature_str(j)) {
>> -                                               data.pipe = pipes[i];
>> -                                               data.output =
>> outputs[i];
>>                                                  data.test_plane_id =
>> DRM_PLANE_TYPE_OVERLAY;
>>                                                  data.coexist_feature
>> = j;
>> +                                               igt_assert_f(get_sel_
>> fetch_mode_for_output(&data),
>> +
>>      "Invalid psr mode\n");
>>                                                  prepare(&data);
>>                                                  run(&data);
>>                                                  cleanup(&data);
>> @@ -1340,17 +1414,20 @@ igt_main
>>                          for (i = 0; i < n_pipes; i++) {
>>                                  if
>> (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
>>                                          continue;
>> +                               data.pipe = pipes[i];
>> +                               data.output = outputs[i];
>>   
>>                                  for (j = FEATURE_NONE; j <
>> FEATURE_COUNT; j++) {
>>                                          if (j != FEATURE_NONE &&
>> !(coexist_features[i] & j))
>>                                                  continue;
>> -                                       igt_dynamic_f("pipe-%s-%s%s",
>> kmstest_pipe_name(pipes[i]),
>> +                                       igt_dynamic_f("%s-pipe-%s-
>> %s%s", get_psr_mode_str_for_output(&data),
>> +
>> kmstest_pipe_name(pipes[i]),
>>                                                       
>> igt_output_name(outputs[i]),
>>                                                       
>> coexist_feature_str(j)) {
>> -                                               data.pipe = pipes[i];
>> -                                               data.output =
>> outputs[i];
>>                                                  data.test_plane_id =
>> DRM_PLANE_TYPE_OVERLAY;
>>                                                  data.coexist_feature
>> = j;
>> +                                               igt_assert_f(get_sel_
>> fetch_mode_for_output(&data),
>> +
>>      "Invalid psr mode\n");
>>                                                  prepare(&data);
>>                                                  run(&data);
>>                                                  cleanup(&data);
>> @@ -1368,19 +1445,22 @@ igt_main
>>                          for (i = 0; i < n_pipes; i++) {
>>                                  if
>> (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
>>                                          continue;
>> +                               data.pipe = pipes[i];
>> +                               data.output = outputs[i];
>>   
>>                                  for (j = FEATURE_NONE; j <
>> FEATURE_COUNT; j++) {
>>                                          if (j != FEATURE_NONE &&
>> !(coexist_features[i] & j))
>>                                                  continue;
>> -                                       igt_dynamic_f("pipe-%s-%s%s",
>> kmstest_pipe_name(pipes[i]),
>> +                                       igt_dynamic_f("%s-pipe-%s-
>> %s%s", kmstest_pipe_name(pipes[i]),
>> +
>> get_psr_mode_str_for_output(&data),
>>                                                       
>> igt_output_name(outputs[i]),
>>                                                       
>> coexist_feature_str(j)) {
>> -                                               data.pipe = pipes[i];
>> -                                               data.output =
>> outputs[i];
>>                                                  for (k = 1; k <=
>> MAX_DAMAGE_AREAS; k++) {
>>                                                          data.damage_a
>> rea_count = k;
>>                                                          data.test_pla
>> ne_id = DRM_PLANE_TYPE_PRIMARY;
>>                                                          data.coexist_
>> feature = j;
>> +                                                       igt_assert_f(
>> get_sel_fetch_mode_for_output(&data),
>> +
>>              "Invalid psr mode\n");
>>                                                          prepare(&data
>> );
>>                                                          run(&data);
>>                                                          cleanup(&data
>> );
>> @@ -1401,15 +1481,16 @@ igt_main
>>                          for (i = 0; i < n_pipes; i++) {
>>                                  if
>> (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
>>                                          continue;
>> +                               data.pipe = pipes[i];
>> +                               data.output = outputs[i];
>>   
>>                                  for (j = FEATURE_NONE; j <
>> FEATURE_COUNT; j++) {
>>                                          if (j != FEATURE_NONE &&
>> !(coexist_features[i] & j))
>>                                                  continue;
>> -                                       igt_dynamic_f("pipe-%s-%s%s",
>> kmstest_pipe_name(pipes[i]),
>> +                                       igt_dynamic_f("%s-pipe-%s-
>> %s%s", get_psr_mode_str_for_output(&data),
>> +
>> kmstest_pipe_name(pipes[i]),
>>                                                       
>> igt_output_name(outputs[i]),
>>                                                       
>> coexist_feature_str(j)) {
>> -                                               data.pipe = pipes[i];
>> -                                               data.output =
>> outputs[i];
>>                                                  data.damage_area_coun
>> t = 1;
>>                                                  if (data.op_fbc_mode
>> == FBC_ENABLED)
>>                                                          data.primary_
>> format = DRM_FORMAT_XRGB8888;
>> @@ -1417,6 +1498,8 @@ igt_main
>>                                                          data.primary_
>> format = DRM_FORMAT_NV12;
>>                                                  data.test_plane_id =
>> DRM_PLANE_TYPE_OVERLAY;
>>                                                  data.coexist_feature
>> = j;
>> +                                               igt_assert_f(get_sel_
>> fetch_mode_for_output(&data),
>> +
>>      "Invalid psr mode\n");
>>                                                  prepare(&data);
>>                                                  run(&data);
>>                                                  cleanup(&data);
