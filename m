Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A57FF8864
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 03:46:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC64910E08B;
	Thu, 30 Apr 2026 03:46:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bOd5veO/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E73C510E08B
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 03:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777520800; x=1809056800;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=91Xb5egQuDRu1apIQ2zij/zwiV9We7/XV4YnDW1CKGk=;
 b=bOd5veO/yqqG0wl7wMrcgJJIc4N4D/bRrX57jdzRvvSsnxWGsoK0ejOI
 4bPP0NEZrs97TPsZJK+f9EVgL9PkDrKTWt2GLnMsQY7AzKpASwu1J6F4M
 QiSYUIsSMXAgADCP6qwrZj3subwh1mvAFtKHSi/NMFNUfX5IBdgOnEWIG
 5D9iT5M4YptFHXVcruzebKUPUt1h0sFqRrwEMMLUp0rQmvZRRLMxorUf6
 D9ZbZuzyxPcpimGbPsr/YJqXd+n2ZsL/RveOYXCxugvUFGF4YehLZRMAm
 dG8nXWdvPcrDvpSCifdXPlEnX87euzqVw7F+6AqkWtVREhRdpRpl4Y3Xm g==;
X-CSE-ConnectionGUID: X6R1hBLjTyuUqoaa9qHMlQ==
X-CSE-MsgGUID: Frt0FcdVS4+YOx4AOoWa0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78652005"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="78652005"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 20:46:40 -0700
X-CSE-ConnectionGUID: GHiZvaJcRlyJO7LZlwst9Q==
X-CSE-MsgGUID: H+Ao6I9yT/S1ggdxI1vL/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="233405811"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 20:46:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 20:46:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 20:46:39 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.30)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 20:46:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k47PGt55HIWG8gTzdtCPOqU+mvPGALSOeHNnBtCr5lcr0kWvNYX/KunEHPvDk+Emw0+E6KuzwxeXZisI4N696WdLDmuO+ECmI11Y1iOXeZu+EwtHN2xbmAz2NNajSNfpf33FrwHUEeU3kWtKMAdGTriUiLojRcL0EZw0AaIk6LV4+8YHQfjRltcx7byfX9RMADhHYLJzKle64Q7+zsv81dYX1FVbT1fok4iiM/DxB+QH/Sd2EgTewxVZP0jXWkLs+C0m3fiBlCs7qD0nmeISDtvyxcDOem1u/oWAH+w9HQxC8aR2oqXDcjUKlv035egaFlhfUbEyWrBQ3B8HurIa2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSC/grVqLhSUWteNRGk0FM9JwuKKuV4X/QPzWz+tqWA=;
 b=VCYER09yo6UqId3ydD5GRRfCPhvGLoG3PpadHpFsBVKKbTfYNS23cpmhojiFK99L6qCINUa0/6q5LYvsqLYEB3EQ1FuOl+28hehamyjXm+JhHVuCi31YZe4UP7bKTqd32QO0Iz6B/SCTk9/rfBWrFAlky7DabKJrIaY2oPo0L9SBHUoTGkBGVLz0/7mkYSNHxH2Km8pImAzC9HsGwi4cZFNhLIUwX7Cs7nL5+IWgAXKoE/A4bimx1DrznntpRTl8Je5chCMuJbDT19jxVjq534TyTKV4y43gHHz5djvbnAoelu04SlmzdPh7Ja+L6FLqT/c94rpY3bpazeWM6bEvvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 PH7PR11MB7661.namprd11.prod.outlook.com (2603:10b6:510:27b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.17; Thu, 30 Apr
 2026 03:46:31 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%4]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 03:46:31 +0000
