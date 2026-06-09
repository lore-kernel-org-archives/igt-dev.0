Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17778CD8CA7
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jun 2026 08:11:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56FE10E189;
	Tue,  9 Jun 2026 08:11:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D01i+GlZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0844810E189
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jun 2026 08:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780992663; x=1812528663;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=C+nWHufbis0MVz4+3iaP2GueG2biyrO9IIziqmLkTXk=;
 b=D01i+GlZp6tmya2k77TS3VqBNKLaLjAI8jJeYpBQkh+i4pK0bXwbqOkr
 huFk8uqIhvSnvLtFyZDrI/lPFymoh+shsi0HKi660jPNoijpzaBFUOHNr
 7yKl2vUrJR7Xh1suTpcONtXJoeI3lw4BzVv/rbnCdmX1foFBdcwMRoN/Z
 eb4qQmtTrTaKaEZYwD3o9UbMMMRJkYl1uS+aMN0W304rOojDmUS4rFhvk
 0EBfx3cv5kryqbXn6JwYTi0EqxJYHMGjwCV3ohXIqhpzJVaOoSYE/11Gl
 fPo/mEOt852HNJi1owRYhP84eAo27OUTEA5KboWKMStSrzuWiK+otM3kr w==;
X-CSE-ConnectionGUID: JRwRIcGwS8mIbEy4RYCrVQ==
X-CSE-MsgGUID: W5yG3a4uSeilJDGYtyhPZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81598164"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="81598164"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 01:11:03 -0700
X-CSE-ConnectionGUID: b8CIXL3jTbuMZclvcqYJ6A==
X-CSE-MsgGUID: lTzpYGGhRvWLZ6Lfn5vbXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="239455034"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 01:11:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 01:11:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 01:11:01 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.2) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 01:11:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ptzaOvF8vNT2onCTR9NaVodBXqddUAt2V2nY1MhJMa12K4fEDszdzRwBoRo9dPKZeQFuJnUvU8Wo/QDk3W1SDSP0A8zUFP4W1cq01bd7M+0X5xvycTiOTRWSHaFx7AIS6ky87g6g+mBUMkztkQ/nhrjmOPm5Dx5cK39vuXmupuIJmhNTI0jfLBTBLHhtKynB/8jrKgnFu6pPmzbFM9aat5RRLiLAlAyvn2zAuVWbMoxXdhnTwbMRbDE9wSnjT4Yp+gBDK8cbKbCVHW9U7MLGOgHgV1G4cctyr//Gg8wNRgC1/70w8z5FiYAVgDaPP1uZSk+z7ky3weU0d1kP6uLP2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=atD7wx7g3YZzcmq1CS8HbNg4uE9phcXBHBwdtkn0rFk=;
 b=kdNl8yjAPiqlPz0P3iCvgiA8OB7MVV3utbfg3c261j7xVLM8ZGDC/+Bl2HYLrz31NctPlodICxSRxUKUAlLZyQtUsAPrZMRp5plUY63DsuSsZomXJnqOM1REDZyaFDfRDTb26byggnNfkhG2tNi0nYWxFvMVJWjdZZ3Bb9ZQmwY8qEeuVdhD6IZvo3cghtMQ66xF/KZapmhXjp1sGwbN6Msj1hDJUSbA2YlwLfbzrUboNqKXde58gNdI9bKn6Ntnb9dx/HVCYxvXeSH280Xe5eJhpNZuAiMNa2GWGmFjywicjEDlDZ8biD7JdKocJt1AolBdty/PSGRIlu8FTOu9HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by CYXPR11MB8730.namprd11.prod.outlook.com (2603:10b6:930:e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 08:10:59 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%3]) with mapi id 15.21.0092.006; Tue, 9 Jun 2026
 08:10:59 +0000
Message-ID: <9c6b6fd9-5d0e-426b-b2ea-3c62a9f7ec8e@intel.com>
Date: Tue, 9 Jun 2026 10:10:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/6] tests/xe: Arm SR-IOV exit cleanup
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>
References: <20260602141609.3941750-1-marcin.bernatowicz@linux.intel.com>
 <20260602141609.3941750-5-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260602141609.3941750-5-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0001.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::27) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|CYXPR11MB8730:EE_
