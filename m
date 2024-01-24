Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602D2C46CD2
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jan 2024 07:45:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1EC210F687;
	Wed, 24 Jan 2024 07:45:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD41410F69C
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jan 2024 07:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706082307; x=1737618307;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xWCGyMAubRNHhe8ToQ8L3iVUAApIV3/DedeVlkrjq34=;
 b=fZ4fVwRAzpErP2ca6iYtUOHYa83mTvHPLZI1Ymp3fk6UuuDOlODN7MnR
 lzWu/wxhCL8cpNPh4QkfqA8YHq0fs3kC/53XDwI7yif9z1lQHV8F3pmdG
 B78yd5HcCb8Eo4RuI4Wd7JZUr1FZZjyEciH3X2Sxp2Vnr2Co4pXQmDxul
 ko4wTxcHsa6RpgRWyzcVEQkbQNiCIpWBCTFk9sGLbBh3bO3LYuAsLF64e
 s6upZNJcTomJ6z1vyUmC3qGzR7qy6rNZJMOH0RenTfiMCQZpHZv5cK2Al
 Lp3ryGNIp3Q5uUAYumPHc1je8P/XanYSV39eEJuYY9IFerEMi+4M6DM7n w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="392185309"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="392185309"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 23:45:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1819737"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2024 23:45:07 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 23:45:06 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 23:45:06 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 23:45:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7J/55rIdbt4mgoqeBELPYK4uZKix1eef9+I4+MMPXUq2FyZIGNoJFNji+vPomD48eeKqz9l5QuQr4ufpMThY9CfZzB+UCeihfioe1sN2puedNju4qecSOydGGh0P9RIOydoXo24DtH+cISxm3IE6Fe/EcwR43SpQC3pBB/Ix+BnDpQzWRRCnOp9PhwJahh+701AytiZbyi/Hw+zmcPy5v3d/SQFL23lHfLfWZMUWw6cxZWZGCpNtx6R1Mkv/OfNwGajdKmWvOXSxkSt/PG4Advs9y8d7Rxq5P5zW9kCEh50UnIMuN4tLcKXYq0btGOoVO8AXNdBjIU2cr+Tn+H0+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eh14YPygqHvnlHbTRraUjU1+aMnC+RK4wQbVxXdiRDw=;
 b=OJ6uHsodQhF+xskQufP0bwgtHvpBe6KeXbCUncvQS4sBfhJTvR46UYkEnsFUK3CrawUweBGbb3cYzekQf8n0nyZk5oTZTUR+nmG5tOzzA2BgWDe1FM8pwHO8cFMIhj4ua8ltc6e2xzW1eDPXFbDLYbb0bMyTqEvT1RtxM7uRMkJYzx24VyKDa2IGBRQrwAB2Cd1nktQEPzuizTrNX5K5b9aNi3pnA9TtDX5z68rVSbOGRKttTOHeFJ9SDv9R4grhpTx3MnnCAepjwBsQ8oVh4ak/ax5K/naEf5YE5LfgfLq/UVu9govWGKwSkpu3cu7MJar7299m3IB12BBBLy8piQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 MW4PR11MB8268.namprd11.prod.outlook.com (2603:10b6:303:1ef::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.34; Wed, 24 Jan 2024 07:45:03 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::ef1e:146:d198:adbb]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::ef1e:146:d198:adbb%3]) with mapi id 15.20.7202.035; Wed, 24 Jan 2024
 07:45:02 +0000
Message-ID: <4ae961b5-4389-4fa5-8351-a185c9d3d442@intel.com>
Date: Wed, 24 Jan 2024 13:14:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/igt_kms: add support to force big joiner
Content-Language: en-US
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20240118161847.1001234-1-kunal1.joshi@intel.com>
 <20240118161847.1001234-2-kunal1.joshi@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240118161847.1001234-2-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::27) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|MW4PR11MB8268:EE_
