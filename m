Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86AAC54E58
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 12:53:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BD6E10E46F;
	Wed, 20 Mar 2024 12:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UbaJGxBB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDDF810E46F
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 12:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710939229; x=1742475229;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ql4PQ4xtTpD6qbg4XrqUQQiSGqiqn791ALuo/shH3ug=;
 b=UbaJGxBBh7oFc846RSHRl31MJIFA0jvI+EKrPgJxQtsRmq1Ol5t4TcbY
 /AOUNeLMF0DPhQHKK5yj01+RK93J9BU789M/Hie7W+k6b+U+pf93QjCKF
 BlXwPQ3G7NkKa1r4Cyf4WA5oMPE0lalQBCcS0z8SZNW1EPyeP+O6XlJxW
 JrM0Y2qcn8q2MyQ7GumppPsbxsFMGdYpZj9JY2MUhDCBMCBvZ32WDyAll
 ZIEdA8wfepoGXkeSt8EKSiUR9jowrqB0A5CQfglPBZ2qRo7dEUGTBWlnt
 kkOH4KWLLiKAJm3Y3mbLijkVo7pJDQkf2cctpl5+Yfn66b1ZyZ5Hnlp+/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5984192"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="5984192"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 05:53:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="18728032"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2024 05:53:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 05:53:42 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 05:53:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Mar 2024 05:53:42 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Mar 2024 05:53:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oz8971LG6rCJyiweWSWmuZLv2wVNSoYqMXlLK6NLMDzM8FmMd89Da1LkYkXpjnDUSCKjd3eVrCKVlkiwVEPb+lOI7p2byXtfrXXQH/Qj8OEkRzLVCOnbEDRnDMcTv8KR+2g3xTLUHcaPTYeov4wvgf0RbnPXhINhO+WDaOVbctLOQH2fEeGkVHP0ie2CYE8ZAze8R6FDm/qiQWnmM7AuYxg66vhfPGer8YaxnrLiC81yuMlFi22GObz1KZqYecPKwAtHkucycFfSEvUx0+XmF6KPhbKdmWbss4fHGetNBLuC/c1XffJS2LrEkrGuQ8aA4IhyNamlSi4pLupc/1QM+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vX7JzdgQ2fT8IWhQnicBNTz6c4EUNHuhrRa90n9K9mg=;
 b=MJSo5Q7j9pGvxRyYE0zbxNihFHVyJ1glxzS/73ZeQsvkTpB+OnNEbaBtSw6QVdqiw1nlSDHG0w/iCiGzBWwEoXZeln3IIYeRR74Cte8W67GoPVuPDePkgi1E5gYDtFUj4hFa3Cp0EBpV5wrkimSOT/WDu5Rmr2QfhGgWkfQELdT7y1AEMH+onBdpmvoFAsvsWp686Jb5xmgbYfnz55aL0JVpJ3nmRJAAO62As3IBB2iYEk2H4d69BYlHT7UheeuKBSB9+d0FUDd7f9BSRbHOxZ9+Sodeu7OZYXwWLQXcIcRV1K4kU0IHsT/LDCOaTV0DeuFFcvUB/tPVPklEPzdpOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SA1PR11MB5924.namprd11.prod.outlook.com (2603:10b6:806:23b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Wed, 20 Mar
 2024 12:53:40 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9%3]) with mapi id 15.20.7409.010; Wed, 20 Mar 2024
 12:53:40 +0000
Message-ID: <55d5762f-7ca5-453a-8d08-a34e89ad6350@intel.com>
Date: Wed, 20 Mar 2024 18:23:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/4] lib/igt_kms: add helper to enable/disable force
 joiner
Content-Language: en-US
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, Karthik B S
 <karthik.b.s@intel.com>, Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20240310142721.874315-1-kunal1.joshi@intel.com>
 <20240310142721.874315-4-kunal1.joshi@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240310142721.874315-4-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0159.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::14) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SA1PR11MB5924:EE_
