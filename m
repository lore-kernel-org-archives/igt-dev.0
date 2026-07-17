Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD4BC4450F
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 05:45:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA4D410F3E5;
	Fri, 17 Jul 2026 05:45:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OFUxfnGs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7624F10F3E5
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 05:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784267127; x=1815803127;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=aBLe64q4pHEyZR7AaXZfrPgBOWYxpKsuDjc6iJJloW4=;
 b=OFUxfnGsvhkw9K/iDyyE1opWqrPw8v3PKGGkIHqgUm68mcoXB4EqOpIl
 EjaUmlg1pZk+uMV4TF7brmnMX1fk/lBv8i/DMieCy05HFtxGUFlyJucOR
 xBDnf0Y9Nk/NH0FNlmpwWtGsf+TN6elkjvN/4smaMBycO2ju1h9IegSiO
 eTcWW/bH5CFy3a9+mnFtHKaC/dKHaRH3azXBI9yC8y4LbOLX/28EpSGhj
 YkkoPWIfmtE/o+/ZnDJxFlgV58ThM8nTGbJhdNazN9dMDQM1FvHZ4RJfM
 wJ9kiKp61yXShBNfej00Fx0KygxbCYg8fvnreykPM1Q1mGm8VCrZf8nSM w==;
X-CSE-ConnectionGUID: /4GKQ0TaTRWAACbTOvu7iA==
X-CSE-MsgGUID: Bd1rd3EuSiChcCHVha0F2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="88612351"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208,217";a="88612351"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 22:45:26 -0700
X-CSE-ConnectionGUID: zO6KXbnDQvmXHjCK9w7zSw==
X-CSE-MsgGUID: lPWI7e1GQjyk4/zthxHxoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
 d="scan'208,217";a="256150547"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 22:45:26 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 22:45:25 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 22:45:25 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.12) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 22:45:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=me4pKzjn7QTiBjdqkTFXPi0NLbcsdrr9lthwH5hU3+P1ijSb19yor+DVpQIpr0kc99FncMj8HYC/G5FYumFwDggCzPKAWTrtxEsCBW4s3wyEPmxNFJGYgBHNZgJ0x0iinSoazr8r9WpE3l9kw6IEFgAzL/0Af5pFOQbeEDgtgAlQLEBiL/DhEZ4S2tNVCXT0DzjuCFoQdbCorQ2dQITW0SIlccSOS1POCdeYpY4WGchTthFWfREEo4O25241P8wdOdgU0Jo/7GiznUGfGlmcl0PJ6IkslA6O+h7FPouvBxUAqUR4nANXb928NlCAsFnsndCP9c/701aXPmOjV+Uuww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z5TuvTggvz645+2Jw6Q8KV+53KaXCE81uC3qU3/X1lk=;
 b=HP8cf3Ua7DDYSn6vhOOogwGIX8nxYAGsI8TnWACZAtdQfrzXqvbxV3LYpq+xvu2oHFkj6rvrpt4t6VxoB2+r717tkpaS0zpHEK6aPO+uMzoU61pg5k2a6omniYqZUEsxCNjiMsCP6nfZu4EnwO4uDOYs+rac/MD4UxKuTIk1eSTJEtPAjvVWA6wOsOTvuUw3hUYiHczD5s1CKhHQxKA/szIN9/toO3gja7DPINUMVBwrjs6NeuVjtWZ7t4oHo6hjFa6hHJuDpWNbygUsUQEF84sukrwKDxaTmBMsuY51jnFps5EOCl3cSOmGDvJW/YGwW91aRhzFFwE7f9ToWKkc1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by SJ0PR11MB5213.namprd11.prod.outlook.com (2603:10b6:a03:2da::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 05:45:22 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 05:45:22 +0000
Content-Type: multipart/alternative;
 boundary="------------Fx02067dWxfun3wvUPg3ijKs"
Message-ID: <4efbc1ba-f37c-4410-9423-7280e2347416@intel.com>
Date: Fri, 17 Jul 2026 11:15:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] intel-ci: remove dc3co-vpb-simulation from NVL
 blocklist
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
References: <20260716184422.3255515-1-swati2.sharma@intel.com>
 <DM4PR11MB63127885A672C8E14ED6B5C290C62@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <DM4PR11MB63127885A672C8E14ED6B5C290C62@DM4PR11MB6312.namprd11.prod.outlook.com>
