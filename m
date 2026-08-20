Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33291C5DF82
	for <igt-dev@archiver.kernel.org>; Thu, 20 Aug 2026 11:09:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C6C10EFF4;
	Thu, 20 Aug 2026 11:09:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ae8TliFd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C9210EFF3
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Aug 2026 11:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787224139; x=1818760139;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KU3z42kutsvb30Z7C8OJ6uoKHiLmnP1dQh+9nYBAQhc=;
 b=ae8TliFdbqEUSCGqzPJKpSCX8oiDNhxPwUchCSZZ/fScWO2XuUjWwLeM
 gikvQMhzl7FwQ48yWL10VPzeZBngX0mNC9xJtJoYg4PXcgLr3YfZePVbS
 8DblZDIF3l+O/A6pzpNaOyPDPDiHrvKTAp7j2UBdM+wns+WmrQzAw2wcH
 9lAYf0o0rsVwNF8slZQpwbDzZ7+CWlsb3rtdD9FFn1ZTdoRXStebM1U/d
 z7BdSGLXoh/ovCpAgk/UR9txCZT9lnccO03taKTBRcS/9pyTCht1KuGmC
 9lfMuZ4yDUo2HdRecjLoauLXX3K5bWq9vrUWFojahIhMgDttrdikWuc5x w==;
X-CSE-ConnectionGUID: uTJQqnV6R3GFWvQg5FbPpA==
X-CSE-MsgGUID: TpMDB9SzQd+ilMoidXENCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87961659"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="87961659"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 04:08:58 -0700
X-CSE-ConnectionGUID: //a6tOGGSgimLKLN/cWnQw==
X-CSE-MsgGUID: miE9OQHQQrGY3ShqIPv4fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="266577439"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 04:08:58 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 04:08:51 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 20 Aug 2026 04:08:51 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.2) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 04:08:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G0GjUdrqEi1TlJ5y71U8lBqZaZCws1DFr1EwfQTPCM6VZNDkBFsQHn2vO/MeR66bsbxX23ElMl3TLQooSe+oI5fwA5zX+2Fh7MpeGlg8/iyYBewDPXHULIvoOtUpl19Dxj6fZ7yIXvvWMMqNlqcqOgOH46dnLOgjSiRZ6lbWDHmzjs8n4xUPlLeoMIaoEe32I49mQfXpSLvtn1q6gWTAqYkSjNSSSMSi6cEaJj0y57OPEIprw1QpeC5P9G0VGi7MZMGpsNR4bQb1wvRoxp6n0Bfy2KrtzvA/zK6SbTWGgSDbFfsw1CD4z2Ami5KUYGS8Bw1q5g3SY7I1Vde5dJlSOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDVQaHoY01n3YhJ4aSd9Hj7CO/pUNQo7yJu2LInN+cc=;
 b=KlICAL3jLZrloQ+8qFFguHLnLkC4TOhUj+E+KlhV8cMm0YlA4NagKb8+emGJpBhZnZXcpuGeu+Mq+DHagoheI387YRT6/pPXeOEeeAPgyuNdgeIrWqy6vxN398rZ/U24jDRzu39nTqMNIQwLnC6WfvAO8dsMbQsK9AhMhbvsz2dPHE2RPX6JGcRblyfLcJNhzUU+azNXzKHI+2BhPDyIoSMyNtTGTQ/0Tk/TEgIPozeDJXH1ZxdOHZD/b5R68lYE9sNrwJbnYXmokHfh1JDMYZw8py9hKOZY1LVESvwOpVG9EtA3YMmWRb+jFc90mztotxP7fdC2/4PpI7VcmRYxtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by IA1PR11MB8248.namprd11.prod.outlook.com (2603:10b6:208:447::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Thu, 20 Aug
 2026 11:08:48 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0339.008; Thu, 20 Aug 2026
 11:08:48 +0000
Message-ID: <e2cfce0f-dec0-4962-a8ce-9524b25da3c2@intel.com>
Date: Thu, 20 Aug 2026 16:38:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 1/2] lib/igt_vrr:Add VRR helper library for
 display refresh rate testing
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <mitulkumar.ajitkumar.golani@intel.com>
References: <20260812130738.1242659-1-ramanaidu.naladala@intel.com>
 <20260812130738.1242659-2-ramanaidu.naladala@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260812130738.1242659-2-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0210.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::16) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|IA1PR11MB8248:EE_