X-MS-Office365-Filtering-Correlation-Id: d5c93ad7-b66d-4fbd-ea30-08dc48dcc41b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F2xOEOu2IPbXYnONm1IkcxjFUHx3lgNYUdyKQN64JVFqin15fGrFsSdAY2teyOoLIDmUbmDpguDoJmrNCKU5e3lHlAk3Sc+Q9jJ0FcUPtYAgZniirb5/h336EE/rET7J2P8swVqONsFEZu5FDo2Z+868xhdKQTYX0Z1a9dBFYHpGw0lUa7M2V7Xlc4WufpLVuz+cjtC7KppBJ8qqW9e3hB60MrwIqAxEx1m6Y1VT5JCxCOOs4irJBLOEqqcZcsycI/DHQRMHFKxwC7sq1TRUrdxavsuZ8buEoOvYTd3pNTzxCtZzOWwUFMTuuPRapIXSodBNJmOnbsdAkuEczEIAXZIRtMQb2kc8L/VLtyKkDdT38xoSgnhNfETYoCRCsqu5lzcn1pPs5TblE5gj55gkI8tZLm1XLv1601STnNXGHnhMOf6gNx7soSJboXpwtk9IT/nY5RhdkZS3jhcegTICJ5JxLNXY2dIexw8s/m66WioCUzfu7aMnPzAVYh8nRemAMm69wm20LDmjQXulpgAZRI+wH08DDYOFi0e5PTfjCYCAbiuFyUQuUouS/88BXPvL3rexovBJsszvDU/G6ont9+Pr5AVu1vdr20DNqKigd+lbSiSMYDMY3jEKaV6/huQrJ7fd4o7ru4+nxfGJ8MAdfl1D06rX5kiCec70vspemg4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUk0VW1PaVpreU1zLzI2eWxjelhtcFlZRDFGK2p4MEFUQmFMRUpxWkIxLzha?=
 =?utf-8?B?RzRhQ2w5b3RUeTVZU21yWHg3cWVob3I0cTBZdmYvMVM0UmZIN2ZIbWlucHFL?=
 =?utf-8?B?L2wxS1oxVkU0NEVqb1RxYkFqUFU2S2ZzMUNVY2RXT3lmMmpDem5SLzR1WVFr?=
 =?utf-8?B?K1d6Q2dzakNrS3dpTFFMSVRiUkl4a0VJYUNwSjIwVzB2V1JWdkJIclcyWWJE?=
 =?utf-8?B?Qml2MFlSTng0KytCUGtxUm9MQmlRVXZwUzhXOHF5V1gxL1RMUHlnOXBOak9v?=
 =?utf-8?B?SHdQRFl0c1QyWmpFa0ZLMUc5cUtiR0w3ZUpIc2lIVWxvV1p4T1dmUk4rYjhY?=
 =?utf-8?B?NHlKQzc1M1lHQ1F1dUZ2Y3dvWnJTYTExZzV2R1RUd1ZNdDJCeTBOc051RW1X?=
 =?utf-8?B?clVIbDdLdlJNbkx2OWRVNjlIdFhHRzRtdmJ1RzdIdTdFZ2dHRjlURHBHME5G?=
 =?utf-8?B?N2pmbVNpWnRJaXc3Y1dkWVRlL2JHYThMdkJScncyNlV2WCtSS3M0Q0QzeGo2?=
 =?utf-8?B?RldYL0pKSzlUTmxYTU00OTBTMDdzbW9za01VVWRrTW5yaG5XdjBjTHo3ZkFV?=
 =?utf-8?B?UkYrVUdTZjcwVXUvR3FkbERQSVg1ODEzR3hZdTN5VGNVVlpRa2xEK1c0Tita?=
 =?utf-8?B?MXhQODkyMUJraFhoQ3c3cmVuT0NKUTljNHZnVTBvWCt0UU16UzVXczRlUkVR?=
 =?utf-8?B?RTEyeHEvandkdUYrUnEvWExndGxiL0dMWit1TFJPaHY3ZFllVEhhaXZYanFF?=
 =?utf-8?B?NDE2dzB4U25Bd2ZETHdoK3gyQ2JEbU1INGVwczZWZHFpYTNWa0RoQXI4TEcy?=
 =?utf-8?B?WnBXUGNNMVVkRnZnZ283empRdVpTOElaUHhPSG13Sm5JRW5kRGpNUlV1d2ln?=
 =?utf-8?B?TzVnU24zWTFXbC91SngrMUZnWGNKYnFyTDIxR041V0RsSHlYcnhwQjhKNVZH?=
 =?utf-8?B?TzFWU2hsMTdqOUtucnVtMnhCMVlXRTJXQnBwT1ppQ3pNUnc5OVY4aXQzQkIz?=
 =?utf-8?B?dUtNYWxXZ1N5SmJTczRwWnRBbWdFclQ0dlJUa1UvSVEwekJwMjJyVG50dEZo?=
 =?utf-8?B?OWd4azduM1RGd2VUb1pOTXN6dm5sQlM5K3ZwNkFlWlYxUUhMQ09mRy9FN2N0?=
 =?utf-8?B?NFdtVGVEYVh5U2xrWDIzMHQ5UnJxeE5WQWEwQm1EeGcyVHBQbEVLUFI0TkJo?=
 =?utf-8?B?TDlnalBnWlYybTZjc292ZEgzbjBNVFlYcUwzd2RqbHZxM09HL1Q2WXh2WHp4?=
 =?utf-8?B?VUVxUks5L1QyYUlreWxld1RVWUxaUzZZVnAvUlRzRjNFeG5GU1JzZFRBaWw3?=
 =?utf-8?B?TXJsNTZwV1drWWVEbW92UnVTREFHcmlDVlZucXBCekNmYlIyZDkrUlVMS2U4?=
 =?utf-8?B?U3Q0MThkYkZ2L2x5MzRYVzloc241Y0tFVHlLTm5rMzJ2dU5kc0l6a25QcWk4?=
 =?utf-8?B?a3F1aUh0Q3loQXNkR0tnNlNjWm9TNGNVOWdJZlpwWWNVR0pEYXMxSk9GcER4?=
 =?utf-8?B?eUc3Tlg5d0MrenlXaWVKaGYwU09PRkdudGpCM1h1V08waFBUOEFoalcrYlY3?=
 =?utf-8?B?cUdCM2lQOVg5d005R0dyUHd4U1Y2UUV0UTRNQVFkYVFvbUpCQitBZUNsNmg4?=
 =?utf-8?B?N1lXKytveGE5VWt1UVU1cXl4eXdhczkrMzd2Mkg5dDdDSWZGRHkwaFk0RlU2?=
 =?utf-8?B?OUovS0pjbE9mbWY1WTZ3cE1uZE5HSnRZRDRuMWdLU0pXNVZhY2NWczEyN1M1?=
 =?utf-8?B?ZDZONU9aWDRYZllJUzl0MVE0aDlRaXhkd3NjNmFON2lHWjBrZUk3cUNOc1FV?=
 =?utf-8?B?NmtZYVFBTVhRanV5TngzdXIzNHhBbTVkd2d5NXlrRitPUk93aEFNYlBLa0VC?=
 =?utf-8?B?eUhHZGkxeDlCdVUrMkRFM0lGaHBTR0wvdjczcE9JbUtPWjI3c0RTNjBCc3k1?=
 =?utf-8?B?SDVsTlBWcWcrQlZSUjRSTUdzKzE1dkxxSXVPZ0NkRWN1TjFuVjdBOTBaM20v?=
 =?utf-8?B?VC9Ldi9GRDNkRFk3UGpGSjllSEJPWkNPTGZhemc0eFY2eWFzaTVEdDB1VWFu?=
 =?utf-8?B?b1VETFR6TnRDQ0lUOFNiRHBDVUxXb3I5ZXIzUTk3MjVxRE50TVA2MmFzMzRB?=
 =?utf-8?B?OTBNU0lBZVBITmpuZ1k5RGdpQy9UajIzUXp3amY1T1Z1Smx0bElwZlo0dU9T?=
 =?utf-8?B?YXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5c93ad7-b66d-4fbd-ea30-08dc48dcc41b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 12:53:40.0926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ZHKYB4AiZ7zEf+eZK3h1QE+HZQhrt/kjjHaXEMWvw0yzQznlKXtJ+8/v23W7euRS3lWO/LBx6dTbdwF1nrC51q6yUcyRJyT7Aq8BiVHkKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5924
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