Message-ID: <0fb2cc80-4de3-45e3-b8fe-900882983c73@intel.com>
Date: Thu, 30 Apr 2026 09:16:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 06/11] tests/intel/kms_fbcon_fbt: use a bigger
 buffer for fbc status
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>, <jani.nikula@intel.com>
References: <20260416092559.88735-1-vinod.govindapillai@intel.com>
 <20260416092559.88735-7-vinod.govindapillai@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260416092559.88735-7-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0207.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::15) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|PH7PR11MB7661:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eece995-0979-445f-b476-08dea66b1146
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: zEVEheeRc/Dj2dhtZAy2jyuWe5lmEyOKeUnyXDdpAJWvkc0EmWl4cOtHGWavTQi9+GlzPSv0HOyuVjHUnh5Ed/qsLz9EcS7LcKk9GpbpNXUocCVx9YV5KJrTt4UHi0GNDIKnJ/vsD6WPT79AnCnVp2AHotwgir4w/iZSSqVgPFywcrUvGfQ2O2xoYMs+PTjP2VeKPG66uNk5Qn3JBM3qW/G49jYe5SC4rM9zv/4coxOR7RfborXwNX/mO1PMPXiqzZlLJMx63GiVvFoKolJmlAsVCebCaAl5qD6kSuNL8L8DWAWL5pq3nQLvwhtmx+SdFcQ64fT6j8t7fcjOssv6TKextilDAtOvdGiThyFlqbU5R0p2+MPtbetwcM6UV4RBOxrBH43HbjhXHdJfzoDoMavsRgqZjRL+ryWzHGzc7s4B4KHY97TgrvLc0do5to+2kXuHKSsQtzSTcLsEHsbFY2FgyJmZ1yKNIpPLvoTsaQc5+eTrSwc/2CHvlz8aROGze63hyk7qWU1qz4rTFYCee1nunnFwV0pH0U29NC6y7YB5XReiFhkdrMwBh/iWiuTPvJq+BKY/nLD3t4ubv9AXMB2KgYnf0mKotQJDQYgCc6Ppqo/1FpBvTDH1v0nSBRU3OIJDaL8MFZHYZMQx0pWbneETAocYLe9YCOlcJ/+Mnc57RXC0o0ZIe4B/bm61NStyAhmXpda1IljotMnFZYzIH87zEjUYF8e00lpFShpG3NA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eURPUXl3UC9RQnQvbk4rdGVBc0NqYWNKQ2ZVUno2WmV1Kzg0cjAyQklpVU5h?=
 =?utf-8?B?NzBHTUtwTzZ1TWlvY2h5UW03VVNSWVQ0ZU9odmdQVTM3dVJqNHdOVjM3UnZa?=
 =?utf-8?B?NWJTQzgwbUtzRVZ1UUc3Um1kZUhXU1RPTWp2VHVsdGlJckEvSUVKZmlCZ3pi?=
 =?utf-8?B?dCtwTVVLZ05JbWt4OFc5QW5wSlhWaFNpNk5BZjY0eUpWMEQzc2k3bE1TNjAv?=
 =?utf-8?B?YzFKYk94ckFvUmdmR0hqWldySkFvVFdTY0tSeFE1T2Nma3Q1T2VoL2NNZzM5?=
 =?utf-8?B?c1lnSU1aTnFUL3o0M0YvRDdUZ3Z0Wm5LUU9XbWZNR0RjT3NzNEU1d09YMENr?=
 =?utf-8?B?SDZVM0xtQ0xkdlB6WlNPcklPRXhva3ZDNkVYY2ZiZTdrK3Q1U2xEVnVocVYz?=
 =?utf-8?B?RCtCMUNMbjZvd1FIdXY1SldlamZBMTAxYlhobVFuRk80RkU1RmFsaE5tWk5I?=
 =?utf-8?B?cDhBOUFhaDUrTEx0eHRhaVI2MzJhQzFNa0JKWklRTlZPRjYwakRud05NM2Vy?=
 =?utf-8?B?N3NHZzRkemU2V2lVTjZITkdBR29VTlhPTVEzK0RIN0hNdCs4STl3ZjNPSERX?=
 =?utf-8?B?b3FJNHNyTEpFNW9WU0ZJL1JSTHc5OVZiQlF2c3BrajA5SjFiL3pjM085L3ZW?=
 =?utf-8?B?blpoKy9SRThPWlczVFpHa2RzSWY0cXVtVXo5K3l2RENYdjVDSlRtVVk2cUdZ?=
 =?utf-8?B?QUxFVUh4T3dtM0pGRWFjVndyMk9WWG1wT2NqalJER0YyTlFOc2NjZHhUdGw3?=
 =?utf-8?B?SVBlWDdMVHltN1FUUW90eUpKeGNsYWZXbXo2ekxIOHhTL3FkOHZ3ajQ2UW1H?=
 =?utf-8?B?MGtWVkdJcTNoa0swWTBocGlQdmIrd0g1UGZRSUdkTC80NTR6RzJnU1E1bTNL?=
 =?utf-8?B?QTVhMC96YThUNHhPd29RRjY1K3NmZ3JmaWxwTlFIa21hQlpNdmJvckFyZHFI?=
 =?utf-8?B?eCsyOU9mUTRCV2w5RTc4YUxkTlo0UXZ5ZzhNUkxVazlaeGtqSjUwS1pOZlZ3?=
 =?utf-8?B?d2hpZ1h6YXltMU8vaWVmdlFSUGtnU1VsMkYrNmtncTBpQUpPNGtmV2ZPQVM4?=
 =?utf-8?B?emdrUm1xQWdqVm5CeVNjSDh1RWtmZFdkV3dvRjlTSFp1enkxN1IzRy9RZFZn?=
 =?utf-8?B?dUV3K2lhMm8wMUhpRDcvNVpHT04yWXdjNTBnV2NVYUNEZHpEN2tpTiswTmhp?=
 =?utf-8?B?OFlQSy9qcHFidXBpWi96SDNGc21FVzRMNVpEZ2lkNFg4cU1nWGp3eTFsMi84?=
 =?utf-8?B?R20zYyt3TlZwcjZDVTYrK1FhRXlBZ3lMRjZyRlFDU3NKQWJVc0tFRWwycWRY?=
 =?utf-8?B?a21hQ21STmE4ZC8ydVdINFVLcWgzbVI1MmpROUhQVnJKdzdYdU1aS1Q0ck8v?=
 =?utf-8?B?Yjl5RUF3cEZUa3lwaW4zbENZaXowWkRFdmllWWlIclFYZ2hEc00vNGo5dHpj?=
 =?utf-8?B?Y0cya1FLbGJYVkxQbGhPMHFWVU00VzJIYStETXgrcWllbWxqRTlqZWRYUlV6?=
 =?utf-8?B?VTM0K3BqdkFRUUREN09ESSs3NllyeXpEa2NlWWxiZlBYeTZRRnc1VlhPekl2?=
 =?utf-8?B?bnZzb2xXRFhyVlRibVRURlh5YU9ETkJEWTZUNm13SkRXQTZNeEZsemY1WGxD?=
 =?utf-8?B?OWI0N0xic09IdEw4RUNrb0hhclpydzJycGZDdnAxS2QxUWRndjQyRWR4WDhZ?=
 =?utf-8?B?NVo2OC94cGliRzQ5d1l2MG9vSzE1a0pUUE1CR0lkQ284T09kNnNzcThKNDJD?=
 =?utf-8?B?OTVhU3FvRHNEREFNQnl6ZjR5anpJV0dzdWs4aE9qbmR5N2MwL2t0TjNZWXZV?=
 =?utf-8?B?c1cyblRsdHJhajhZaWY1bnFGWG5DVjJJSUw5dG13T2dianlwRkhTTExVenQx?=
 =?utf-8?B?cmNIeVVBd3Q4bTVvYUQyZFliVkJQL0xOV2VWa0VpT3pLa2EvVmlWSmloajV0?=
 =?utf-8?B?V01memprSndxTFFpVTVFNkxzcU5aQ213cUhyV0x4WGxaemtmbjFrcVp2SWpE?=
 =?utf-8?B?VzBsamo5a0lZcVhPVmVseEtqOHdaT3U2ZjJKK1JueXRRb3d1dVdPVUxTSTVq?=
 =?utf-8?B?TXdEdUlMeWtVQ0IrdUlnRlFqWkRuNk1zbitNelNSd2ZIMEdaa0VsdkFUYjVt?=
 =?utf-8?B?Zzg0cmNnME9YNzZ2dzZmbzZYS0phZlpPUG1IQ01HUklwWmsyc0Fvd3c3dWNp?=
 =?utf-8?B?T1hNVXloR0d3Q1Q1QWRUZXRwd0hGallvUjV4Yk5MSFB2OFY3T1VWZG04eG1u?=
 =?utf-8?B?TkIvU0pxVHBCZ1FHbFdYQ0lJSWJwbGNrZnVta0JrdDBRckF5OStJRWdMRzJa?=
 =?utf-8?B?ckV2SG0vMFA3WUV1d0hKQStWNFZxMlFwUGNPVjNjdGZLTVpvUVdrTTVJNS92?=
 =?utf-8?Q?mOZT8WkRSp4ueQN2jj6Xvk+ALDXzA+wMYTQ7a?=