X-ClientProxiedBy: MA5P287CA0278.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::9) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|SJ0PR11MB5213:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ff42359-2b10-4235-0c03-08dee3c697ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|8096899003|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Ql6j2Fy27KUUkQZiJEKPzerbgnlNusqFnRe7cAkozG1N6/VuoabtVBJLbMSvMPAXXZiUi1ytongwX5dHsT5bWa8Xae3VfnTrwnKhVicKSJC2jrfLRUKdh3wHLelddcVdU47PXp61jeCuVmjIFCeJMIXACUZGL2uSoONamEFQ3+HjpwXajUJq7IInkMfFHNgZ/DhhbOCb6Hnn4zRGGf5tmw+L5M3wFlrb+CZCrjrpODSdq3xHdWnO84uB0GTEPtjSyFqX/sS0apV1blneMfZ+Z3e4Q9sCYwUyXZ0icO5/smBlxwuoGKDJxAN7KCldzXTjrRQAACeZkDR0GnXoQxzdJDOQhh6ODbTtuT9VksS31Pmhe3GKXoDcS1QicsMKoDXcDhdBpwFB70zJigb4Mo/2PXgwk2lpBFoUVzEmkBuSlmPhfVjwqaBDQCuh405IcGL7aKhwuXT5f5f6Cw4XTqasdhczX641devipEt0CMDiUgxw7e/5L9ECgsSeJS3WhkRVlGq0OhZp6eyX+5mC97Eqj1C3tHUq9Flj/o3t+cA5K5ldR/S8TcNfbVaHvZKSueRwnI9gdbnMCDxKF/xJ1i16D4oCFwuyWcQqT8A7m8LC8XSWIefOehwX/XbyGmkgpEH181nNm2T0KM8Oq1Sa/wcTQMKk+dJRSXfQHLb9xkAjxPg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(8096899003)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGJRRFFSUXR2NHFRSzZaVTVDeXBnME9vd1FnZ0xRdytnYWJJRjFPdlMrVGJu?=
 =?utf-8?B?ZlBJRlI4eDlVQ1BjemFpVktTSnBvK0NuaEZGY0Irekoxcnd5ZXhORUZzRmdl?=
 =?utf-8?B?SE0yaXE0Nkc1UURaNjBvbC9uNU1sSFhDZXNDM1RqRXlzUENlVTIwc3Z3ek9B?=
 =?utf-8?B?Mnp6VEdKWUlaME80OERkTnZMdnBFeWxzZEFUVGZ4dXlBZVNSSHp3eHZBRTJT?=
 =?utf-8?B?b0lhb1BHcGhxR0Rpb1UwaGkybnExR2paMlp4dWpBU3h4V094QkxmOUt2VTcz?=
 =?utf-8?B?eGRPUTl0VllQSVdEWm0xWXRCaVhKWXJGYWdWaGsvM0NiVXJRUTJNWlRuazNY?=
 =?utf-8?B?ZHh6T2d4MXRWRnh0SzN0M2RQMll2RURCRkhBWUR5UnBodmlQODdZK1FuWElz?=
 =?utf-8?B?a1JVd1c2ZUhzdnJuWWNveldvcXUzWlRXUWtqb3pKZys4dFZGZkdHY1crTnpi?=
 =?utf-8?B?R0pEa2J6NU5ZZmtVcjRESlZzMmN0VVdvNWhIU3ZIcGV0R2I5cEZZN0QwYXlE?=
 =?utf-8?B?RzBXS2Y4Ni9ZWnN0UjZaT2VpQ0J3WFA2Y0pMS0N1dTYzRzZqRG9rb2RFdzJV?=
 =?utf-8?B?WEZCUDBhRHJ5bmxBWlhNOUJYRXNLWUtIVkVpWnlMZlAwdzg3TlIvaDh1c3BC?=
 =?utf-8?B?R21Lblg3L05id1hIaWNxTlc4SHQ0Z1NzZ3ZXZ1pGVmtZRWJ2WkRjMEZZY0I3?=
 =?utf-8?B?MlNGdmR1U1crd0FoTlRZbzY3WFBsYXdaNFBqaFhvR0lHZHFGWENIZ042Y3Ux?=
 =?utf-8?B?bDFkamVTODdoWDZ3ZHpsRDlQUjFBeE81am1ZZHJSSk01azk2Zi9jaFlSTFpq?=
 =?utf-8?B?Yk1mRUhSWkh6T2k3N1R5MFdmYkdmb1N2U2RWQWRYN0xkaVdLMUxHdVVzUFJM?=
 =?utf-8?B?dUhCZkxzMnRGM0tPOWxhUEUwa1NDaDFZV3oza2pza29pdmNoNTFIeWhUT1hM?=
 =?utf-8?B?aysweDd0QkF0VXlqS2FKYUtYMVBDa2o5K0xyUmE5TDVaamxIWFpGS1VMWmRV?=
 =?utf-8?B?TG52ek81eDdMQ1NvbytTb1hpQmd5cldlQXZLZEZXL1o4bmJRUEl4QkpBYmdn?=
 =?utf-8?B?YlNlV1V4aTRBT1J5cU1IbnZQK0VnVkZoU2xPS0ZQTktxOEhiUSt2ekJDZndE?=
 =?utf-8?B?WmVEN0VVNytyVkZRUGwzUHduUnpYYklsSTJKSTZBUVh4Tm5zQmo1Q0g3dDAv?=
 =?utf-8?B?VHNib3pYQzM4aGFXQzJsd1hadFFFS0NYUU5GNHlhVFRlaEVIaGNwclJmT1RO?=
 =?utf-8?B?ck9TV2xsUGR0OHRUUnJMb1JWYktXOFc4b1M0NVdvbTFnWXo0VkYvVVlOblcz?=
 =?utf-8?B?UXJES09ONWFPOFVBWGd6VG8zbk93S0QrbXNxQ08rT2tNWmw5Yjk5cWF0YmdE?=
 =?utf-8?B?Q29vQmNHWjFrdHYzRU1rOE5wWVZoYnAxdExBTUlOWWhTZEVLOGxlUVBrN3R2?=
 =?utf-8?B?RkVzMlRxOTJmRE5YU1l6MW5BdzArUlpqUzV2elR4aVhVUGgzQTFTampocnpN?=
 =?utf-8?B?REo1T0wwQmhTMlpIeXZUSWlqZUFrM0lhZm1idUJNTndPWG52eVFmVUhwNExL?=
 =?utf-8?B?aXJNL3RXRkZBK3pIeStPU1hMcFJQMlRxTGxGK2JSZndER01MQ3pTY3VYYlpx?=
 =?utf-8?B?UFBQNC9pTkFIL0NHZ3BYUXVIT29rQm9tRjBNNW5udGZaKzAzUDlSNWlGc0Zr?=
 =?utf-8?B?ZU9HQkZzZnlRVGVmTExxZGhnM3VEVTJJTlQ1VzJ3eFBaNmg1MXkyNGwyNTl4?=
 =?utf-8?B?THRyN1dyYkt5VlBPRDRuNjg5N0s5WTdWcGMzVkJER3k4Mmd0ME5jaXJZeUpj?=
 =?utf-8?B?Z2ZCWXAzbkFod3RpVlo3V2JqdUwzeTdQMlRFRW5SUDBMTWYwdktieGdiNTRz?=
 =?utf-8?B?QzJwdzVoR1hDeVJBYWFUZ2VBTHlWWXc3OHRCdzBkWjBoMjRFL3VEbGVRUnR3?=
 =?utf-8?B?ZUF5a0hXTVE0TXh6NXllVzR3ZFRYZmp5WFptMWVha0c3MzNIMU9hc1BNb1Mx?=
 =?utf-8?B?aThscWxXTFBWWnZVR3JJVUpWM1gzaDFzbk9FSHJMNG5aT3BlZERlOElpekY1?=
 =?utf-8?B?N0RYZkFSTnVUSnprNWRneS9xelNha2E1cERFNHk3SW5RS3g0NlpjQ3Y1TXlP?=
 =?utf-8?B?czZxNUhIdXF6bTZHTVFrWnp5YjlLOHpCcXVGSnZyNW1jQnRGZVJIb3RjWEJj?=
 =?utf-8?B?MTRaakNXSnVYWUdRWmVPemdCd1NVNlJlYjFxNW16bjBGNk1pdmpFelpySHhL?=
 =?utf-8?B?SkF6MDR6VnY1ak5LZVdFZk5nS3BLU3BhRGhLVlJSRVE2ejlzQTJJQnJpVHVm?=
 =?utf-8?B?aHdzdU1TWENuZUhxa2VsekNvOVZ4aEJDdllBNVlJV1Z0dEJYKzExZz09?=