On 3/10/2024 7:57 PM, Kunal Joshi wrote:
> add helpers to check whether force joiner debugfs exists
> and to enable/disable force joiner for a specific connector.
>
> Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   lib/igt_kms.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_kms.h |  2 ++
>   2 files changed, 61 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 63c8045c7..9d0cbd329 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6168,6 +6168,65 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   	return found;
>   }
>   
> +/**
> + * Checks if the force big joiner is enabled for a specific connector.
> + *
> + * @drmfd The file descriptor of the DRM device.
> + * @connector_name The name of the connector.

I think we dont need documentation for this, as this is straight forward 
and just static function which is called from one place.

> + * Returns:
> + *  true if status equals enable, false otherwise.
> + */
> +static bool igt_check_force_bigjoiner_status(int drmfd, char *connector_name, bool enable)
> +{
> +	char buf[512];
> +	int debugfs_fd, ret;
> +
> +	igt_assert_f(connector_name, "Connector name cannot be NULL\n");
> +	debugfs_fd = igt_debugfs_connector_dir(drmfd, connector_name, O_RDONLY);
> +	igt_assert_f(debugfs_fd >= 0, "Could not open debugfs for connector %s\n", connector_name);
> +	ret = igt_debugfs_simple_read(debugfs_fd, "i915_bigjoiner_force_enable", buf, sizeof(buf));
> +	close(debugfs_fd);
> +	igt_assert_f(ret > 0, "Could not read i915_bigjoiner_force_enable for connector %s\n", connector_name);
> +	return enable ? strstr(buf, "Bigjoiner enable: 1") :
> +					strstr(buf, "Bigjoiner enable: 0");
> +}
> +
> +bool has_force_joiner_debugfs(int drmfd, igt_output_t *output)

