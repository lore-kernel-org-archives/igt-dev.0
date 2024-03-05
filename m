Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128C5C54798
	for <igt-dev@archiver.kernel.org>; Tue,  5 Mar 2024 11:44:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9746F10E489;
	Tue,  5 Mar 2024 11:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gzrIyCib";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7791A10E354
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Mar 2024 11:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709639094; x=1741175094;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kEhqqFTjZfHwbOC/khm8sHw1zxADgLutG3H5YgROC8Y=;
 b=gzrIyCibFOyrD8kcUfeLRQRzjWpO45zx0UO3kdSMXOPMYFo101iwCcq6
 VrL1ESYcUN2+3Vhrfxt1Idl0ynqtQTFcTVLhrWFIX6Qeed+znc3qGZOmS
 6FqjP5XjhaZLquYMP6tQMgmLtUMdQqNbt4AzQiftgKXyktJtAc+FBwB7v
 8ncBfodvHTLnP1TfgjRkjG4QfjzbQLMgL/3G6N+jwhR/R8G75/Pbv7Fux
 teb3TVfC3fbKcqolrvaxQBvclHp8YZ0WzbiFX2qO2wgGRQAZ7R2i7F7Tb
 8+E3ViHrZhyLTsZ2VhzYFsA7UqODzxMlDBTxAH5nk61+A9L4yyjJaqr1O Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4042266"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4042266"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 03:44:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9214994"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Mar 2024 03:44:54 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 03:44:53 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Mar 2024 03:44:53 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Mar 2024 03:44:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hsmFIRT/wHJRQJHpWhhZD/SM0kahHuViuBh1Q026zE5leKbUsvEm+YdPZ959QXSV4LfWCGBi7qLVw6WC0O3bBV+oI312Eh938M2KsRkZDXAdYLjO9m0P7iX3SmM4s7hiIu9774XQL7WdV1pXKcch57/uB2Q3rraVgrjT5twyPy3VgthMPDnHs2DiJSu7csRZyf3gRN7v2Wx8fDxWj7jBwn1Jt2YW2bL/w6yTXZp0s6DLaD+073Lzil2nBa1KWDUrR+5uNCbuoJcME/0UWAD+of1W4xJdzlzv8fB3BTA47hilK0YXklH8uIOD41BL/bgqAIAQDIO3T+XT0e6PAUyglA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PJWp5HZlMvROFMb76dcXoMdcrgYqrOgOMrkGSA7Y9zU=;
 b=gxvTXKqN/kpoVF+oJbLPtsLwtHJWH0HE3DDgbXpI9ae1Yip+ewaUh4Ec8+wF+b7AmV78IqFyUy238ISCn0l5EZ90IqJRb4eCfwTLIBQoBRgLf2RyrA/xEPAd/FzyUXMl1f7C6w35N3g8kb4Iijq8zv1SO/Mrf44alLX2nfs0EgozH1dVZiSfwiz7lYLgrv0JkerASI0yit3EPl7oev2IyaP8rovlx2k6wOxWvbLSxExojXbHUhmH+ji4irrKganoZ74dwZHnDT0+909oRI46c8/n6uEhqgfFdj+guuFLsudRAnUJld2y3E+LpNDYz1hm1hg1hQCO9BrHV4niLkrHBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 DS0PR11MB6326.namprd11.prod.outlook.com (2603:10b6:8:ce::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7362.23; Tue, 5 Mar 2024 11:44:51 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::e763:85a4:b747:67b2]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::e763:85a4:b747:67b2%6]) with mapi id 15.20.7362.019; Tue, 5 Mar 2024
 11:44:51 +0000
Message-ID: <3919e872-a25b-425c-b467-ac340f0999f0@intel.com>
Date: Tue, 5 Mar 2024 17:14:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/4] lib/igt_kms: add helpers to enable/disable
 force joiner
Content-Language: en-US
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Karthik B S <karthik.b.s@intel.com>
References: <20240303172216.254535-1-kunal1.joshi@intel.com>
 <20240303172216.254535-3-kunal1.joshi@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240303172216.254535-3-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::22) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|DS0PR11MB6326:EE_