X-MS-Office365-Filtering-Correlation-Id: 01cd60d9-fa2d-49e1-7570-08dec5fea3dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: FlQBMbA1KNFohIReQaMfACUQsBBpKd0cvjMTlpJ2WxHuru9VkA/fzvdeeZAYbE/1mj5fWJoe8nyZjLQGEkFe//ijKq5Sizbi7lYwyaVtBpe0BFYXCnxjk4AxjTUJz9FRpkhSZOFUVH3Wpt11v5RemUyz8pxIxL6ujLsLb63JcjWzbW6PsDwz0DFpQy1H9jg++qi7jiRt0zcrcHvoMg6XHb0BbGTfogAPepZQwRNDlpyJLscprHV3ALw+NCGv7iMeMpkGtkq+QONJZ53ozVYknqtqaveCOltd6oQauwOAAYyzlpcxU6ej0QZW6t3ZhXt0Yfp6lcnM6/qKqVGJi0DSm3bjLFPwB9ShVv9jSNRO8XyvqJsdE2iUoABsI4BXcIkTvqZk+C3nvG31fkR7Vt+gEaH9sGTPruFr+ZP6A36kEE7XPk1Rojta5aChfbzOYW5NxByteHDQ6J/4PORC+SjPKNNVLLO+e4cEkL2JMo0vB+zcoCPecKbOchuq/RBMfWyMNP7tOy25YvgWYShl4jl9Ign+KQZKHY93yUGgBExStIlHE+lFUBoDxWr8ANozv5UvbYW/6yejcn1EMgMZCRG15aAfvGocRgwI7lxorVZlpOi0tmRZ+ifAs4P/O8LkHjvinXAKariJPyyTBD47XIGAjx0QXapSs+cQXEygYOMFQuPMmL3gspz03TLTlGxGy/AE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tk91VW1lTVVCd0tDRmNXRW1vVnNON1RVaWtTZFlwK3FnTEY1TVU4SnhwUE9M?=
 =?utf-8?B?TElWZDZNUm9RdW1VMU1WckZOK0ZsVTB6aWFVSU5lSmtYQzh2Q3lLbGxTMS9U?=
 =?utf-8?B?K05DL2dHVWpEc2xzS3RpeTdxWENYVlhGQ0syTzI3MElDd0NrVHAxSzBtMUp2?=
 =?utf-8?B?ck1pQlo5QlF6UXdVSzdJSnFoL3loWDlyVzhtTGwzbldBZWVMNmRVUTBxYzNO?=
 =?utf-8?B?dEpBd2V6d0xVWWxVM2VPMzU4WmM3dmdvUjNXL29Wd0dKVkV1aDhkckZGYlQr?=
 =?utf-8?B?NExQVnZNVGNnY1g0VFdFL1lpcjROekZSZjhmUktwYjhDYXh3ei9mSmpoaUox?=
 =?utf-8?B?SmJCR0t0a2xYWFozRnRtQVdvUkxXQTZJTmVtMG9XODZvVXZkaVR4SUxvSk9i?=
 =?utf-8?B?cHJySmtkdkwzaUpnZnc4a1FvUXJWNWFlMHVOZFBVYjl5Nml4L2hDRWU1b3Uv?=
 =?utf-8?B?NHZDaUlpeFFKSm02OWdIM0crVnZZZlJrL2o5c3cxUmw4UlJhMmpYQmVvY1F0?=
 =?utf-8?B?bFpuelFtK05hVkp5ZjRNemV5N3ZGTVh0STIyVGZzZk96c0ZYWThlZE5BbTRE?=
 =?utf-8?B?ZTczUG9BRkxXS0xpSGFpY3ZUWHJDMGZmRERqalNKazFSeXZzaDBOMnFYR3FG?=
 =?utf-8?B?MitXQWdwZVFkeFpUbTIwMkRIODgrQ2ZMSjBCVDh0cUxHcERoK2wraGdwZENJ?=
 =?utf-8?B?QlFMRnd1RjQ1VDRveDNuMk9rNzVvNk1zYURTOTUvQjNNWW9icm5HZzhXN1BI?=
 =?utf-8?B?eE9GVStEZVZBMzRsL2I5d3BTKzZGeSt6UnpRL0hrSkJxM2R1OHpPd1I2Y1Vz?=
 =?utf-8?B?dm5FTEtPVHdjZzFPMS9ZUC81RVpkbEUxZFg4TUVIdkZwUEg4RlVYa292WVU1?=
 =?utf-8?B?VjhVRG9XbXJOTWw5MVhYZmdCbWJsRTdaYWY0S3lxdzlMbUJ3bCtMSm43YmhY?=
 =?utf-8?B?ZmlVdjZZTlNVNCtubXVjUTlLempYdHdXZitvak5WSS9EY3pEK3FvRTZrZnhV?=
 =?utf-8?B?djE4RTh4dnRnaDl5OXZVUzVNekJNNHYrWGtGUVN1T29ITFJLdCtwbWo3SXhB?=
 =?utf-8?B?d3I3U3E5VHZ5RzllWmZ3ZGFack9WRzBpS1l1SDJhd2xpbnR6bXJpalYvQlpu?=
 =?utf-8?B?VWR5azBWbVljWkZYc1hTbFJpbFIyT3BzK2lZaGlua0h2TnlBajZ0ZTZqcVZk?=
 =?utf-8?B?MHdPZlREb0lOUU5SNmZtQVlROXk3bGZFWmRaalNPVVBVdi91QjNSdGwxMU9o?=
 =?utf-8?B?VHA4Q1JraDBVbjZRcTJQVmVuN2ZKMFdON3BoTXVpWmRjRFBRK1A4a3ExWEJZ?=
 =?utf-8?B?bzBZTXRYNXFnd21rOC9vT1BhTE1KeVVlZ043NDE3cFlxV3c1b2ZEaUFFd01S?=
 =?utf-8?B?cVpQbFl5dFpHM2dGK2J1ZjVXSVhqNFVwcHBZT2NrakJST0JiTVo2RnBhNmpj?=
 =?utf-8?B?RVlIaHozQXhRNWRnTWZLQUdNM1F6a1JtZk9WL01zeDhGRDhPNTlxSjU4M1pm?=
 =?utf-8?B?azJuOE01Y0JZelFjYXdGTmxqNVUvYnVIT3V2dGpSdGoxeGZpc0ExeW1MZDQr?=
 =?utf-8?B?RVlWc2J4Qi9BNFRZUnIzV0hGVHVIY0lpSlU1RXk5c3JnYmR1ZGl0ZE16MzNT?=
 =?utf-8?B?emR2cnZaUDd2ZnBFZ1c4STl0cEZkaEl6aHl2Z0tCWHl3L0gzeC85VFJXUlg0?=
 =?utf-8?B?QUtQVHVja1AvY3ppcHFWY2MrNUdXUmRidlhsS0NwSENQMUVEWkc4T3dzN1lh?=
 =?utf-8?B?LzhNTVdQWHlXd3NVR3BYMHhlS01wdTNocGh4cngraVBvaXFGbUtvUHloTWY5?=
 =?utf-8?B?eFdTZlBpUnRUb0tKQWMwdXVnQ3Y1dDlVd2ZlYTI4b2pBbThQUFBTUGR2SlUw?=
 =?utf-8?B?UWppQmwyS0lUelFyWmo3SkRTK1JZdjlac2t4UzVSUWRSMG4xSHZDSmpjMTEr?=
 =?utf-8?B?bDRIODhKK0NnN2M1clhMclNwcndIV1c0bExGd3QyVEplQUNaL2V5b0ZwNkk4?=
 =?utf-8?B?RitkZ1dDMG9SMEliRU95Qkt3MEJjeDROQmo3S3N2Q2Mvc05oY3U4M2RWeUlr?=
 =?utf-8?B?SHAwa1dTVGlhcCtyaFFoRVdpOW95ekRsemI4dEc1cjdOQUxPY1BPU1ZOZ0VS?=
 =?utf-8?B?ZzljZXJLNE1GUFBHMWpHWnJWd0taSmZvZ3YzY1hyMGp6UWUxVFAzL0NNbUFK?=
 =?utf-8?B?bGFadC9TaXdVTmdtaCs4M05KR0NrNDhKcVFzYXBsKzd4RlVHZjU2YkxNR0hJ?=
 =?utf-8?B?R0pieEVhL1NZL24ya0RJbEZGdVR4SFd3Tm4yLzRrSFZPSDlQSHZHdTJYZ2xB?=
 =?utf-8?B?bDAzYTBjWFBvS0t6YmJ5NWlYRTBCZE9temw2bHBLSHJkVU9laEtxQT09?=
