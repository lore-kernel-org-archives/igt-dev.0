Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC3EC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 10:51:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2208310F9E6;
	Fri, 19 Apr 2024 10:51:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LL945HW2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E873410F5EE
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 10:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713523895; x=1745059895;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o6/cOAgTM/xpRJ+t8wgiTl67qGtTbILIzs7mFukwjxs=;
 b=LL945HW2o84eKkulhVqlPr1eGQyHATSRZdh3CbhbQBnbgR3cUxAWLdMb
 p4nyvxgCytTtqbawGOiBdr6ffEdesrojmIEdmu90gYTQVAxFltK+rJE1Z
 UBPouNFItNE/ml2MQ3W9u2XhzI1u5yMXHJA10kVmnYwZGcCHhjrYnTH94
 qUztZF3p6PFYnuBwqCjPf37AAP9tMPOL6UwE+U58gDTvio2UhOIG7WsiF
 TcEqRP/Z7JVPMb0SlLsQFrtmdAYlw3QBcUxCe3pCxpbJL/iceoINdtRBQ
 42cYFAoBrdWo95zowi7TsmaZCU0CrZhsYrAApewUbpkhk91H4tUyf6ZIK w==;
X-CSE-ConnectionGUID: eUjeDnj6Sgq8f8TsThYdBA==
X-CSE-MsgGUID: Cg80AXS1R8qQEzNOgBs26Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="34516123"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="34516123"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 03:51:34 -0700
X-CSE-ConnectionGUID: CBJ9plwrTXOTu0JgLevDJA==
X-CSE-MsgGUID: pNUhjPH1R7OHuKcPyoF22Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23281252"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 03:51:34 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 03:51:33 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 03:51:33 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 03:51:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V8YLwuaivCl+LZmUggs5l+Gt7NtOlgCyii4OPuKumY3aYSQVOApepJD+SerRZXeKbcreTS1ABeijTo5EkCmy6BcQUvqpYwgUYtNwpceXYjr4xr4btYwR+P/ry17hdq4926a4US9tDMUFUdJuBEjHK9b56fZuXFZ/qfPGq364x7gAF012wrfnpDcfdXTIC0gKMiRJBgMnN2OJCpZZXWKCciRNaBmJGyYXZaWRRlcUioUE38/4qXv6k8V4exukfK+ni7O5FUQ/FxAr2U33k/CZgeDKSYQVPl3payQCOnIDyZUELMoFG2NUIQVozAJHICUyADWI7no6lrNF5Kvugzn00w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2psQLX1i3jlgkoVE0noWjAtQwtJJGWXXuSfaoMp7ufg=;
 b=MAvmIKFbHcsWCZ6LPDxCCSfBi4qyZGSGFJGQMj7AFvlKmoAGQ5REql8IH3u3BP+RVB8wNFUV/wyDZz/+7VbUC2gD3ycv2C1ArxAa1IcQNbKx0vr/0J8H/u6FAcRfRA0r7ksXEIVf9XW/qnnSWgnL+vWO96U6dTcJJq07oj4rrrbg43Zgh/jfbJAti8S0laQfJeBO34aKf46Bwh5Z3EXk7r+ac4XBNe8rTY5GpVLKpI/VM0MNm3Cdxde1841dpL87k1ci94AI7QRnaTyud9ZpurWJR87NNzxIteCsyD5Mzby9DAXCHwj0NzZMDgdWoo2c3+0agwjDXTu6iKB5mDE7bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 SA2PR11MB4985.namprd11.prod.outlook.com (2603:10b6:806:111::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7519.12; Fri, 19 Apr 2024 10:51:23 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592%4]) with mapi id 15.20.7472.037; Fri, 19 Apr 2024
 10:51:23 +0000
Message-ID: <1e877c9b-1105-48ed-b2e4-9947405c60a7@intel.com>
Date: Fri, 19 Apr 2024 16:21:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/7] tests/intel/kms_big_joiner: add missing commit
 after reset
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Ankit
 Nautiyal" <ankit.k.nautiyal@intel.com>
References: <20240419064001.2401850-1-kunal1.joshi@intel.com>
 <20240419064001.2401850-4-kunal1.joshi@intel.com>
 <63cfd345-bcca-453a-b6b2-465307bc9308@intel.com>
 <0d0731fd-4034-42f9-afa3-1504542ab659@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <0d0731fd-4034-42f9-afa3-1504542ab659@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXP287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::26) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|SA2PR11MB4985:EE_