Since this helper is expected to be used in other tests, it would be 
good to have documentation for this.

Also, imho, it would be better to use igt_* for helpers, though we seem 
to be not following this strictly.


> +{
> +	char buf[512];
> +	int debugfs_fd, ret;
> +
> +	igt_assert_f(output->name, "Connector name cannot be NULL\n");
> +	debugfs_fd = igt_debugfs_connector_dir(drmfd, output->name, O_RDONLY);
> +	igt_assert_f(debugfs_fd >= 0, "Could not open debugfs for connector %s\n", output->name);

I think we should not assert here, this will fail for platforms that do 
not support bigjoiner. Perhaps returning false will be sufficient.


Regards,

Ankit

> +	ret = igt_debugfs_simple_read(debugfs_fd, "i915_bigjoiner_force_enable", buf, sizeof(buf));
> +	close(debugfs_fd);
> +	return ret >= 0;
> +}
> +
> +/**
> + * Forces the enable/disable state of big joiner for a specific connector.
> + *
> + * @drmfd The file descriptor of the DRM device.
> + * @connector_name The name of the connector.
> + * @enable The desired state of big joiner (true for enable, false for disable).
> + * Returns:
> + *  true on success, false otherwise.
> + */
> +bool igt_force_bigjoiner_enable(int drmfd, char *connector_name, bool enable)
> +{
> +	int debugfs_fd, ret;
> +
> +	igt_assert_f(connector_name, "Connector name cannot be NULL\n");
> +	debugfs_fd = igt_debugfs_connector_dir(drmfd, connector_name, O_DIRECTORY);
> +	igt_assert_f(debugfs_fd >= 0, "Could not open debugfs for connector %s\n", connector_name);
> +	ret = igt_sysfs_write(debugfs_fd, "i915_bigjoiner_force_enable", enable ? "1" : "0", 1);
> +	close(debugfs_fd);
> +	igt_assert_f(ret > 0, "Could not write i915_bigjoiner_force_enable for connector %s\n", connector_name);
> +
> +	return igt_check_force_bigjoiner_status(drmfd, connector_name, enable);
> +}
> +
>   /**
>    * igt_check_bigjoiner_support:
>    * @display: a pointer to an #igt_display_t structure
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index bab8487d3..f13b7fd53 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1214,6 +1214,8 @@ int igt_get_max_dotclock(int fd);
>   bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
>   bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   			  int max_dotclock);
> +bool has_force_joiner_debugfs(int drmfd, igt_output_t *output);
> +bool igt_force_bigjoiner_enable(int drmfd, char *connector_name, bool enable);
>   bool igt_check_bigjoiner_support(igt_display_t *display);
>   bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
>   bool intel_pipe_output_combo_valid(igt_display_t *display);