X-MS-Office365-Filtering-Correlation-Id: 257e7e01-8db0-4f31-281e-08dc1cb05fda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pGFpJV0B13onAHnaSAvnUJheCb31LXkXdwg0ps36LMtaTA3nSYMCFg4Iyxw6Zxu4Xsg+GZtc6ksx/jnnwyUs4Ol/BwjacFYBc44j0wi2NOlP8q8vF/Ymz107MzPX1Q0zcKuml7lXWjvWES0PqJ4Pj6sDGKaVT0AFGU6oITNf4ORtn5p+RK+ohNaeqdrZsmsS0vjxgfGmitGh7G0wSgxRIHz2vBhx/FQXnRCAcaxapthcvWnNzi0Xyd53LlVHjsrYioScBI/lU2+bMXnsQbL6mA4LBP3UceprwYPxiQlPx0AdQt9LZmkIegTixd1PviqLy5xT3HmP7F4XsfYHlA/nh1urNyQCobqkvrgiWvx0jC4Sxgu9tgOg9u6MQos+eM4lhhJqKDPteQM8KILr1QCUNPKzaB6zi6YtdX6qzOjlHpLk2axpAC6mg+k/nVwBR9SyGtAohAXGeMuOOWODGCh7Daqy8TQnhBMqPQK3MK6927rMAb5f6C/oW2QMsTZo6tkcWX+1OhwG0t0Kvj1bwyf7sTvbJiXnLzInWqbBtjZEdMnPzZTxXl27IodalG26nllasdSFQnMj0aycSsNRE0x/Yc0Hr02LpX4PPHUSi2oJdGpBiuD5vm4uATZOBwJhbwigMQkxdnsOyzuCedh+uBN+cg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(376002)(396003)(39860400002)(346002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(53546011)(6506007)(26005)(83380400001)(2616005)(6512007)(41300700001)(8676002)(8936002)(31696002)(36756003)(316002)(2906002)(54906003)(5660300002)(66946007)(66556008)(107886003)(66476007)(86362001)(4326008)(6666004)(6486002)(478600001)(82960400001)(31686004)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVRJcG1pdGpseXJYcWE1OEFYQTdlN1VnZlhaQ2NzMS8wWDNhSUlnZ252ZXRC?=
 =?utf-8?B?Y1NKbExMZk1wTVJhT1BaVnZFOTVTNStUYmI3UlJWams3RENQQ09VTnNFUUF4?=
 =?utf-8?B?V0JzTWJza2RYNGpOQ1p2dVlhQS9EMkF6OU5jMkc1MWRFTVRzSU1LZyt6TFNS?=
 =?utf-8?B?MG11Z2p1RE1aVmdQRmU4cHRya0IxeVN2WlE1NmhUT1VwUkxBYmN2VTRuWEpk?=
 =?utf-8?B?bnJoSVlhWUk2Slp6ODBOL3NucFovZGFuM3U4SHBtTWFQNm8zMXNNVVcvOVlT?=
 =?utf-8?B?MGNiY3cra3J4TUk4VFhtclR1aVpQTDdxdlRTSmlyQzhLcGp0U3FFYncwdm1i?=
 =?utf-8?B?U3dvRXZ1NGd1KytSS0d0bk45Vy9FMTVFYzVtRUxpK1hEQXRSWkhKTm5vTlRH?=
 =?utf-8?B?cTZhZFM5djgrS214bmptK2tpUnpXNTN3cjdnTHhTcVA5cTRTeE5hUGlPamZk?=
 =?utf-8?B?eGdHaTNpYjBZSWxPZSsvK2xiZW4rRHpudjkySlVxMU1IN2lTT3pTdkIyT2ZG?=
 =?utf-8?B?Y1hzQnBmNGducDIreHAxK3FaSjFMaVFDc3JBUnN1L200U1pvYS8rZExhV29C?=
 =?utf-8?B?b0NJVzJlenlhUzZWK3FmRXVXSXRTR2piM0k0d3ZPZUJqTGpOVkdXdXVtL3d2?=
 =?utf-8?B?bkNEanNGdmE0QTV0N2RGTkRDSSt0WmNTRXFFZUFqMlpDUXd1eUl0aVN3TGcz?=
 =?utf-8?B?UC90MVhiVFNBajl4eHJKTG15cCtYeVArdXlqRnpCSkR1U3JvNHhUMm5UY3Z1?=
 =?utf-8?B?aElCUFZBVTVFbGE0akNiOHdiZlhGck5iMkZrczE0eWFzWE9pVkpzUXBMdzYw?=
 =?utf-8?B?L1FFaTVUMGlvSUc3NmVqczRRbCtXWnQvaXZjbnkxZ0RxOERHdFFSNGRjbFdl?=
 =?utf-8?B?OVNNRS9DaE1hWjRGTGJ5NWpid0pFV3pSWC9tZVJWR2RUV0k0NXhCSE1yVVhl?=
 =?utf-8?B?S0xBSlZHQTFzc2RaczhOSGZqdU9SYnlRakg3WTJTRGxWMjlOMG44YXBneTRF?=
 =?utf-8?B?U0ozeWU0Sm1YMWRWVjZjeFhON3ZtRFVwTnM5TmI5WWs1WXF5WjMvd3lqNE01?=
 =?utf-8?B?eVZ0TDBtd2RDRnFqNlFZeGEvcDFvcG04bjBOR3ppa0NscUNPUCtnaGtPWW9E?=
 =?utf-8?B?YUFhaUNOUkNzVndTNmNPNi9FM3N0dUxhWVJnQWlvVkJINHJ0VmJCazdNQmcy?=
 =?utf-8?B?UnBsSDE1OHJHZERyYkxvUCt5QlYzUkRpb1h1VVI2aGZ4b3FCem16ZnVNNWpw?=
 =?utf-8?B?THdNa2Nvc1lHUGc0SGRRVlA2VFRiZFM0QnVQa2V5WDhjS1ZyRGh5VUFLMTRN?=
 =?utf-8?B?Y1E5dkR2SmVzY21hVTJjR0gwNndVc2RiRjVBczg4Y1ZQeWRsUnZJYUVpbzU0?=
 =?utf-8?B?dFhpbmJXbEZFUnNUcEtJRmdvY0xQY0FhTDNWeGhKQis0WlpHQzdiSTVsYnRp?=
 =?utf-8?B?QnJLcUJTOGd3WTlVa2pEeGtnakZVeStnQUxvdGdPck1qWGtvSjdpWTY1am9P?=
 =?utf-8?B?Vkl3ZGlzMTcxcnJOc1pkanBZNWhxb29La29lQjZEL0dIazZQcjkrRlFoa1Jn?=
 =?utf-8?B?ZFBySFNrUXlVZnVYdTBqSEwzRnRCVWdRZHFqK2lET1BhUktvb0hudnROYVFp?=
 =?utf-8?B?c1V4OHFOMWNBd1BKT1ZKbzJ6THYrb2lVaFRla3ZmYTVCcmdNMXJETmhCYVIr?=
 =?utf-8?B?NVFnQVV2dUJYSmllRHVCeGRKSWNxeGwzbDZoci9XK1lzVnBHQXJxL21NRE83?=
 =?utf-8?B?cURhVno2RmdjUG5NQTBVMTR4ZVpibTNGZ3V4ano2dWhndHM1aTdDa0hXL1c0?=
 =?utf-8?B?R1pJbllMT3R3UVRaZ2hhMVBFYTlKbnh4RkxZQ25EUWNpR21nR29IdUZERGlX?=
 =?utf-8?B?eXNxWlZ1T09vdENXL0JlWTJEbk1Kb1hVTVVEaEtIdjVxTnR0Q2gzZWpmZjMy?=
 =?utf-8?B?UnNQK1k4Z2V0K0lXWTY3amNyY29BZEhzTmg5UE1DUUtWMTdkY0lxUm1xMUNq?=
 =?utf-8?B?blpWR05zVVdZelhydldHODRyMmNYZTlvRXkvOG1xcUFWaUVFVThreUJ4YTZo?=
 =?utf-8?B?amNtbGh5a2RYNEIzbWs0NGthcndtSGc3bU5HWHd1UXlqSVpMNkI2ZHJuSTdt?=
 =?utf-8?B?d1RJak9nZC9SekFGc1Nzc3N1R3BROSt5Yk1EaExxckxUYVkxOUhUak9nR01S?=
 =?utf-8?B?Nnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 257e7e01-8db0-4f31-281e-08dc1cb05fda
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 07:45:02.8863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: afIhRYXojPu/uJ0aWg5RSi1HuxBzsdBlHG1zNX2eQyHagPdvf9YDDBDId7cm9gik8l3xgUtkDse+B7VKQ166G53jBpZzSnhi2JuSq/vLg5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8268
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

On 18-01-2024 09:48 pm, Kunal Joshi wrote:
> add helpers to enable/disable force joiner on a given connector
> and check status for a given connector
> 
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   lib/igt_kms.c | 54 +++++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_kms.h |  2 ++
>   2 files changed, 56 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index e4dea1a60..ad815d1b7 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6217,6 +6217,60 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>   	return true;
>   }
>   
> +/**
> + * Checks if the force big joiner is enabled for a specific connector.
> + *
> + * @param drmfd The file descriptor of the DRM device.
> + * @param connector_name The name of the connector.
> + * Returns:
> + *  1 if the force big joiner is enabled, 0 if disabled, and -1 on error.
> + */
> +int igt_check_force_bigjoiner_status(int drmfd, char *connector_name)