X-MS-Office365-Filtering-Correlation-Id: d147d045-15b2-490a-5bdc-08dc605ea732
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: 48eo4AvmdRVFeL6CtzzbMOLinsc/4OQiDfF7seyAh9DtuE/TaAb5OdnTUcIz3TbQhMyccrgDca1L4HzW0aXEyerzWCGWuTESg3OryaZrvZcKymxJY5OB5EmpFw1/8jzHH8MiqL39HQIzDofeoxhp9KXaznfBA9WA4F+3Gl1EyQaHNEebl9Pdg8boIWe9wyVW6vD/UhxYQ8bwcEuIAR0g/rjPMEDCV/AQ7ixQyumA9G9eye01ZRd8MSqpXJwAbuamJbLVY+6MKDKmfH4YpDwO7TYOsqY5KU0W1aGb9zfDVM2Sbyg5kXkXg8RlHdGDzl7fcaFY39ibQbWMzR2nFqTMIOFJDS0IuH9IqL8JpJFYH4f+85ACw9GjppTkk2H8m6t6vWyRy8gronDFCmZTQqZ9YYFS1kPwEUTwpAFKAw6Q++Imop6zH6FQtdw0eTzs06/YUVi/5ZWGZS4BHFAQRiLGWZG7vZ9nKm5QS311fFgOSEuvK8YN5lbgb8O+aVXFZmklS/ICseLLKgtIvEvOboW32ZRFI0g1iV0Htd5bmLoAkdiFyteVJAJ5Q3wDbWSL0XIvYlLU/rHH+4kmEZR4LpHTaHG9M+AYYe3foFcQbkLaunU34gz3VHpAh5kl1pHutmhOMXR0QeLcde8SJaIetGZMAkPrryOTyxtJmsEEUoGrkdM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjVmU2ZoK04wNlBxeDY0dnlXbVFXOVMwM20wNU5QSmdpU29BU2pQeXZrcC81?=
 =?utf-8?B?VEFwNmVkZU1GOWUrSTVjdkM2WnZCbVpBM1hkemhOMnJYZVN6eWs0dTVVdnNt?=
 =?utf-8?B?ZXhvSjhMT1F3WnpUWkp3SWZ4N083S3NrdUxBQlpkdDVHMnZhSU5DZURuaUI0?=
 =?utf-8?B?OXZ4M25xMzF0Qm9NRElDY0RjOVFPYTBQSmZsdStMT01NeE1hb2FKdnErNHlM?=
 =?utf-8?B?MEdjeDB5RXZvaklDQmMxQ0Z6NUtKTWMvUk10OFlUMHl5NzlTZXlNcFRFblhV?=
 =?utf-8?B?OFJtMWZkUGtIRkZrV0Y0enZrTVFteVVCYXVERHNqUUN4UE9HNzVWdmY2OEds?=
 =?utf-8?B?SUtxaXFiUU1LREFzc3JmSkdTZnhzdFphTE5OeC9DRFVUdHBFRFVBRFZCZ3pR?=
 =?utf-8?B?dStjYXUrWVBjMWFVcldSSjlvNU0rd3NQZ1E5RER2UVRhRDhXNXYxT3loZW1s?=
 =?utf-8?B?WkExYmlpRFByeGhNbGFta1BHOFBXclFMRmVGNVROSWRGblNmQ2k3aEFWSTJU?=
 =?utf-8?B?MWl0VlgrTUQ0emZDcVBEdGNmSnBlQ0JDS1hNZVJuN01iUlFUVDJGSUpYdkE2?=
 =?utf-8?B?VStzREU0RE1NQnQ2TGg1a1FoTGs0RnI5M2szdzJkdGdwQmFRZzE5eGFqeGhZ?=
 =?utf-8?B?YmxtRldqU1NyMHl6djR0NHdUNDRUNkNoNUpBOXMxZG9ack9tQmNvbjJVVW5s?=
 =?utf-8?B?a3pqdEVORzV4MURWYWgzcUtpSjdEenFSVlpyUkVQK0cvL1BhS0hxTS84d0U3?=
 =?utf-8?B?bWRuZ0hyeERsMXhmS2xWMGpYSnAxMTdKMzlZazIxSWUrcU83UW54d0NqY00r?=
 =?utf-8?B?NmFod0tXS1lBREg0WStyRzc2SWoremo3eU5CMmpDUHMrS0NPMUdnVEVaQURM?=
 =?utf-8?B?Qlc2ZHhzWitaazN1Z2pZTDJDWXNFK1VaMDVpMkhOZmFaRHZicFVWS0dRcC9u?=
 =?utf-8?B?bFIySWRSQk5BOXdBeWVHaWFzcmFXc0poNWZzY1V6c2NLb1VRempka21ZQWFu?=
 =?utf-8?B?U3BDaHJmQ09HSVVtMjlFUG1FOGwrU0hJQ24wdTR1T3Vsa00xWDhQd0JzSjh0?=
 =?utf-8?B?U091UTBFWEJUR1lMUUZGQlpOeHZ3ZUlTNEFHeW45WFZwc0V2MXZUa2g2eEs0?=
 =?utf-8?B?Q1IvWUZkVUFadmRUdlpxNGsrYzRTZFFVbUtUYWx5QXZLc2ZuMTlZZ2oyOXd3?=
 =?utf-8?B?dzBHcFhZRnh1VkpZTGFYQXV1aGdDdUgrM0labWVPM3hXRVp5Vkxna2c2ZW9J?=
 =?utf-8?B?dWM3eno4b3pHeTBDQ0lwQ1IwN1N6RkZlNlZycWxpMS9ubWorSDVDalM1SWtk?=
 =?utf-8?B?SFZoUnhJY3BScGxTUFUzRnRUMWpQQWRpV0ZyK3pVNzI3UVduSDQxQzNvRnpD?=
 =?utf-8?B?S09ubDFBTE5vaFM4WGV2eDY4U3MxS0Z3dnNLK3hhUDY2SFhVUzI1T0hKN2Ni?=
 =?utf-8?B?Z3dVWE4wNHB4bnZLa1g2aVdWV2FyN2YzdUlybmFqTEs2WGY0MVpPdlpWeDhT?=
 =?utf-8?B?akxTNGFlTEYwcFlUREYrY0N3QXFjQXRQRjloMnp6eTI5eFdJTXZvUUlKZEUy?=
 =?utf-8?B?NmlLc3ptZzU0dEo0NTVjNnBrQzhpVTMrSmU3aS93a1oyTFlEaGtIVExXb0Ro?=
 =?utf-8?B?N1lmQTZPUmVrNllkQUdRMHhYK0JVV3Z1aXhFazVTdmdpY1J5ekx1RVhoQlNU?=
 =?utf-8?B?T3kzTWs2c3ZtZFBnejFpazdkUlFoNVR5ZG8vUnlXbGdWT0F4eFBCaXhMZFJ5?=
 =?utf-8?B?TE9wSTJTejRFdkIrN1FKQiswejV2WTFhUmZFb0RycVNhZ3pkSWYxWTl2RnM0?=
 =?utf-8?B?YjZRNVRBSElNV2lhQ1JQZE4xeGdFRFRKSWMyT0NXQ21iaXowUXVCWFNrbmJx?=
 =?utf-8?B?c2VlUXBZWm40WkRraTFCemVOSFpRUFgxZjBaK0h0NXhDdDFJYk8yeXJqdUVP?=
 =?utf-8?B?c3lpKzZDNThReXk4M2FRd0lUbGo2MHBwZVl3MlorajQ0UkN4WUg5alN6aXQr?=
 =?utf-8?B?TFRhLzVlQ0pyYWZUMmR2TFlWYlo5MWJlbitIVUxnTUdCdlY3Z3k0VllyU090?=
 =?utf-8?B?YmRvZzdXOUxGUG10enpFbU04RngrWCtncEE0SUlVbXVacHhqeklLSVo0TWtZ?=
 =?utf-8?B?TTJHTlVLMWxCQ3ZlTlkyUlphRm9WWGhEM01QK2tHYnh6NU9vbU9rUWRoOGpD?=
 =?utf-8?B?SGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d147d045-15b2-490a-5bdc-08dc605ea732
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 10:51:23.2278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d3GO5RHfbcCTfigIBBIF0RWvmJglwezOxxnY4aYQDF6CbyjDQmVTYP14RzxL726yzQQjiKEhLQKKojsLSOe6LtP2b3wyiIsDnNDa0LHRsjM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4985
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