X-MS-Office365-Filtering-Correlation-Id: 04d20da5-3500-4597-452a-08dc3d09aaf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1NiG6a56dguwGIoTEuEwZsO50s+XVKxFsOHtXUaeqPqAXHo7u3kgd0EnogKjlTohe+hjiKwc8j2KPtsx1uikNF92O9WZFIYpIfoehTha+/Pv49bGj0VezlT4I8VvJA3TVB7y8Vo4pj2EoJfPTUPjHTXtpifKG0/OlqpcAh4URNSTrAa+lVJQSVvSZMOlG0vRFEEoOydsAqdWhOCcZN3ouZjogNr4XEHAmFhlkT8jmoa6y8bmcSivZeYNrhzLMfh/urfsDz2VJFePqqKEh5oo72wXimAAk71XdCdXc8kGi6xdXeo6xT0jHb/SOLmbx3DS9KNN4vj/SJEqToALfgij8HRhaWcw2hGmhwKk+YwBB7Z21OaGBH+Cl7hjmXhe6lYIsjGfQk7uAfTLjAJJ97a4CfE1KwgZtEaglXKOqDej9FOrBWbwRZ6+gQCNPxtpdm0RL+SS/zmC0M57hileFTVrDTimyfw5wPWx46e5rL7qJMC8pbPieEIXAcTDtGii3Be+bW0ETlZwXHx7yB+QTd8mEs0d2WzYkiFIkMPwD7OL6B5zVaD+PSCIjfh/oE5M4hS2V25V/U98OHasHx7ReW6YaCsx8LBOJa8PwGeJDt1lNup3qgWbnbutfuvNFL4mlpGghs5lgb8S7+pHeXkNQEXtQ4sp1KCNDkWUE+5L0IsOLCM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFhtQlE5SW5HQ1Z1SkpmdEVDNDdxbmdtZE1lcFI2cDFFR0cvUDB1UGc1enNK?=
 =?utf-8?B?M3h2RDByTFltTEduUVE3eWUrOTRmVUFZMFo0Zy9tMmRxOHZXdEVTZXp3Y2kr?=
 =?utf-8?B?VFNkZzc3ZFh5Zm5WaEx0OVVwcnJ0V05teWZsRUh0dHp3Q1VFa0p4TUJVQXI3?=
 =?utf-8?B?enZ6cXhETWllc0xNTStBT2pLdjNQMzI3dzlBeGpxNTlBNm9aU0pzS3drZk9q?=
 =?utf-8?B?U1NYV0tKaEpWYTErTm5sYlBHditqVW12MGh5bytxbmxRcDJ4TzliTGdvOVAx?=
 =?utf-8?B?OHMyQnR4MlhWUXM2WHl3K0FzZm9qTkJDUGFWWStpMkwra0lqZkw4SWt3VDN2?=
 =?utf-8?B?Z1YzRW1nTnRyeHh6VDcvaitrd1NEM2pjNlhHRG10ckEyRDFxTG1JLzZDUm9F?=
 =?utf-8?B?WHZnMnBaeGJUd1JKK294dUg5dmZGTDVIdE9pbzRtaGlzNW9IN1lyODgvWFVk?=
 =?utf-8?B?bUZ2SnlZTDZJaVo4NFNreThobHdzZFN1RW1nZnFHL01yV0pqbld1dlJqU1c4?=
 =?utf-8?B?d3FIS2VSTjBJakRZcnQ0dmM3K0NQNk1WWkJha0VnUjQrOFZsZE0zNjU4Zyty?=
 =?utf-8?B?UXV0WDBzZkVYWW90L3M4THB2bks0OVcrM2xoQlRka1BVRHMxWFVWVEFUYWtC?=
 =?utf-8?B?TnRkTlNDenZ5Q2xYRHJtS0wrWVJna3A3STBSUVp1UGovRWU4SlJ1YnVobGV5?=
 =?utf-8?B?K2xwVm9vN290Ynl2RVpVQVVVZVNFcW44T1daMkJyY293SGhCOG55RDVrQ0tz?=
 =?utf-8?B?by9vUTQwTVo0Tml1TE03ZVFQZ1c5azJuNnV5OFRaWlZTUmYwVmdvVGFpOC93?=
 =?utf-8?B?Q1pCVkhJN1dUZi9CdnZzeUhnV2p2MUxCWjExMHh4ZE8vbHVpZnV3ZWZ0M3Rn?=
 =?utf-8?B?ampiWGlmcmh5bGxxZFpPT0l1bWt4L0dxSEY3Tk9RMVpHYWswUkNTdmMrWTRG?=
 =?utf-8?B?MnphTGlJLzIyV1F5SUE2YTRIQUxFRG5JdXFFaWp1b0FNMkJtRndXRDFSKzJY?=
 =?utf-8?B?d3pudVkyVnhoODAzU3RxMFJrTVhtdEFLVU1icXo0UTZkdnduYSt0TjlKVTdJ?=
 =?utf-8?B?V08rRGFnZjlrKzlob1djK2JHY3JuSXNoRS80OXhBZjF0RXhZSFBYYXBEM2lS?=
 =?utf-8?B?TWE4U1QyZW5oMXFXbksrWGt6L2pVZHQzMU9OWUJ2cWk3bWlPVUtCQ01HalBQ?=
 =?utf-8?B?QVpHRTQrWTJYWXRhdmVPeWF4UlRPSUVDQW5EblR4V0RnZXBickRKQzcxSUFv?=
 =?utf-8?B?MXNhSVhMVENZYnlaM0o4R0tZWkVTKzhuWW5DZ01FMUxzb2J3TVhFQzNSUW4w?=
 =?utf-8?B?cU9TRyt2aFp1c2s3TzNBQyt1VDRaV2FkYXpHMDhEVXZ1ZSsvelUvcER2TXpr?=
 =?utf-8?B?MEdjeGpMTlFYNGNEOGt3YlBrM0dvME04ZEN4dHhQYUtqUHA1bWxiWEdEUmR5?=
 =?utf-8?B?azQraUZOUXJpZFBaOU9sd0MzMTBGOU5sM0YyZTRmaGZPNHE3YmpqdVdOQXc5?=
 =?utf-8?B?K2tUU1lGdGNyekdpNDJ0ZG9QWllhdkoxelpyS1FJNC96aGh6V3VVM1htLy9p?=
 =?utf-8?B?NnFEVkdJaHE1NnBueHJObzk4TTZDZW0xU1RRdVE5Mi9mdnRDZGJVdjVSSkZK?=
 =?utf-8?B?aW9DYVUxZEdUTWF1UGpxVWRiMDZ6d09TTmFwTXJqTzVUV0lxdzdWTlpjeW02?=
 =?utf-8?B?aWR4YW5kSkV3TGhubzNzR1d3akpaMjVlN29TN3BQN3l1Z3dQejA3Z1ZsSWtF?=
 =?utf-8?B?N0kwSzV1SDhuck1CWWVCV0twdm44NmluSEpFTEJDQ3dzOUhDbmxERGVvVEFV?=
 =?utf-8?B?RjVpczJOOWRTZTVreFlIckJ6VDh2UzFUaU1hd3gxWEpmd3hrWjB3UE9zeXRi?=
 =?utf-8?B?ck9FSVcyb2lTVERrSE00dTNpeUZ2dHRMTTlneS92MFpDZXhEeGNkc2hFUU9M?=
 =?utf-8?B?dlg2cWFoZndkbU9lSXd2cDZrd2FEZHZFUzdzQVp3NDZFNHJBc3VvQnd1Qy9P?=
 =?utf-8?B?c1FsUW1yc01YRVRlNW1xejIwRFl3YnloWVhmVW5JQ3I3dGZhSloxaXFFZEtG?=
 =?utf-8?B?QWNJSXZIMndzOVJSdHdwZVRVMmZWUjZ3OEFmcGVJN25VR1BOOEhScFB1NUNH?=
 =?utf-8?B?aFhpVVI4MVdyUFpCcG5iUFMwQ0lGTTM2Q2w5MjRadE5RUjBKbEZ1cVpXMlA5?=
 =?utf-8?B?ZWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d20da5-3500-4597-452a-08dc3d09aaf8
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 11:44:51.3582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u8Oy/4LOzsfoiv9wMK8aMCrPJxjHzhyxSOYs62wONDBmCFCKAwJiQhkglE2Nj9IzsGg/7zKGCMa2ZbW4LeuvGlcMUmA6RF4e7z/7wcncdTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6326
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