X-Exchange-RoutingPolicyChecked: dNneH9G1OEOuCHqVIAruCXZn5Tym6v2NNXEu0ZWACofztBaZiIxDWXD42Dy1NHK+6u0YCDGL2Q2PDCWkdMHgeELkLpe1QLWDXx8LLVrQm04YW+TvEqPNBeB1f08Ll9orEfkWM03zKerh5/wprHLEpFBUlmxEMVEskCN5fJ0srxQtb5sstFAxrtIi7Nx5N9tJuUcwZUIR2opfNQmFwlTN7R4l/BCt2IB/nKppbEbjRqFiUTwA00nCf77ARi4XDF52/M/fAkrjANOFZNhXB/Y80qa0PK1YyNUOncfnXHOB7EIe/lrRuP10QEWXpC9M73vOYzT/Q0MTNj66qnLOCGzEoA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ff42359-2b10-4235-0c03-08dee3c697ba
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 05:45:22.5476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w8p5OM/0PWNjsFWSdXfImiL9vzEbouBS2BlTLUNTxjgoiSlPFomdPP7Zqc1ut3LA6quj6DquIoJkYeld4WdS2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5213
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

--------------Fx02067dWxfun3wvUPg3ijKs
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jeevan

On 17-07-2026 08:58 am, B, Jeevan wrote:
>> -----Original Message-----
>> From: igt-dev<igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati
>> Sharma
>> Sent: Friday, July 17, 2026 12:14 AM
>> To:igt-dev@lists.freedesktop.org
>> Cc: Sharma, Swati2<swati2.sharma@intel.com>
>> Subject: [PATCH i-g-t] intel-ci: remove dc3co-vpb-simulation from NVL blocklist
> Update intel-ci to tests/intel-ci:
We typically commit using |intel-ci| only. Please check the git log for 
confirmation.
Also, will check with Kamil if this info can be made as part of README.