IMHO, we need to use this helper as a bool.
Return true if the force bigjoiner is enabled else false (even if there 
is no debugfs).

> +{
> +	char file_name[128] = {0};
> +	char buf[512];
> +	int ret;
> +	int debugfs_fd = igt_debugfs_dir(drmfd);

We can get the connector debugfs dir as igt_debugfs_connector_dir(), 
then we can avoid below sprintf().

> +
> +	sprintf(file_name, "%s/i915_bigjoiner_force_enable", connector_name);
> +	ret = igt_debugfs_simple_read(debugfs_fd, file_name, buf, sizeof(buf));
> +        if (ret < 0) {
> +                igt_info("Could not read %s: %s\n",
> +                         file_name, strerror(-ret));
> +                return -1;
> +        }

Please fix the indentation.

> +	if (strstr(buf, "Bigjoiner enable: 1"))
> +		return 1;
> +	else if (strstr(buf, "Bigjoiner enable: 0"))
> +		return 0;
> +	else
> +		return -1;
> +}
> +
> +/**
> + * Forces the enable/disable state of big joiner for a specific connector.
> + * This function allows the user to force the enable/disable state of
> + * big joiner for a specific connector.
> + *
> + * @param drmfd The file descriptor of the DRM device.
> + * @param connector_name The name of the connector.
> + * @param enable The desired state of big joiner (true for enable, false for disable).
> + * Returns:
> + *  >=0 on success, otherwise an error code.
> + */
> +int igt_force_bigjoiner_enable(int drmfd, char *connector_name, bool enable)
> +{
> +	int debugfs_fd = igt_debugfs_dir(drmfd);

Please read above comments.

- Bhanu

> +	int len = enable ? 1 : 0;
> +	int ret;
> +	char file_path[128] = {0};
> +
> +	sprintf(file_path, "%s/i915_bigjoiner_force_enable", connector_name);
> +	ret = igt_sysfs_write(debugfs_fd, file_path, enable ? "1" : "0", len);
> +	close(debugfs_fd);
> +	return ret;
> +}
> +
>   /**
>    * igt_parse_mode_string:
>    * @mode_string: modeline string
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index b3882808b..5f2fd5fbf 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1213,6 +1213,8 @@ bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
>   int igt_get_max_dotclock(int fd);
>   bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
>   bool igt_check_bigjoiner_support(igt_display_t *display);
> +int igt_check_force_bigjoiner_status(int drmfd, char *connector_name);
> +int igt_force_bigjoiner_enable(int drmfd, char *connector_name, bool enable);
>   bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
>   bool intel_pipe_output_combo_valid(igt_display_t *display);
>   bool igt_check_output_is_dp_mst(igt_output_t *output);
