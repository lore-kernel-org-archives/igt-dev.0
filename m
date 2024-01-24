Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D13C46CD2
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jan 2024 05:31:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D048F10F4BB;
	Wed, 24 Jan 2024 05:31:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 981C010F614
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jan 2024 05:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706074261; x=1737610261;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8MIEhRbepwV8VURdnjg9NXEyn+/7pgxwpGSvY583b4A=;
 b=ilruZQor+murn6AVmCFsCBFnBZjE7XwG5vrxjLL+kJWZqQ/i4wvapsDz
 V0VEYFkJGMfT2yd0BvtdbVN+0+rRjMBJa0k0sp868dCePh5VWCDvAbsNr
 /tBSbHo2w3Zs6zVgu0NDN0gG5Jc6OqzPcW8Fp2YghDm4ECeRwy7O29bvG
 H6UrlpNHdXG4Z4tlCKfDNSHrvTGXZoEMzM933TdtMQ3gRskP1NyeuZKs5
 7kwEmpnKYQfBjVf3WTLq5mw+IyyKeAKuSRtwacns5Bc/FcqYWKtZy9Kpx
 9qN3eTXOYvLmSyVlOjZQL6WvKJrxw/6DabUT1JfI8LaqFPRp0LjEw1QyD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="23207408"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="23207408"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 21:30:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="929562611"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="929562611"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2024 21:30:59 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 21:30:58 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 21:30:57 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 21:30:57 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 21:30:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WaHRaSj/3m/a58a8bG1+jztsS6by7sZ9S8+FtvKTagEJ0wDp2KiegJMfme2U3rfNs4o1L0Yp9LW6YMsZOADiqdTtAefz5uc3iXJhFfl16+Fjqw3Ac/lXSKbBpMvQIa0pZXSaFPzyxERk/In7BNPrRq4rKypTL3qptLIFSaKHuBNCsTVCCoD5Fu+qw+KziRrl6ykHFtOVNAZDvN9JxBaBx7BdfsSnZVzKF76rtgkbupa2uSpqyvVhYHjb998xL3EZEOhr3Uvsa9UZvvtmyr++WNPWHZmMk804qCYTMEpIR1+qkxcBc69xMxeR1r040CPb3cKCDFNwXVluaNTYHiqDJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4w5FQDal+3YGPF1zlhHkDpUhP7ugl/RwCkAALongjA4=;
 b=H4bHP4Su9PJS5NmAksQxo/YlxQ0Ky0GnKAqvrehhYwpcOGFgs/d2Beo9HBOkvCHKSLV823eth6bZTYQg390eaoLnwV6Ig0VvqnW4MO0rJ9jKML6F+oGcDSxIF2Xy9Y5UayyC7X2uuRwHlQewfOJJVz5m4pbDWnrZ+JenHtyiV0LvvQ7ZDwg9Rw5PB52IvKNq76YJsmnGmvk0qjhFFh+ZVrRWy71P0tCIa2yzY/gQ64EImKUfZcZRlKFsJgqlDMhVw7ctsw0GUBOi3QEYjuCmsVwez+02xEKuMYX51V9ilB0eC7ytjf3HK7HIy4Y3TXDrY+1nKtlumLvUwh5UZLC+xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 SJ1PR11MB6081.namprd11.prod.outlook.com (2603:10b6:a03:48c::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.34; Wed, 24 Jan 2024 05:30:51 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::ef1e:146:d198:adbb]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::ef1e:146:d198:adbb%3]) with mapi id 15.20.7202.035; Wed, 24 Jan 2024
 05:30:50 +0000
Message-ID: <11ec7aa3-48fc-49a5-8751-bfa31cc2e92c@intel.com>
Date: Wed, 24 Jan 2024 11:00:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/igt_psr: add helper to check of given psr
 mode can be enabled
Content-Language: en-US
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20240123141835.1211107-1-kunal1.joshi@intel.com>
 <20240123141835.1211107-2-kunal1.joshi@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240123141835.1211107-2-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::16) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|SJ1PR11MB6081:EE_
