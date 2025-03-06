Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCDEC28B24
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 15:50:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE5C10E9DA;
	Thu,  6 Mar 2025 15:50:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y8eX56W4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 314C510E9E6
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 15:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741276209; x=1772812209;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=HSCfMkgu/fGmRRTZn/Om7na+icOPWXeWfy78J8XGT74=;
 b=Y8eX56W4RL9+f9t2AaluUMe+0AuPXlZudYIN6hCCQdCbwqcDZJBPKIif
 eJ6SHR21I64PuQCFe1lbxdCGKd5T1hRs6ZegYsqzrH7wBFNj/2ysPhsMc
 AsZnJ6FZh2IikUxWTlRjJ91oWwfcc+fSrf6kN7tLQARUfpKZUqf5iqp8a
 NK799wjGL12Oi+ZRVVeGLHB/hG6GiyZRTeF9KLf4EDTqnMbSs92tpvU0h
 rl0TlJieAO03B6M4vBLsKG/B3VE+m6Aa3wD7vRvSoUG+zvtLZmTbwAcIg
 2U5Q+IWsC8rc7S267xaYkul1Epzjsm6ZdJuFr203zrx7sNh1xea95uU6i A==;
X-CSE-ConnectionGUID: HAyMQmBiT1GkRflVxPnIyg==
X-CSE-MsgGUID: UkSvWcTlSYaHRFteyrJeCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42433557"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="42433557"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 07:50:03 -0800
X-CSE-ConnectionGUID: SZu7WBUlT5CvK8t9hPioRA==
X-CSE-MsgGUID: GMQOLhrNTeatgXqPYMDV8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="142288435"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 07:50:03 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 6 Mar 2025 07:50:02 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 07:50:02 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 07:50:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oVyyTwEUmIBsZSfrYU7k0YRaGtUq8/okotdDs+QNUwsC7lIdHURWTJjnUcu8fMxmsms7yEViCW8jYInz30LF+YoycN6lrOybbqChEVP5pffRfF0Hye6GQ9KnB5i0aTnYcB87UnK/sR7ycPQesJY4kY3XzUBcHFIJaof0aNCbiTQAzG3su3tqbI2c/n7rNH6PjRilicHOulgHRR1jG9qMknP6503sNzbJQZa7iwiGF82os7zhbQBEqOWiIVAGnGxgFDvGEuvhQKsBg6DRsjXEA7W/q7u1LkYtFQ3pCEMIeawjnvXuxQzeToHJpmOlbclC4ZBcmxmvSWjjwQ/rbr7fiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/twguTYn8iCWVkSMv0ox7V7vZWb8Y4RW1SbD2dFsUI=;
 b=TOFXur36anw8aPdVdOnKh3lrLUBKn+ICn4+Qp6ivfiditDA65fTmWLLngBwRfm5fBxtJAO9Sl3/c4NA0dkEXk+Ugyt3FZcjuo8MFElzQUkefECCRjgVeGRuwp6UYv1ZrB7Lgy/5RdrYBrsBhao/tQBKKzl59tLxMehzRDV3kzoIWeGH4jdSKjcJXbPg4k/0MlKWFw804cGWXzwL0qN+v+syLJUlFkdiAhJd7EZIfEThCjgNa8RDKUcbDE0G6PlwYhPawVh+9fE+qVK3fdFQgBwWbvkUtYXscV+NYPrfjV/APrSvJ4G6mQ6dNNgTZIiO18T4G4bnGyd0iDe68KrNgLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV3PR11MB8725.namprd11.prod.outlook.com (2603:10b6:408:21e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 15:50:00 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 15:50:00 +0000
Date: Thu, 6 Mar 2025 09:49:56 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Soham Purkait
 <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>,
 <riana.tauro@intel.com>, <vinay.belgaumkar@intel.com>,
 <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>
Subject: Re: [PATCH i-g-t v1] Add support for runtime pm for xe driver
Message-ID: <yc7bfsm5qm7ciipadix2ahhwzazmnkkvbvvyfa5a27qu7vxq5o@5p7nmvftovgx>
References: <20250306112754.1483363-1-soham.purkait@intel.com>
 <20250306135100.ey6vkuzvezylu7jt@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250306135100.ey6vkuzvezylu7jt@kamilkon-desk.igk.intel.com>
X-ClientProxiedBy: MW4PR03CA0127.namprd03.prod.outlook.com
 (2603:10b6:303:8c::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV3PR11MB8725:EE_
X-MS-Office365-Filtering-Correlation-Id: 434ce0b7-f364-45eb-e311-08dd5cc68d64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ecBK7cV1O4YLDCvQlebJPU1J1x3ru8OQT+p1+cjWY0woLaScSbu6oAeNNK4Y?=
 =?us-ascii?Q?9UFGjdOLN+jJVu+5yH+eyYXaimrUmQxJ6vz081fgk0GijBdbGgD9LSOcDBzo?=
 =?us-ascii?Q?bpy90xqJEM+wKvp0hXVP0yt2gsondO0UTqprE60ON7XvFaEAet7QMksewBlc?=
 =?us-ascii?Q?stg9gxbr/K5/kdXCZSbhLZb+1qWhSKdtmZMZ8eN9yuZCgR44CQy1lsSr8QuB?=
 =?us-ascii?Q?DwbZhqECwwoGBm/LgApHwMDE7AwSg6Lu/XwJQVnVr3aTe1/a2MriQsoomn6s?=
 =?us-ascii?Q?AImsW95fCMv7eY23LiZvr7AuwB6+lZKjQuhHaQAXjB6wxNBxwxA3dxBT/Zeg?=
 =?us-ascii?Q?sY8lxGByMkBUDfg9vVO0jlTlLS7vCGt7K9jxXYnLWfxXh3VHxMCgnLhY0epH?=
 =?us-ascii?Q?aalJfFsGgsggXC0BT4vXVl55pW+TsDavfmE6/1c3FGJEvb0ySJ2+v3BJUEjy?=
 =?us-ascii?Q?YbHRs9OfG1WV9GPLUUVQR+qA5iwm9IfdbI3MzSW4K6cWMDI2QoMcT7sR7stT?=
 =?us-ascii?Q?zXd9kZRFwpmzQLUrUGjnwdDFgT8najEHv/LtqOIwYEB8oHxu9Myw88r+xOJi?=
 =?us-ascii?Q?nwTgZ8QmuM7MJq5esfj5MGs4URH0XCSh1i2MP6U6aYyzc6dk/Kksr0FdYWWq?=
 =?us-ascii?Q?RFiKlDp5M1seQr67eg8VZq/IpacPuLkFyZUuUqdoeSeOy33hHga0Aokp7qKj?=
 =?us-ascii?Q?hxd4kt+xUc5JO9IkhZ+aYkxEICiQd4/vM+rzy6gSBfO2jy/E+3ybBeoXK79g?=
 =?us-ascii?Q?uicZA7nqeTpa1jPCGoWtRrTQur4HRjH92LAKB6W+BfdOHjlGxEOIkaeT5jCV?=
 =?us-ascii?Q?mFqBXzedAx9wjhC97puL4rqbBDAUpB7aHJ5PUeB7jmLnxEn3aIz9UPI4EVUs?=
 =?us-ascii?Q?AMOIQ1rjssdR0StI7+7+HbdQryyCHxNC4Cx/JKcbjNqM78r21VEwce9TWVRf?=
 =?us-ascii?Q?G8ZN4x18DWQSVs4FFZDNkQ9CYUN0SRHVQY/48Ia284GvNZ/dNW+9/exeyzVH?=
 =?us-ascii?Q?3K0KwMCqAHenAgbp0RtUZg8wMc9e6nniCGZDLalbdxk5+ToIqgvxHRMTSItj?=
 =?us-ascii?Q?kAC+CM0YWTILDcs0ln1B4Ue822P30gEbW82HP1D2htDBZyHGioOwH8GINlWo?=
 =?us-ascii?Q?+1PryACiO7SCeGFzdE14Em8EF2ZQwv+BFvmgr/6Df875BLNSGlsCDzfhL3Qp?=
 =?us-ascii?Q?HwArTWFJWxro9devuJzc1eMHtyPwU/HW3ToTYApcd3mBCNFpZL/3Fpi82mEg?=
 =?us-ascii?Q?UvXdPc/L2pvu3FkYTIc5tyJzR278UCAG6H/U6pj2aBcR4FXL5Wt5WSO3F8XQ?=
 =?us-ascii?Q?pKPms3gDUPlK7bnnJRdcF6m4jSCThxux45Osq7CSWC4tGdJitjD1n+jt/WU6?=
 =?us-ascii?Q?OBDdkc+JQexvy+2R6cJKBIEDFM8W?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KY3Wm/6Ztsj69GhzY71kipql7iSMp5QdTib8Wy5dks8oG+YfXQY5iryd1Ib4?=
 =?us-ascii?Q?IRu4b5CAvYBAjqS2P8EbIt6e//loJFOQX1+DW60CKUosdiFoLoFkCgN+fy+J?=
 =?us-ascii?Q?SxskiNjA7uijdAjALYPxaZ+1j00ZPBo3cQN5ip4yhdDMVjPsRW4SztxF4Tup?=
 =?us-ascii?Q?7y2KEtTS5ucsGyTefyAZIzuLOu4qo31JUKyzlRNW/aur24X48M6RYC+IeedG?=
 =?us-ascii?Q?xIpVinnVDWsznl6GxfXTtpl0Nvvq2ZDRQfFfcNUDlK4o77x3FebB791Uf7jT?=
 =?us-ascii?Q?N8trUexwILFlDk9G2tLeB2LZtsMeitaxUNXTcPH5imhNleZJ8g2+YNJuZOgx?=
 =?us-ascii?Q?LE9YoSppcMGC01MurqdlKgioqdsJPacr0sPOjaHwVapyu9UERdktpLA2nxZT?=
 =?us-ascii?Q?2fc5I7lab7kOhE/Uu/4PaIly3xBdnUR9BChBx0P2Mtzx7pFlO/ytDL9pVXMy?=
 =?us-ascii?Q?3Q9yehU3HJaUWLm31iMCA88GCWYDTyx4UYaJYqpXAkOA9CrOFUZDniY8yzHF?=
 =?us-ascii?Q?YlaKjgqjtYHnDXuDYczcQKaKgs3QPtbc4WO6BRANKSe+pwwg9dcbFjzTLlOt?=
 =?us-ascii?Q?LE0UyaMguF4TMFJLLb2MvW/VAlTAGn4125HeM5Pp+t+XpNSyQeGbLM4LRIvR?=
 =?us-ascii?Q?x9vSJNqcmYWiNjDQUA9QRSmu18m+qf5MLatyMEv++xe1YS23eQt1C/P+dNcs?=
 =?us-ascii?Q?zVTGWjhAWut7HuuWYaywRvuOTYgb2dlJlbmks88jzgs2AD6pSOrXqL/yuucR?=
 =?us-ascii?Q?dl3XKdYJ0pGI3i2I28JcSKg3lhvas+OWD0o7LWe+Qna57lqSgOyinR/iaL6e?=
 =?us-ascii?Q?8DpCzUvK/XeWHbZIIftwjgjwqVBo3WMYTxnpXzwBG9Etar3chqfA2fCNYHOy?=
 =?us-ascii?Q?Jgdx8EgvnMOulEFx3Y7ipH2kZbuiph2XWF6sW47lY4hlAXqHq1ikUs5CnIVr?=
 =?us-ascii?Q?RXTDeqaux3crEHKW/VnFCLcrOJb7eVP2J+1MYzouN+DJ3ZTBJczOk8p3WdnQ?=
 =?us-ascii?Q?Gq3H/uOgc0S3yeTdHItlhvWAyvssMFMMCgMGTTu+ikLvQOLBbmnwXaRYDhB/?=
 =?us-ascii?Q?OGwUXolaXRBgWxlk5XhLBI9Ms1U/kbM0wN04w+AbgNJclIfwJ/SjIjCAcmSv?=
 =?us-ascii?Q?wT5t8JFCgy7W9lh1b9w5YHMpYtyktvVeFQnvJteChoUdJ4qkgB8nU+tbN8q7?=
 =?us-ascii?Q?tvPzYlXBIOxGEexC8k8czY5wROwyOQzwZiQ0J2D6eNiIX6sLMAeMGjuw8IoQ?=
 =?us-ascii?Q?q6uJjM4+X4hMQADRqjl4BaXaTagoQX+2H0VRe4c9qGdyNSgUlZjCc+fM+O9G?=
 =?us-ascii?Q?P6iZ0BLgvbGp9B8uP8l2QAY4kVPT0dctbQ+k+my/UuwdvErPIIdcgArUSoLA?=
 =?us-ascii?Q?kZ2IJ4Em5R17tAkuOBcuNr9vtK9VUjsgNmrhmxQ92W/+0R3ByqNUFvrcRfEA?=
 =?us-ascii?Q?8Dza8qC8wMOlcnlhM8BS7KYl/1wxJlrGh3P/ogTJByYmiBdITH9wty0nFUYa?=
 =?us-ascii?Q?KLeLceGUzqxmdcA0BHKBGred6BPEPHVq43KE2QXRVkH6PNkdRh0E8uhzGPz/?=
 =?us-ascii?Q?DmJP+Cs3q1aXccLqk8UOZnS0F3A0h4pQRDy25+mK+Pnij2z7Fhj3LYQP+P5x?=
 =?us-ascii?Q?tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 434ce0b7-f364-45eb-e311-08dd5cc68d64
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 15:50:00.4077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/qv0ZqecFq4KuUUJhMz8AgLxtFIoBPTc/ZnQWOlxnanHTIqCwRSyTqNx0F9RpRkpsthEGTci0DCXsJFOPYb8n6GczD7mg9wbA998ODl/XM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8725
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

On Thu, Mar 06, 2025 at 02:51:00PM +0100, Kamil Konieczny wrote:
>Hi Soham,
>On 2025-03-06 at 16:57:54 +0530, Soham Purkait wrote:
>
>add prefix 'tools/intel_pm_rpm:' in subject, so it will be:
>
>[PATCH i-g-t v1] tools/intel_pm_rpm: Add support for Xe driver
>
>> Add support for runtime power management
>> for Xe driver.
>>
>
>Add here your s-o-b:
>
>Soham Purkait <soham.purkait@intel.com>
>
>Please use checkpatch.pl for some obvious corrections like this,
>you can find this script in Linux kernel sources, also read
>CONTRIBUTING.md in i-g-t sources for some options for checkpatch.
>
>> ---
>>  tools/intel_pm_rpm.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tools/intel_pm_rpm.c b/tools/intel_pm_rpm.c
>> index 08c25ca8a..945247d2e 100644
>> --- a/tools/intel_pm_rpm.c
>> +++ b/tools/intel_pm_rpm.c
>> @@ -151,7 +151,7 @@ int main(int argc, char *argv[])
>>  			goto exit;
>>  		}
>>  	} else {
>> -		if (!igt_device_find_first_i915_discrete_card(&card)) {
>> +		if (!igt_device_find_first_i915_discrete_card(&card) && !igt_device_find_first_xe_discrete_card(&card)) {
>
>Split this line:
>		if (!igt_device_find_first_i915_discrete_card(&card) &&
>		    !igt_device_find_first_xe_discrete_card(&card)) {

I'd rather stop spreading this. Particularly in **tools**.
If env_device is NULL, why don 't we rather build a match string with
the thing we want aka

	"pci:vendor=8086,device=discrete"

I'd replace in tools the current uses of
igt_device_find_first_i915_discrete_card() with:

	"pci:vendor=8086,device=discrete,driver=i915"

... and implement the driver= match in igt_device_scan if it's not
there. Then if it works with either i915 or xe, we remove it.

I also think the tool is being less than helpful by trying to work with
discrete-only device.

It looks like SET_I915_AUTOSUSPEND_DELAY also needs to be abstracted?


Lucas De Marchi


>
>Btw should we also add support for other cards in multi-GPU
>case? If yes this is some more work for another patch.
>
>Regards,
>Kamil
>
>>  			igt_warn("No discrete gpu found\n");
>>  			ret = EXIT_FAILURE;
>>  			goto exit;
>> --
>> 2.34.1
>>