X-Exchange-RoutingPolicyChecked: fuP6Wm5smTahZUiIN4ncXTSSaYHN7zBCJxIqnEjX2NOnTc1653VmAIydJ+RVmbpXV/tUcTJm+wQ3YZymCRgkm1q6ndPrOqsMiFb61VYs86Ovxt4CjsCHPVlhLSKDHihhgUhmkC9oC0bRI5Scedh3cjSzpJjNjojk3MmRYSlTExzU/Xz7Sz+2qGLkylFnT1I5xYHC/QxVSd3NIp9VWSZIJAi9P9o5Am3pHuZGBSSKAD1KZ/+kF50GlBJYklIWjfORrb6c6WkQd1cXsrEdZXmdgrIJ9OX9n4XIbU073kNDByBmj9U1G5LALbrgzFnaJYZ7Yp0Z2sVywmhjCPQZT4OiLw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eece995-0979-445f-b476-08dea66b1146
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 03:46:31.6013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v6b1J9yWSuMgWbnCaY+jm5Qp7wfkk+c+v+miyRHg9AJ2CUl/TmyxOxOLk25rDA+XaefJu6bUZWT0NZPo7GTFsPrEiGZa46ILzO4V8gn+Oe37TOx0Dj51n5fUDQUY2+Nq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7661
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