On 19-04-2024 03:39 pm, Joshi, Kunal1 wrote:
> 
> On 4/19/2024 3:23 PM, Modem, Bhanuprakash wrote:
>>
>> On 19-04-2024 12:09 pm, Kunal Joshi wrote:
>>> add missing commit after reset
>>>
>>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>>> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>>> ---
>>>   tests/intel/kms_big_joiner.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
>>> index 88923be6b..f325a9839 100644
>>> --- a/tests/intel/kms_big_joiner.c
>>> +++ b/tests/intel/kms_big_joiner.c
>>> @@ -267,6 +267,7 @@ static void test_joiner_on_last_pipe(data_t 
>>> *data, bool force_joiner)
>>>         for (i = 0; i < len; i++) {
>>>           igt_display_reset(&data->display);
>>> +        igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>
>> Do we really need this commit?
> 
> Hello Bhanu,
> 
> Yes we need this commit as below reason
> if output is already assigned to pipe D, then forcing big joiner is not 
> having any affect.

AFAIK, igt_display_reset() will clear associated pipe on all outputs. 
And we are associating last pipe (D) to the selected connector. The 
immediate commit will catch the bigjoiner constraint.

Still, I don't see any advantage of having this extra commit, am I 
missing anything?

- Bhanu

> 
> 
> Thanks and Regards
> Kunal Joshi
> 
>>
>>>           output = outputs[i];
>>>           igt_output_set_pipe(output, data->pipe_seq[data->n_pipes - 
>>> 1]);
>>>           mode = igt_output_get_mode(output);