++Kamil
>
> With this PLTM.
>
>   Reviewed-by: Jeevan B<jeevan.b@intel.com>
>> Remove simulation-only kms_pm_dc subtest from the NVL display blocklist.
>>
>> Signed-off-by: Swati Sharma<swati2.sharma@intel.com>
>> ---
>>   tests/intel-ci/xe.nvl.display.blocklist.txt | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/tests/intel-ci/xe.nvl.display.blocklist.txt b/tests/intel-
>> ci/xe.nvl.display.blocklist.txt
>> index e6390d16b..d44c4030f 100644
>> --- a/tests/intel-ci/xe.nvl.display.blocklist.txt
>> +++ b/tests/intel-ci/xe.nvl.display.blocklist.txt
>> @@ -81,7 +81,6 @@igt@kms_plane_scaling@planes-.*upscale-.*downscale.*
>>
>> #################################################################
>> #############
>>   # Valid skip: Simulation specific
>>
>> #################################################################
>> #############
>> -igt@kms_pm_dc@dc3co-vpb-simulation
>>   igt@kms_simulation_hpd@sim-hpd
>>
>> #################################################################
>> #############
>>   # Valid skip: Mei interface not supported MTL+
>> --
>> 2.25.1
--------------Fx02067dWxfun3wvUPg3ijKs
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Jeevan</p>
    <div class="moz-cite-prefix">On 17-07-2026 08:58 am, B, Jeevan
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:DM4PR11MB63127885A672C8E14ED6B5C290C62@DM4PR11MB6312.namprd11.prod.outlook.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">-----Original Message-----
From: igt-dev <a class="moz-txt-link-rfc2396E" href="mailto:igt-dev-bounces@lists.freedesktop.org">&lt;igt-dev-bounces@lists.freedesktop.org&gt;</a> On Behalf Of Swati
Sharma
Sent: Friday, July 17, 2026 12:14 AM
To: <a class="moz-txt-link-abbreviated" href="mailto:igt-dev@lists.freedesktop.org">igt-dev@lists.freedesktop.org</a>
Cc: Sharma, Swati2 <a class="moz-txt-link-rfc2396E" href="mailto:swati2.sharma@intel.com">&lt;swati2.sharma@intel.com&gt;</a>
Subject: [PATCH i-g-t] intel-ci: remove dc3co-vpb-simulation from NVL blocklist
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Update intel-ci to tests/intel-ci: </pre>
    </blockquote>
    <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
    <div style="font-size: 14px; font-style: normal; font-weight: 400; line-height: 20px;"><font face="monospace">We typically commit using <code>intel-ci</code>
        only. Please check the git log for confirmation.</font></div>
    <div style="font-size: 14px; font-style: normal; font-weight: 400; line-height: 20px;"><font face="monospace">Also, will check with Kamil if this info can be
        made as part of README.</font></div>
    <div style="font-size: 14px; font-style: normal; font-weight: 400; line-height: 20px;"><font face="monospace"><br>
      </font></div>
    <div style="font-size: 14px; font-style: normal; font-weight: 400; line-height: 20px;"><font face="monospace">++Kamil</font></div>
    <blockquote type="cite" cite="mid:DM4PR11MB63127885A672C8E14ED6B5C290C62@DM4PR11MB6312.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">