X-MS-Office365-Filtering-Correlation-Id: c0bc2ca0-0f86-4044-041e-08defeab68a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|18002099003|22082099003|11063799006|4143699003|56012099006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: Drq58gwy61XZampgEprZ66izDXI6S8uK3oV/4xFrYwxN50KWMhPl78u4D94aiKdwRkya5XD6XWdawJNm4yX6QwXokjDRkRR+2CAiY8qAyzjD3jEq2B8DFGMILZIZrVl1uhYbCM8UsdjeH+ek15nUR2poGmoqlq0ES1emFind0QzBdMegMrKFkrgXbFCYx+erBku1KbvKens6KvA4aPLaT7UwiR/L2zRz1CFXDaxkE1FfzqlkNqMvk4Iz8KsQaN2SOY8kK12enQS2M0WnxH7A5oxWzKHZXkTtsWoKya+zJkeq8bOQwFKPEQO2P8U5Cu4+x42kYuDYI3Dd4ry3NVKl3hu6Ndd/KWXINtdbNYM+QgfEay74WR1s1DTjuF47N2YCzzi0+l6mOqxa6Es/z+gad9lo/Wg90oPOW8shCK2OyQC4e1h43RGNi8AAmNZYWLdmem1RKyem8vBbi6fj6MRvrJpaziTnuEDyLXjWkcgkOQX/jyIhH2PybypRTKS+JVROFq1cZvRqKs7hdeXalzklrWuRfZOUTCaeuHQ8GgKpjuaXPyM0FYR1y+yj7FMNrsu6YoCvDRzNyGIRlnUJBRFkL0C40BQzDhxdplMPi+PAXEmr7JUFUgiZpcsfeetB+rg0ycNlzc0WD+33yzZK0i6JPAYjpd/XvRDGrRKG1PqpnZc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(10067099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0pSZXRBZDFjOU9zTjhvbG1ZbmNtQ2hDZEJ5bGErcmJDcDNrK00rNVJCMFIv?=
 =?utf-8?B?S3JMMXJPdHVYQ1VwQnRQZURvU1NVWEc0YXRQRXdhL1Vhc0MzNEY4OXFPaW9w?=
 =?utf-8?B?TU5KVlBZMTVFRFk0VHA2cmRQMm5IdUZQb0llVzc5MW91U0ZsY2Y3NEdITUlC?=
 =?utf-8?B?czJEdlZqUXBZUWZHcFkzcGk1SlhFVEoybjNIZDhXVnl5eWlEZHRtUVdzSXdM?=
 =?utf-8?B?UWhKV1hnbWVMdmpLNHNFT0RIbGFRSmRNRG5CLzczeVUrMlo3NVNPdnRtTEk5?=
 =?utf-8?B?OFhqL09EeFVaamYrbjdZZ2lTNGZDdkxxbWlWS0s1NGZsK0hPVStheGJNczU0?=
 =?utf-8?B?RnpMTjF6RTFQN2tCZldLTGlVNk04TnlZa21Mckp3MkZNekg1TUlCeXJCdXFG?=
 =?utf-8?B?aHdKQS91YStESmRPdXNPaFNaUEx4bzM3OGVEOW9pMkFjWTFEOG5tOHlmVURa?=
 =?utf-8?B?MFpyTDYvYnIzcnJ6VEhLTVo4QU9rdHRKTHJwbmdla3FoMlBabHZieTJuK0pn?=
 =?utf-8?B?akpoVVRSamk3NExML0xPSlk1YVFKd002UlRTV2tZTFBEeTIxN20rVzk4Z2FK?=
 =?utf-8?B?RWgvQjNsMUJJV2ROdmVnUmYzMlZYOE9YOWRRVlFoU0M4YVNhV0dQMWdtTGZu?=
 =?utf-8?B?bEs1QXpUM25Pb1pNdmVONUQybE83WUltdjdzYmVMUnBBdDB0UlYrOFV4OVdm?=
 =?utf-8?B?d2YrWkxVLytwUmVzQnRGWU1pTzAyb2o4UVZiRmhZUlBvNC9lWjh4dkxEdzFu?=
 =?utf-8?B?SmJ4bzg4UVpQTnljZ2lwbTFLRk1wOExwR1hyRXlXQzdzTHYyMDVVdmd6akEx?=
 =?utf-8?B?UUdBbjJvMThMcG43ZnhGcXNET3ZOWEhlWHBQWGx4b0g0ZW9tMzlWMDE0TDdu?=
 =?utf-8?B?ZjRaaS9DWXk5Ym9XQlJCOFpzb3hIYzNTenpka0dQeHAycG1VY1hqd0RPVEsr?=
 =?utf-8?B?Ykl5aWdwa0FKZHdDOGhVczg3NzZRZkpwd1F6YVpvdEVKWGc0c3diQ1FNTXdx?=
 =?utf-8?B?OTJCL2hmSXhSeVpoZzRJYlRkOXFpdVRXNkpGZnpxM1dXSXRpMTJXdGs2ZUdM?=
 =?utf-8?B?SlBVVDBMcVVzQmJwcm5LQTRrWUt5cE9OM29KMS9nc3VxTVNMM0tsa0k2TXll?=
 =?utf-8?B?ZWJqc2tCQVpxVFdZdHRwTU92UnlOaVBaZnArSS9Yb21ES002UzRaZG1LODV6?=
 =?utf-8?B?Zk1pNExKd3VOa1FocUMxdFIrWnc4dkVjUThyTGVUc3N0OGdpeEZ3ZzVwTW1u?=
 =?utf-8?B?aWtncS9COEdqV1RYOVdndXk2WmxveWlxWER5ZGU0T3RLS2xxVkR2OEVlTkhq?=
 =?utf-8?B?QTJ0NzQ4alArWmI0ZFl5WkJiMGFxbk15d3k5dVg3MStjeFllekNNS1d2UjdJ?=
 =?utf-8?B?T2FKajBvWnNxdTBnU3lSZ0hLNEw0czB4ajNpU1h6OFNMMGJoU2dNY2lwYllY?=
 =?utf-8?B?R3hwZkxlUFUvNGY3Ui9hMXZWN0MrYlVCbkVMYlFLYUU0SzBoV3ZKNkNkNWd3?=
 =?utf-8?B?NEhtaS9QbmZaVUFGVU90SUZrejg4c1VESGNWWDl0WE5pRXZUQ0RuZm1DZmFU?=
 =?utf-8?B?Z3FnVzhZeU9LU1hZbGdvNXdENndBbmgxdHNQN2I3ekJKc2dFcEx1cG83ekJS?=
 =?utf-8?B?bEcyRDZJUzZWTEtNaDg0U09LelA1cnZPVDZBT3hKaTBZQ1RjSnJnbENiaW5X?=
 =?utf-8?B?dmViZy9tNlpOTjcwZ3NCc1FMYkJSUWpYcUl1WUwyVVhKZ0JuN0pOK2ZUOUtW?=
 =?utf-8?B?eWVHWTRUblpGN2l0Z20xekVxNjhhRndMTk55cUt2WUxqaFBDODdtZmpVR0tx?=
 =?utf-8?B?ZVZydE85QnZWYk9Nbkg0K1QrcUxENS9uZ1JaeGlVMjEwckRwN3o5a1FiNWVM?=
 =?utf-8?B?WS9IR3hHYlAvYlA3aDhXZkdYeEt4aGRIeCtUdDZFZkg3eUVQZmRzbWs4TUlh?=
 =?utf-8?B?bFpkdW1XU2ZUT0pCUzF2NHpLaUo4K3F0SG13ejJJdTBLbmx5cFF6RmEySXFs?=
 =?utf-8?B?VVhocjhOU2o3MVFueWp4UDczMWpOYXkwUUFnTHZKNUZyUkQ1ckVBY2V5Zkpl?=
 =?utf-8?B?WFpqREZtdCtpdlRiMWJ6V0xXS1puNTRIY3R4ZnBKOVQreFRvY2g2WWwvRXNN?=
 =?utf-8?B?T3hXbHd0MzkrbThQams4UEh2alNzaXJxMHlUYjhUWU5QUEtpV3I4SVpZNXhY?=
 =?utf-8?B?NmdyakJnbU1RY3hjMDdVeS9YcUd4a0JGaFBkRHNjL0FucVN0SjFNZ2JFaStK?=
 =?utf-8?B?SVdFUEQxOUlJRGQ2MmVMUVFXY1dTMERYaTNxbmFZb21xWE5mSU5XdVFQNFYz?=
 =?utf-8?B?NjBxYURoQ1lmdHJtbXVrc1JVS3NOZHMrekN0MVRoQU1HcHlhMDkzNzlYcHBZ?=
 =?utf-8?Q?VcZpGq/DvRjcAvtk=3D?=
X-Exchange-RoutingPolicyChecked: YJU8DGdRs7Eq0j817deTduykf0abfmmbhpaKV/7yCOlNZnaeaci6uK9n9dF0rdVMCe3brSjS7NLqesEWyG7sSBL0khDXFGcD0pR3+47Gi1ApKAPqN6BKnWhRvpRZ2O+yZEzk41615cMptY0cansUeZUq5J1gOnPUjuztvamv5npbWDQlifV0TfijN2qqVqvaVc7BF3vdS2kuAEnZkHMCrLXLlSs2B0bFLw5ecAcGI8SbMc7QeZhfH+xwRgT7/ivie/HbV+LC+HEIvSwjBQwetREsXolMUTXGSj3KjU+OEZSDqZpWS5f8EU8NMyTDizwQowxxJsqp797RPomfSYItpA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c0bc2ca0-0f86-4044-041e-08defeab68a6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 11:08:48.5071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FGifBQKbhGgiiPP7et7A0I621ewFBBPbfS88sc2/sngwnW83qo5T9tdhk7yZbg7XUy/2BIGrgVipbCzm8nMZOJQWCu5ZtMpNm9OMH8xmqTk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8248
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


Hello Rama,

On 8/12/2026 6:37 PM, Naladala Ramanaidu wrote:
> Introduce a new helper library for Variable Refresh Rate (VRR).
> 
> Add helpers to validate targeted refresh-rate testing.
> 
> v2: Modify debugfs with helpers.
> v3: Add helper to check cmrr support.
>      Address review comments. (Mitul)
> 
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   lib/igt_vrr.c   | 154 ++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_vrr.h   |  44 ++++++++++++++
>   lib/meson.build |   1 +
>   3 files changed, 199 insertions(+)
>   create mode 100644 lib/igt_vrr.c
>   create mode 100644 lib/igt_vrr.h
> 
> diff --git a/lib/igt_vrr.c b/lib/igt_vrr.c
> new file mode 100644
> index 000000000..704eaa3a3
> --- /dev/null
> +++ b/lib/igt_vrr.c
> @@ -0,0 +1,154 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <inttypes.h>
> +
> +#include "igt_vrr.h"
> +#include "igt_sysfs.h"
> +
> +const uint32_t igt_vrr_standard_video_timing_fps[] = {
> +	24, 25, 30, 48, 50, 60, 75, 90, 96, 100, 120, 144, 165, 180, 200, 240,
> +};
> +

Please cite the source/rationale for these RRs

> +const size_t igt_vrr_standard_video_timing_fps_count =
> +	ARRAY_SIZE(igt_vrr_standard_video_timing_fps);
> +
> +/**
> + * igt_target_rr_debugfs_write:
> + * @fd: DRM file descriptor.
> + * @crtc_index: Index of the CRTC.
> + * @vrefresh: Target refresh rate to program.
> + * @numerator: Numerator component of the target refresh rate fraction.
> + * @denominator: Denominator component of the target refresh rate fraction.
> + *
> + * Write the target refresh rate configuration to the per-CRTC
> + * VRR debugfs interface.
> + *
> + * Returns: None.
> + */
> +void
> +igt_target_rr_debugfs_write(int fd, int crtc_index,
> +			    uint32_t vrefresh,
> +			    uint32_t numerator,
> +			    uint32_t denominator)

You can simplify the arguments to rr_numerator and rr_denominator. Skip 
vrefresh.

> +{
> +	char buf[32];
> +	int ret, dir;
> +	uint64_t val;
> +
> +	val = vrefresh * numerator;
> +
> +	snprintf(buf, sizeof(buf), "%" PRIu64 "/%u",
> +		 val, denominator);
> +
> +	dir = igt_debugfs_crtc_dir(fd, crtc_index);
> +	igt_require_fd(dir);
> +
> +	ret = igt_sysfs_write(dir, "intel_vrr_target_refresh_rate",
> +			      buf, sizeof(buf) - 1);

Better to use strlen so that we don't send out any garbage to kernel.

Also what is the policy regarding using intel specific debugfs in lib?
Should there be a wrapper to abstract it?

> +	 close(dir);
> +	 igt_assert_f(ret == (sizeof(buf) - 1), "debugfs_write failed");
> +}
> +
> +/**
> + * igt_cmrr_debugfs_read:

needs update.

> + * @fd: DRM file descriptor.
> + * @crtc_index: Index of the CRTC.
> + *
> + * Read the configured refresh rate from the per-CRTC VRR debugfs node.
> + *
> + * Return: None.
> + */
> +void
> +igt_target_rr_debugfs_read(int fd, int crtc_index)
> +{
> +	char buf[32];
> +	int ret, dir;
> +
> +	dir = igt_debugfs_crtc_dir(fd, crtc_index);
> +	igt_require_fd(dir);
> +
> +	ret = igt_sysfs_read(dir, "intel_vrr_target_refresh_rate",
> +			     buf,  sizeof(buf) - 1);
> +	close(dir);
> +	igt_assert_f(ret >= 0,
> +		     "Failed to read intel_vrr_target_refresh_rate.\n");
> +
> +	buf[ret] = '\0';
> +
> +	igt_info("vrr target RR: %s\n", buf);
> +}
> +
> +/**
> + * igt_vrr_mode_line_refresh_hz:
> + * @mode: DRM display mode used for the calculation
> + *
> + * Compute the refresh rate directly from the mode timing parameters.
> + *
> + * Returns: Refresh rate in Hz as a floating-point value.
> + */
> +double igt_vrr_mode_line_refresh_hz(const drmModeModeInfo *mode)
> +{
> +	return (double)mode->clock * 1000.0 / ((double)mode->htotal * (double)mode->vtotal);
> +}
> +
> +/**
> + * igt_vrr_get_mode_with_video_timing:
> + * @output: Display output containing connector mode list
> + * @fps: Requested integer refresh rate in Hz
> + * @matched_mode: Returned mode that matches @fps
> + *
> + * Find and return a connector mode that matches the requested
> + * video timing refresh rate in Hz.
> + *
> + * Returns: true when a mode is found, false otherwise
> + */
> +
> +bool igt_vrr_get_mode_with_video_timing(igt_output_t *output,
> +					uint32_t fps,
> +					drmModeModeInfo *matched_mode)

This helper seems to be only relevant to CMRR for now. So better to move 
it to the test file? Do you see it being used elsewhere?

> +{
> +	drmModeConnectorPtr connector;
> +
> +	connector = output->config.connector;
> +	if (!connector)
> +		return false;
> +
> +	for (int i = 0; i < connector->count_modes; i++) {
> +		if (connector->modes[i].vrefresh == fps) {
> +			*matched_mode = connector->modes[i];
> +			return true;
> +		}
> +	}
> +	return false;
> +}
> +
> +/**
> + * cmrr_supported:
> + * @fd: DRM device file descriptor.
> + * @crtc_index: Index of the CRTC.
> + *
> + * Checks whether the intel_vrr_target_refresh_rate debugfs node is present
> + * for the specified CRTC, indicating CMRR support.
> + *
> + * Returns: true if CMRR is supported, false otherwise.
> + */
> +bool cmrr_supported(int fd, int crtc_index)

You can rename it to target_refresh_rate_supported.

> +{
> +	int dir;
> +
> +	dir = igt_debugfs_crtc_dir(fd, crtc_index);
> +
> +	if (dir < 0)
> +		return false;
> +
> +	if (faccessat(dir, "intel_vrr_target_refresh_rate", F_OK, 0) == 0) {
> +		close(dir);
> +		return true;
> +	}
> +
> +	close(dir);
> +	return false;
> +}
> diff --git a/lib/igt_vrr.h b/lib/igt_vrr.h
> new file mode 100644
> index 000000000..a317d4684
> --- /dev/null
> +++ b/lib/igt_vrr.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef IGT_VRR_H
> +#define IGT_VRR_H
> +
> +#include <stdbool.h>
> +#include <stdint.h>
> +#include "igt.h"
> +#include "igt_kms.h"
> +
> +#define CMRR_NUMERATOR 1000ULL
> +#define CMRR_DENOMINATOR 1000ULL
> +#define CMRR_VIDEO_MODE_DENOMINATOR 1001ULL
> +#define TARGET_RR_SAMP_COUNT 100
> +
> +enum {
> +	CMRR_VIDEO_MODE,
> +	CMRR_NON_VIDEO_MODE,
> +	CMRR_DISABLE,
> +};
> +

move these macros and enums out to the test file.

==
Chaitanya

> +extern const uint32_t igt_vrr_standard_video_timing_fps[];
> +extern const size_t igt_vrr_standard_video_timing_fps_count;
> +
> +void
> +igt_target_rr_debugfs_write(int fd, int crtc_index,
> +			    uint32_t vrefresh,
> +			    uint32_t numerator,
> +			    uint32_t denominator);
> +void
> +igt_target_rr_debugfs_read(int fd, int crtc_index);
> +
> +double igt_vrr_mode_line_refresh_hz(const drmModeModeInfo *mode);
> +
> +bool igt_vrr_get_mode_with_video_timing(igt_output_t *output,
> +					uint32_t fps,
> +					drmModeModeInfo *matched_mode);
> +
> +bool cmrr_supported(int fd, int crtc_index);
> +
> +#endif
> diff --git a/lib/meson.build b/lib/meson.build
> index 3001b473e..8675bd4a6 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -22,6 +22,7 @@ lib_sources = [
>   	'igt_configfs.c',
>   	'igt_facts.c',
>   	'igt_crc.c',
> +        'igt_vrr.c',
>   	'igt_debugfs.c',
>   	'igt_device.c',
>   	'igt_device_scan.c',