On 03-03-2024 10:52 pm, Kunal Joshi wrote:
> add helped to enable/disable force joiner and for
> checking current state enabled/disabled
> 
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   lib/igt_kms.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_kms.h |  2 ++
>   2 files changed, 50 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 89956b9d5..e6952f56a 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6242,6 +6242,54 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
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
> +{
> +	char buf[512];
> +	int debugfs_fd, ret;
> +
> +	debugfs_fd = igt_debugfs_connector_dir(drmfd, connector_name, O_RDONLY);

We must guard "debugfs_fd" with igt_assert() or igt_require().

> +	ret = igt_debugfs_simple_read(debugfs_fd, "i915_bigjoiner_force_enable",
> +								  buf, sizeof(buf));
> +	if (ret < 0) {
> +		igt_info("Could not read debugfs %s\n",
> +				 strerror(-ret));
> +		return -1;
> +	}
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
> + *
> + * @param drmfd The file descriptor of the DRM device.
> + * @param connector_name The name of the connector.
> + * @param enable The desired state of big joiner (true for enable, false for disable).
> + * Returns:
> + *  >=0 on success, otherwise an error code.

IMHO, let's make return value as bool. Return True if write success else 
False.

> + */
> +int igt_force_bigjoiner_enable(int drmfd, char *connector_name, bool enable)
> +{
> +	int debugfs_fd, ret;
> +
> +	debugfs_fd = igt_debugfs_connector_dir(drmfd, connector_name, O_DIRECTORY);
----------------------------------------------------------------------^
This could be O_RDWR or O_WRONLY?

- Bhanu

> +	ret = igt_sysfs_write(debugfs_fd, "i915_bigjoiner_force_enable", enable ? "1" : "0", 1);
> +	close(debugfs_fd);
> +	return ret;
> +}
> +
>   /**
>    * igt_parse_mode_string:
>    * @mode_string: modeline string
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index bab8487d3..b28022db4 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1215,6 +1215,8 @@ bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
>   bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   			  int max_dotclock);
>   bool igt_check_bigjoiner_support(igt_display_t *display);
> +int igt_check_force_bigjoiner_status(int drmfd, char *connector_name);
> +int igt_force_bigjoiner_enable(int drmfd, char *connector_name, bool enable);
>   bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
>   bool intel_pipe_output_combo_valid(igt_display_t *display);
>   bool igt_check_output_is_dp_mst(igt_output_t *output);