LGTM
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

On 16-04-2026 14:55, Vinod Govindapillai wrote:
> As the FBC status now include plane specific FBC status as well, we
> need a bigger buffer to capture the complete FBC status. Use the
> already defined buffer length to assess the FBC status
> 
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>   tests/intel/kms_fbcon_fbt.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
> index e44be15f6..b36582011 100644
> --- a/tests/intel/kms_fbcon_fbt.c
> +++ b/tests/intel/kms_fbcon_fbt.c
> @@ -33,6 +33,7 @@
>    * Mega feature: General Display Features
>    */
>   
> +#include "i915/intel_fbc.h"
>   #include "igt.h"
>   #include "igt_device.h"
>   #include "igt_psr.h"
> @@ -81,7 +82,7 @@ static void wait_user(const char *msg)
>   
>   static bool fbc_supported_on_chipset(int device, int debugfs_fd)
>   {
> -	char buf[128];
> +	char buf[FBC_STATUS_BUF_LEN];
>   	int ret;
>   
>   	ret = igt_debugfs_simple_read(debugfs_fd, "i915_fbc_status",
> @@ -100,7 +101,7 @@ static bool connector_can_fbc(drmModeConnectorPtr connector)
>   
>   static void fbc_print_status(int debugfs_fd)
>   {
> -	static char buf[128];
> +	static char buf[FBC_STATUS_BUF_LEN];
>   
>   	igt_debugfs_simple_read(debugfs_fd, "i915_fbc_status", buf,
>   				sizeof(buf));
> @@ -109,7 +110,7 @@ static void fbc_print_status(int debugfs_fd)
>   
>   static bool fbc_check_status(int debugfs_fd, bool enabled)
>   {
> -	char buf[128];
> +	char buf[FBC_STATUS_BUF_LEN];
>   
>   	igt_debugfs_simple_read(debugfs_fd, "i915_fbc_status", buf,
>   				sizeof(buf));
> @@ -310,7 +311,7 @@ static void fbc_skips_on_fbcon(int debugfs_fd)
>   		"plane height + offset is non-modulo of 4"
>   	};
>   	bool skip = false;
> -	char buf[128];
> +	char buf[FBC_STATUS_BUF_LEN];
>   	int i;
>   
>   	igt_debugfs_simple_read(debugfs_fd, "i915_fbc_status", buf, sizeof(buf));