X-MS-Office365-Filtering-Correlation-Id: 14ee95d0-a640-433f-9dad-08dc1c9da05f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4PQhI7L2CBS13WiCwJWTZKI45PbB8MfiH8cl3gKbMcuIfThYXzTMXQpxMqLcPOXO1kmOkdtzOKvevqIGxCo0j7AdTAUSJsqc5YEnvxoYNo1sgi/YnGWa7E5wDNkoYR5yqVw8NYDN9p2fWbbwee6tPGJjq3BSWyrTCkNH5F5Vs1azdOW8Sui5LooFqk4HTSzUtabINqs2QMXmPM1piPxJX8a/KZMmaPOhcEvk/MxSQmgeP8clle2oj0ShkIyDoNXwEdrSbq4JDKmJKAtLShmvoDrwKYN6qAuloNCcXOad2SvTqpU+Rlcu+y3hNzYMCV0aqFU+1839IGflRJGZ6RIVr1EAPHxQZaWDeZFURaaodT+C1YzckVF3LAUc2ER5UlZCbgcBAHltG2X0mUj9qygLcTtLp4teElYn+NDpVbarK59mzuhwQihhXQdQpSvKjYdNDYuj59w7WBlRbNzSVEyjBDByBt3KJi77Kg1NCvEouvOIHPV82Q/pi+gFuxSWMh3J3rJupiKbkPapaA5iRKoJun80rb0Ion0dw9Agg5IrJEFSxrLoiCwHgVOcuXLUKeUDd/Gl3mdjiG/JSttVKoLF+PtQCpolFDE+jT//Fe9knQVmK4jnQ8S8FJ7ArrgLAIMhC42kkXKLDsU24G6hUd659A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(396003)(136003)(346002)(376002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(6512007)(6666004)(6506007)(53546011)(6486002)(31696002)(36756003)(82960400001)(41300700001)(86362001)(478600001)(26005)(83380400001)(2616005)(5660300002)(8676002)(8936002)(38100700002)(2906002)(31686004)(66946007)(316002)(66556008)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkZ4bzVpazF5Y3BiTDd1NWk2V0U0TkNaNXZUdzhlUHBNcU5WK1g0Z1JZVnZu?=
 =?utf-8?B?UkhYTkhpL1l3NFdCaVJpbko0RjBoSno1RndPeFphTmJodmJuaG1RRE52TWhx?=
 =?utf-8?B?YmJrbWZSeERvWWEvMm9DWEVhUVVxYzRDdUhmTFIwN2p5WFFOSERBSHJwWHVw?=
 =?utf-8?B?M05EUHh5SDc3d0xadklpSkF5b0c0SVBDTFVCK3hPSmVJaXB5WEt1U1JxeGkz?=
 =?utf-8?B?NDUvV2FZQVV4TlM3WFJxLzVySmMzUGFhTlV4SEpjK1YvVThoUzVJR05aR01y?=
 =?utf-8?B?dUtFMW9HR1BPU05sVnJGbG1OTlQxZUJpLzNLZUVMS01hZ0dCOWMvazc5dTZh?=
 =?utf-8?B?WDVsSVlQVEtVRzdHdEUxNFRYZTRXVG1haWMyUndRbmxCVXJ2VWY1ZmZJWkVo?=
 =?utf-8?B?ZUxzQ2t2NE4rQVhXNE5iUGo2VlhuOGovSVNpcUxFWTJDM1hRNDNxNnVUakVF?=
 =?utf-8?B?MGZnTXZGV29xTWp3aUtXaEpIdjFJNTltVytLS1Bwc1Q0MzBiL0V6QWo2Y2oz?=
 =?utf-8?B?TFhhQS9BMzFXR0FGaEpBcE91WVJWc0RPUzV1MjQrcitJRVJ2c3pPRy94NEta?=
 =?utf-8?B?T09hWDdadS9EK1ZydHozY1dhRlVJQkhWWUJpTGdORnU3MGxLSUtOb3E4SVI5?=
 =?utf-8?B?cmRJUGlCb1ZWZjNxVkZVdHN3TURicDArd2ZWdFZiYklNWGF6M0kzNGdhaE10?=
 =?utf-8?B?K21XNlc4SXZ6d2pucTdmU1RSZVZkbkdwNTRqcHNHbmdoMUF1cXV0RzkvMVpM?=
 =?utf-8?B?NVZYanludmd3TmMwR2VJRk1BMnk0aVhqM3VzajcxS3RrVHVUbEZpZUU0ZWZu?=
 =?utf-8?B?S2J5VGc1MVFMR3VYREZIWHJRWHI4UXFvR3R4bk9KNElvYzMrYnJxc1lWbGQx?=
 =?utf-8?B?WmVPeWw3eHVnTStwaUJKSXRpOUJBanhGeHlhNFdjRkxESjUreFNSUGpTUWFI?=
 =?utf-8?B?T2xKa1c1ME5MVm9JZmR3QURKa21OcElZaUJIWnhIZVp5SVhpU3VNeXFQdHNt?=
 =?utf-8?B?WFFhRCsxdFR5dVczYlpFVm9hdGpPQUV6NTZBMWJhRlFkdDV4NEZMNkJqeTJI?=
 =?utf-8?B?VS9lNG5YL1lyMGp3SDVNVi9yTW00ZFhudHU0cHFickRteThqcGhON1F5c2FF?=
 =?utf-8?B?UU9BaXNKM3k0Qy93TXlEUThPYktIQXRud2NIWGJYUjJOaHZING5NWXFVbks3?=
 =?utf-8?B?NEhob2EzcEdTYUt1MXJMVkx0T2hlZDd2SEtPcDM0QmpxQ2pWMWdKMU1IZmI0?=
 =?utf-8?B?YlpSdDRWUlRhMFdNL0QyZTNSMnRrZWdaMC9Ycy82cWN6TlZkVmxJR05wU09M?=
 =?utf-8?B?ZW9zckZMYWhOSWVyV2JqSEg3Q3A1bXNzZ0hwZ2gwcVVpTzVPS08wYytjTGVz?=
 =?utf-8?B?SEY5MFRrUVpyeUJNRUY1U3BLN0doUkFaMENnblZ4anNFOE9IUTF4enpiYytK?=
 =?utf-8?B?aEtwdDZVaTZYV1F1bjZxWnNNU281b3JOU09vWjJwanZkSVhwZGlldkNHMngz?=
 =?utf-8?B?MXE0U1luTkRrZCtla1lzTUNKdGE1UnhrVE1scmEyckVOWkZLL0NpZGo2N1pq?=
 =?utf-8?B?K0xwSU1HZU5TWmhLWDVsYjg4aXFXTVJJNHl0ZTRjTmZLbTY4Q1lwVG9qWHVm?=
 =?utf-8?B?ejRtM1RxcENWNDNhUURXY2Vnd2xrekUzbURRbTFYeXZmSTRrOEVXYUxLUkts?=
 =?utf-8?B?dTNxUk96dWR1ZXdrMTQzN292NTk3aHQzSjRGcHE0OUZ4d0pEejFXTVUvc2pj?=
 =?utf-8?B?cVU2cVpUYTZaNUV0RmNuczluMTk0Z0RrSW1WVEZLUjBNelYyby81cDg0YXJo?=
 =?utf-8?B?d3pWNkdxWVlnRGNTaCs4QnNpc21TOHJ0d1IzV1VRNEpBRytVcUFJT3ZXaFJD?=
 =?utf-8?B?TUJ1NWdvN0VvWU5SbHloS2hFVk9wYkhPNDdiTUhXMXd6T0tGOFpLUk1UcEM3?=
 =?utf-8?B?NFBUYWEvWXhvT0RXcW5ET3AvaXRKNzVRQUxvQmNYWDdON210Skd2OVpqVGF4?=
 =?utf-8?B?R0IyQTQ1WFYwTElhQmdsTk02N0ZFTkpMeTBTNUpneGczZ2lzdjV6ODBPUVZJ?=
 =?utf-8?B?bjE0VkY3R2JpK0xuWjFRajFtMXdEV29qcW1PY2JZQnQ2aGNPSVpRQkZhMkRO?=
 =?utf-8?B?OXRtNitCMTRDb0N6ekkzL1F4emtuanhtaVZ6K0ZiTzk1U3BWVHFrMjdBRVNr?=
 =?utf-8?B?RVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ee95d0-a640-433f-9dad-08dc1c9da05f
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 05:30:50.9017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HWoNUHsjITWXu5B7lMlNzbZ2gx5OebU8bB2H9mqK/EKbRhHYrSh09focC9ftjIyxqqRsWmp27ocmfNLXql5fBis5g2SSCHgvfHUkLzaVOjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6081
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

