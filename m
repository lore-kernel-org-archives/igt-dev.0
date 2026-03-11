Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DF21125857
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 17:19:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50E110E0D4;
	Wed, 11 Mar 2026 17:19:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nrocgdem";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF6610E0D4
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 17:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773249571; x=1804785571;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/owbaEJgvuTRLW+Zix1muZbzavWPtxvEwdpEsfRC4us=;
 b=NrocgdemsgF5UyT+CvYCBt/mwbFi6qa9Cll0NYyZtVyuBTHlIMv+KHjY
 DX/42rxQoq6lw51GWGBvTArBot39yhm08DWJGZ6UMiMLRULYVVo7Ncao+
 tT2sHeli/k4elQez2z3R6JVS5Qn9qrx3y0WyaxioijP7J7P7ixUlm1ZnI
 FH7PaUgnxtWVVvHPgSLWU4OFjdk+ot8v9KoVY7OUcU6MTTgB7wlRVMfCA
 CknaLDvrgcYLKc/iOTjjukDR3p6mljssnD0EBtO8nyQNkA5qZLiXLPJ20
 CM8z0vpILOuSSGancJOuTInfHQ85LeIjq2ezBZaYaZpoWhL/b8PF88DSi w==;
X-CSE-ConnectionGUID: fbWJOJPKSaGp+55DvxQc/Q==
X-CSE-MsgGUID: WWsLF0gFQ4qGIAVZKvRYgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="76938856"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="76938856"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 10:19:30 -0700
X-CSE-ConnectionGUID: dAoGAPG3QDiRlIuz1zNCaA==
X-CSE-MsgGUID: OrD+vdcRTymiRikndcTN+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="220584631"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 10:19:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 10:19:29 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 10:19:29 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.0) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 10:19:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GvHAESDQe6qgt9Jrm3OVvxyaCvwWwjOK6Azd7rCuH/IlSViwHvIf3rjbP6PF0qBJvhrS0Spe5VXeJxYmR5jIUrcADAHxUKt7Y0ZphAFgv8F/eBnvalhue92Kf4PEYPRhSVpVGAwTgCWuPqjmxxnfqP8UhaSALkuzbvYON8ZZzx/+twk50cXBfhkJkVWRGQq9rtz3Pz0p7yVq+rwka9Hq7kMdiQqdoadp2/4HF6AfRZOncj5SjmKrNWOgUTDcokPAlec6H0iDgjZ33EbmIpjT6e3KPosjdT/0t3Z5/jj7PIB/Ea9MWsuukSD/cQL5JRgc9PRG5uzlAVpsHvw12lD7jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQD+vl19vxMXkq4IhMDz+QgOoTDyAVoU5EujCcIHbfk=;
 b=M/jhy/Jg28K9CryQeCHbZbnJicwy8ooWOSBxe/uVvfGc+XMYXz2Q4zlIbZRV29c45kfGU+VHJrKWLXLFtLSPAzcJdx1AU1Dx5h48cxDC183ornGHbeuD2C1KZVldnDtTbMMYkRg2dX95iHgO/pgiEkdWicKPPga+dWlyvKLFVLabI90e9U1JeryhAFeivJ5yUynt/puOa4W8T39EnlN65p0Xkb1+Qgvu2IkiWoaONpe7d/USZo31TiFf859bX3yWZ72Sm7T2hjAciYjSsgiVT5AEW5ZfryhDkmHUgX9CYWVpFPawDTQ77tc8jbxsF1acxwG1R1OLaDvm7xwaPpm40A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB4271.namprd11.prod.outlook.com (2603:10b6:208:188::20)
 by SA3PR11MB7581.namprd11.prod.outlook.com (2603:10b6:806:31b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 17:19:20 +0000
Received: from MN2PR11MB4271.namprd11.prod.outlook.com
 ([fe80::ad93:3c20:1286:59a2]) by MN2PR11MB4271.namprd11.prod.outlook.com
 ([fe80::ad93:3c20:1286:59a2%4]) with mapi id 15.20.9723.000; Wed, 11 Mar 2026
 17:19:20 +0000
Message-ID: <19f9cc71-574b-4c99-8972-46ac3d130605@intel.com>
Date: Wed, 11 Mar 2026 22:49:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/kms_async_flips: Use lowest mode for crc
 subtest
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260309082450.1897617-1-santhosh.reddy.guddati@intel.com>
 <2f87eb4b-8aa8-463f-9b45-36453b48d0df@intel.com>
 <b2583d17-b950-42d9-9aaf-6b74a841f35b@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <b2583d17-b950-42d9-9aaf-6b74a841f35b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0249.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::15) To MN2PR11MB4271.namprd11.prod.outlook.com
 (2603:10b6:208:188::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4271:EE_|SA3PR11MB7581:EE_
X-MS-Office365-Filtering-Correlation-Id: 26dc91be-e837-471a-5fc5-08de7f925545
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: A+7WCRwwRNJP5KSU6mqZRX5AsEke1uVvUTU6BAdrvr7+A59I7RWfEZVGSlbuklvOsxgRfAdita8hqZ1Fzpb3lqyYQ/7PF7rZIB3VcsvFD4V31gKrwo9qMLgNamWi81MscRO1tZcv2avnsVefCdD73yborQVoB3sbjr59zlXg/swpPDjaZScOsR9SeqpqzUNR0VxT7/ZMvCeI3yd3Y01iCLJzZJLbwHjYaDLX3uN7x5NC6q9IjtgeW9T+ydDL0uDsdRKNPArdNEd8Ls5mVPfXUX8R/3fj13ZdYOWh9spHy/t+MRhtWJnNquuOguXd8H8bwn92P7GIv6NQL8pwDGTvSCqpCwFw3TVGoLzR9IpqU9C/hI+3t7NME/y2op+Tb5APzXTpBIH+4eDIPqZYXb2lb7b62TQetxOo8zXf3xT8jLHF7QUrySuyzL/EKH6aFT4PsmkoRnMxMuryTJizlgtFD+f9v2u7jcfIHZsscUVaRK1HC+IJnZYcGD3U7nSEx4/22stgBCDD7NkdmwhXvGm8TX206/lBi3/l7jgr12DCrSzLqgj+zaA20ZpqdmJtqi2eHnJe+uKCR09ohu9uPGQ7YNIlv7D0cdjDYRpn69u96VpKOQV1OOTRwe8l1GCiZuPHNSuBK8dPlBoz5R2+VnxA2DkAcZDKQ2Ycx0eD4z+GP7h4c8fPc/yYo73k5c+ocILt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4271.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVUxVzhzOTZnRVZYU1llWERBeWcra0hpZzd4eGxjVWxucndmb2hJYmtyUFVk?=
 =?utf-8?B?dHFscDFQTm5PTDU2NHMybTAyM0k0ZnhLWldZeVV6cG5YNmlWTHprb3B4cTY2?=
 =?utf-8?B?TWlYQ3VOWFV2eXRTcms2WHhocmRzdGZpTXBaQjNrSmJVL1NaeUxrMklXZUI2?=
 =?utf-8?B?N3VBY2VjRHZKWWJTeS9FYVNSWHAwYks4T09KekpLelNzVXJmNEE3ZTNiQ0Ez?=
 =?utf-8?B?MWZGYTJaTk0vbFZxVnZDRHZaNVZ0OWp0NURTKzhGNGlwN1FIK285UVVVY0Ns?=
 =?utf-8?B?L1o4UVpGOGtQWmFDUFhvOFZIRlgrdUZKUnArWkRVVXZESk51MlFHb2lUQVU5?=
 =?utf-8?B?MVVmdHc0OGFyTkRYTUl1dnRZay8wWkNwcXc3RTI2SmdKbXA2aE5wR3VveXEw?=
 =?utf-8?B?T2EvWWVQRk5SdHdnVWZDeDZ5RUdvN0Z1WkNtZlpDc01ha2pXU3NVRHhsTm5W?=
 =?utf-8?B?UEJ3ZVliNDk1eXdjc0wvUWpid1hEaldFdEt2ZjJqN2xwR1ZVbnRRVi9SK2lJ?=
 =?utf-8?B?VERIY0cxMXdoSEkrR2I3bHZTOTh3eXpJcXNEUWUwUDRMNUQrZFFtM01Xdy91?=
 =?utf-8?B?TWVadUt4UEpwQXpMTVlHd1N6YkNxNDFvOXIrSm5RSVUzcGhwNEJzSWpkYU5M?=
 =?utf-8?B?a3hhVTBMMkRndlNoYjNWNWVuZHdGRGJYZHB6dkUvOG05RzM3UjNrL1Nac25v?=
 =?utf-8?B?U2tRcVhxWXFzN1JGNW1LSGlhNlhJTkVaamZuQjFPWmltK2lUekk1ZVdTQzJq?=
 =?utf-8?B?VGhBaDJITFNpUFBiSUJyMVY4U0VXbFQwMzJRYTJtNStQam9vd04xbk9JbWNF?=
 =?utf-8?B?MnFyZ1ZtZHRrN0xpNVN3ZmV5Y01xc1l6SkRWcCtabGVpMmJYc0FxZ1JUczdF?=
 =?utf-8?B?OUhTUWZDTlpjSGpRMXVmcWlxRS9jdjI2ZmZMbnhrLzB3ZGVzYi9YK3JlVUhn?=
 =?utf-8?B?azNiQ0NaSlc2Um5sWkxPeWJXeHZoVGd0NUFiTG4rc2VRbUZ2ZFFjQnZHNEpp?=
 =?utf-8?B?RVZOTjdYM2phTGZkV2dFVm9JMDhnQldKak1YMjFHaG5nUGRSL2dTR2V3SmZT?=
 =?utf-8?B?Z1dxd1ZQV1Zxb2NKc3F1ZVkvN3dXaU1jNUptRXh6RWtuMFUvT08yTUlhd1VN?=
 =?utf-8?B?WHVGOGFPZEU1UDhsQjYzQXVrR0RvdDdoSTd2REI4ZnU2eVNhUDlTSjdVb0Y4?=
 =?utf-8?B?Y2RoOU5nMmwzbGR1TmlKczU3aHhyeGY3UEZueGhucXVTV0N5dzFHQ1pYdy9z?=
 =?utf-8?B?VHd0ZjZRQXBRaURRb0w0RW42dVE2VVpKT0JLVlZBWFp4T1dteHRDTzZaKzM2?=
 =?utf-8?B?R3pwOWJxZ05jYWIvMFhXZUF0dUFsM0pxVDErTEwwM2RhRE5mei9jQ2RyQnV4?=
 =?utf-8?B?NnQvR3V4dTYwbmtaOHByb2ppdTFKSDlNZHZVUVJ1em9iSjRGejVLVkxwakVp?=
 =?utf-8?B?bVJGUDI5UzVqUHUrYTNyMWFRZEo3bzRVVGN6bThvUW1FUC9VZ3NsRXlIQ3or?=
 =?utf-8?B?NXQ1ZXF2T1I1d2VCSUpkNmlWdjBjNlphQlJxQ0lTS3AxcjJCSGFsbm82cG1N?=
 =?utf-8?B?ZGYzanAwZVN2VWszVTRvMlFZQ3MwNllaSjV4TWZtbXlrcm1CZjVtNk5RKzRC?=
 =?utf-8?B?c0poaHNTVUpEZjJWbnJyOTQzYXFwaWU0TFd2NFEzSEJIWjZ2N2tQbE14bWIz?=
 =?utf-8?B?OWNYbk13NXpYQ1RRMjArR09xSmhScjJyQjJ1Rk1HemxHYllaN2MvbUgxVmM4?=
 =?utf-8?B?SFVVVzhhaU9Sdzg0MTNlQnZKRVJvZjkvcDlKaTEvUFV2Uk8wTjRvL2dmV1Bp?=
 =?utf-8?B?am5vZEUycjY3OUppVEIwQ0tzSmxKY3k5YUlSU3BmMVI5WDZBZEtYY2REMUk3?=
 =?utf-8?B?cTVxSVQ5Nmo2akFpZEgwWE9wYVluV2JGaTM3eDNCdnQ2cVRyVXpaa2pGYjZN?=
 =?utf-8?B?M1pEYjNoSzR4YzhFTjNrNkJub1JnazdvWDU5SUprTG9hUXdNQ1pCUUFHNits?=
 =?utf-8?B?K2RyT2YvQW1jMk5mRnI0RkQrVkZPcUNPQ3lVbWtmOWxnMmZ1MFlGOTNEejY0?=
 =?utf-8?B?ckpXd2tFSUdnQXkvV05DT3ZnNkszTEV4RlRUVWdPZnQ0c1p0QmlBKzRzNlJ6?=
 =?utf-8?B?dExveXBaU0hhNnUvc01WL2t2VFFtN3NaODdhbHVMM0pkNHhMd3RrTlk0VWRL?=
 =?utf-8?B?UGxUdlU1ZXhnU3BUNStkQ2kxTTVyQzdZcVFGNnRZWjZ3ejF5SnBUVjVmR3Iw?=
 =?utf-8?B?Q2ZadmRCMDhvaGFHdFRUTnFPdTZqNnBlZTljMVJydnpHUFRyS2xlejJJa1Rx?=
 =?utf-8?B?OENPaSsrSjlodkxZUVVkYVF6RjJZdVZnd3F2YVIxL1htSUV4TkFPOW01U1lm?=
 =?utf-8?Q?SImvpCS26No/QH9k=3D?=
X-Exchange-RoutingPolicyChecked: hZSSUoDM/F3yy0C0Pcmn/3KA64LiQd5GdseeYAChUy0R75pzcWzNCk/yPL7nvEucUNIKCe+i6E5LlpmEIyPbxYiZG9ATuHWqqlVZqO+G+TZqTT64phMC37SKG8HiOmJc631mlG5ola3NYah/dtMSP8IZBpCcrQtAkNWtCtajER6kfbAHn8NZIId8o0IyeBZ7vuYsWNGLwy0t49H6PeToQrfgLUwiZnJJsGhIvd5r7MKx4/rM96G1MI+TNTBRzCOIP2Olw3EnjCxAPTSsXdJukn7a9Ep7UEU/2KArTESn2AFJ9kzvDF/aiTrkFAmTGFi5UR4ptkEhy3knld1yX7/jaA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 26dc91be-e837-471a-5fc5-08de7f925545
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4271.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 17:19:20.6969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Of+mBw3YBgfvqZomnLB6817AInxHOKXy5qlgW4SygNE1fubCkxruLsDU5auvpTVkC43RhXzd5++8wbNBR5rdbj92qmYgskBHhZnOoQYJ0Q8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7581
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

Hi Santhosh,

Thanks for the clarification.

On 3/11/2026 11:19 AM, Reddy Guddati, Santhosh wrote:
> Hi Rama,
>
> On 10-03-2026 20:37, Naladala, Ramanaidu wrote:
>> Hi Santhosh,
>>
>> On 3/9/2026 1:54 PM, Santhosh Reddy Guddati wrote:
>>> Currently The CRC subtest uses mode[0] which maps to preffered high
>>> refresh mode. On panels with multiple modes, pick the lower mode to
>>> speed up crc test.
>>>
>>> Signed-off-by: Santhosh Reddy Guddati 
>>> <santhosh.reddy.guddati@intel.com>
>>> ---
>>>   tests/kms_async_flips.c | 15 +++++++++++++--
>>>   1 file changed, 13 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
>>> index a42407363..8639e2299 100644
>>> --- a/tests/kms_async_flips.c
>>> +++ b/tests/kms_async_flips.c
>>> @@ -825,6 +825,17 @@ static void paint_fb(data_t *data, struct 
>>> igt_fb *fb,
>>>       }
>>>   }
>>> +static drmModeModeInfoPtr get_lower_mode_for_crc(igt_output_t *output)
>>> +{
>>> +    drmModeConnector *connector = output->config.connector;
>>> +
>>> +    igt_assert(connector->count_modes > 0);
Instead of simple assert, change to the igt_require_f with right message.
>>> +
>>> +    igt_sort_connector_modes(connector, sort_drm_modes_by_clk_asc);
>>> +
>>> +    return &connector->modes[0];
>>> +}
Imho, Rename the function name and move it into lib/igt_kms.c for future 
use.
>>> +
>>>   static void test_crc(data_t *data)
>>>   {
>>>       unsigned int frame = 0;
>>> @@ -834,8 +845,8 @@ static void test_crc(data_t *data)
>>>       igt_display_commit2(&data->display, data->display.is_atomic ? 
>>> COMMIT_ATOMIC : COMMIT_LEGACY);
>>> -    /* make things faster by using a smallish mode */
>>> -    mode = &data->output->config.connector->modes[0];
>>> +    /* make things faster by using a lower bandwidth mode */
>>> +    mode = get_lower_mode_for_crc(data->output);
>>
>> This optimization is for simulation? if yes, Add a check for 
>> simulation then change to lower mode. On Hardware it won't take much 
>> time. Why this time optimization required on hardware?
>>
>> is any issues seen?
>
> Thanks for the comment.
>
> This change is not for simulation.
>
> The purpose is to fix CRC subtest mode selection on panels with 
> multiple modes (especially when there are HRR modes). Earlier we used 
> `connector->modes[0]`, which can pick a high-refresh/high-bandwidth 
> mode (if modes[0] has highest) and make this test path more sensitive.
>
> Now we select a lower-bandwidth mode using `get_lower_mode_for_crc()`. 
> The async flip + CRC validation logic is unchanged. So this is a 
> focused fix to make the test stable on HRR panels, not a new behavior 
> change.
>
> In past , we have seen issues related to this and the test was handled 
> to adjust the criteria.
>
> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8247
>>
>>>       width = mode->hdisplay;
>>>       height = mode->vdisplay;
>