X-Exchange-RoutingPolicyChecked: gpJHVdzbETF8odmNQ2r4cvtizdM4vKQEDtdkzcHGbcMmB4ngF+9TrkUgnRLgFHCv1fKMGRVwQ+Swx/G8mg3Hz+OBMLPZtgk9W7jFvhzZZMJvHvGzl589wm3yQR6/ggFIC88/RdEblBsEKHQEMlSkgK4p/Eevcze9dOQW+dYbFGTv9eGdosqkxCNKitpLPDOjC5nauGldtrjembZgyPZlqREdyO31cg4hLd4VPf2k2CwKEeY2d4uaB6GqwYGSQLZXAVTmJwGIQoyGANTWXuTAd4S07lcrB11wVZfbYbMhz0oOkFKNg5UBwt6pxffsGN9qYJRQulkThbfvGX4qdv/UMA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 01cd60d9-fa2d-49e1-7570-08dec5fea3dd
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 08:10:59.5524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BrKxPdafdzKbEbjVU0fgzalDpsTibivYzXN+36SF9CccqalkdfNQfHPMTNvnFC/amRdQluFQilOn5UEHmaPdAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8730
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


On 6/2/2026 16:16, Marcin Bernatowicz wrote:
> Install SR-IOV exit handler in xe_sriov_auto_provisioning
> and xe_sriov_vram so VFs and driver autoprobe get restored on exit.
> Clear handler after explicit teardown succeeds.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> ---
>   tests/intel/xe_sriov_auto_provisioning.c | 2 ++
>   tests/intel/xe_sriov_vram.c              | 2 ++
>   2 files changed, 4 insertions(+)
>
> diff --git a/tests/intel/xe_sriov_auto_provisioning.c b/tests/intel/xe_sriov_auto_provisioning.c
> index 8f573d234..9b4858144 100644
> --- a/tests/intel/xe_sriov_auto_provisioning.c
> +++ b/tests/intel/xe_sriov_auto_provisioning.c
> @@ -347,6 +347,7 @@ int igt_main_args("", long_opts, help_str, opts_handler, NULL)
>   		}
>   		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
>   		total_vfs = igt_sriov_get_total_vfs(pf_fd);
> +		igt_sriov_install_exit_handler(pf_fd, true, NULL, NULL);
>   	}
>   
>   	igt_describe("Verify that auto-provisioned resources are allocated by PF driver in fairly manner");
> @@ -440,6 +441,7 @@ int igt_main_args("", long_opts, help_str, opts_handler, NULL)
>   			    igt_sriov_disable_driver_autoprobe(pf_fd);
>   		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
>   			       "Failed to restore sriov_drivers_autoprobe value\n");
> +		igt_sriov_clear_exit_handler();
>   		drm_close_driver(pf_fd);
>   	}
>   }
> diff --git a/tests/intel/xe_sriov_vram.c b/tests/intel/xe_sriov_vram.c
> index e46416d96..8e6749393 100644
> --- a/tests/intel/xe_sriov_vram.c
> +++ b/tests/intel/xe_sriov_vram.c
> @@ -354,6 +354,7 @@ int igt_main_args("", long_opts, help_str, opts_handler, NULL)
>   		igt_require(igt_sriov_is_pf(pf_fd));
>   		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
>   		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
> +		igt_sriov_install_exit_handler(pf_fd, true, NULL, NULL);
>   	}
>   
>   	igt_describe("Verify that VF can access all the provisioned memory via VRAM BAR");
> @@ -407,6 +408,7 @@ int igt_main_args("", long_opts, help_str, opts_handler, NULL)
>   			    igt_sriov_disable_driver_autoprobe(pf_fd);
>   		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
>   			       "Failed to restore sriov_drivers_autoprobe value\n");
> +		igt_sriov_clear_exit_handler();
>   		close(pf_fd);
>   	}
>   }