With this PLTM. 

 Reviewed-by: Jeevan B <a class="moz-txt-link-rfc2396E" href="mailto:jeevan.b@intel.com">&lt;jeevan.b@intel.com&gt;</a>
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
Remove simulation-only kms_pm_dc subtest from the NVL display blocklist.

Signed-off-by: Swati Sharma <a class="moz-txt-link-rfc2396E" href="mailto:swati2.sharma@intel.com">&lt;swati2.sharma@intel.com&gt;</a>
---
 tests/intel-ci/xe.nvl.display.blocklist.txt | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/intel-ci/xe.nvl.display.blocklist.txt b/tests/intel-
ci/xe.nvl.display.blocklist.txt
index e6390d16b..d44c4030f 100644
--- a/tests/intel-ci/xe.nvl.display.blocklist.txt
+++ b/tests/intel-ci/xe.nvl.display.blocklist.txt
@@ -81,7 +81,6 @@ <a class="moz-txt-link-abbreviated" href="mailto:igt@kms_plane_scaling@planes-.*upscale-.*downscale.*">igt@kms_plane_scaling@planes-.*upscale-.*downscale.*</a>

#################################################################
#############
 # Valid skip: Simulation specific

#################################################################
#############
-igt@kms_pm_dc@dc3co-vpb-simulation
 igt@kms_simulation_hpd@sim-hpd

#################################################################
#############
 # Valid skip: Mei interface not supported MTL+
--
2.25.1
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------Fx02067dWxfun3wvUPg3ijKs--