Hi Kunal,

On 23-01-2024 07:48 pm, Kunal Joshi wrote:
> Check if given psr mode can be enabled by reading enable_psr
> modparam
> 
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   lib/igt_psr.c | 23 +++++++++++++++++++++++
>   lib/igt_psr.h |  1 +
>   2 files changed, 24 insertions(+)
> 
> diff --git a/lib/igt_psr.c b/lib/igt_psr.c
> index 663bac163..181499cf7 100644
> --- a/lib/igt_psr.c
> +++ b/lib/igt_psr.c
> @@ -394,3 +394,26 @@ enum psr_mode psr_get_mode(int debugfs_fd)
>   
>   	return PSR_DISABLED;
>   }
> +
> +/**
> + * is_psr_enable_possible
> + * Check if given psr mode can be enabled by reading enable_psr
> + * modparam
> + *
> + * Returns:
> + * True if given psr mode can be enabled, false otherwise.
> + */
> +bool is_psr_enable_possible(int drm_fd, enum psr_mode mode)
> +{
> +	char *param_value;
> +	int enable_psr;
> +
> +	param_value = __igt_params_get(drm_fd, "enable_psr");
> +	if (!is_i915_device(drm_fd) && !param_value) {

Why do we need a driver check here?

> +		igt_info("Failed to retrieve module parameter enable_psr\n");
> +		return false;
> +	}
> +	enable_psr = atoi(param_value);

It may cause a segmentation fault, if the driver is i915 & param_value 
== NULL.

Hence, NACK to merge this patch.

- Bhanu

> +	free(param_value);
> +	return enable_psr > mode;
> +}
> diff --git a/lib/igt_psr.h b/lib/igt_psr.h
> index 36711c0d4..82a4e8c5e 100644
> --- a/lib/igt_psr.h
> +++ b/lib/igt_psr.h
> @@ -61,5 +61,6 @@ bool i915_psr2_selective_fetch_check(int drm_fd);
>   
>   bool i915_psr2_sel_fetch_to_psr1(int drm_fd);
>   void i915_psr2_sel_fetch_restore(int drm_fd);
> +bool is_psr_enable_possible(int drm_fd, enum psr_mode mode);
>   
>   #endif
