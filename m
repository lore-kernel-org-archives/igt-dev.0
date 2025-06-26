Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D8AC77B7F
	for <igt-dev@archiver.kernel.org>; Thu, 26 Jun 2025 08:42:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F08410E88B;
	Thu, 26 Jun 2025 08:42:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mCuLYxxU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E1E10E88B
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Jun 2025 08:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750927353; x=1782463353;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=P1SEDvkLzRJBpXY6q2ViOf1IeTP1Nov2IAjIwKwiv9o=;
 b=mCuLYxxU5c9fXtCzF/rK3tpHTlxiYjUz2HVnjy54JNH8FCnHZFXRj8Zt
 Y9IAZDY9n0WUxN6lOG31pWuzL6MuSaGfSIrDPCD4zcfP6GuS3pSFlk89x
 YWUmJTEmEnWHhwhkQLEZx2A6Xo29f+bMHskv3t8SyGi2OGKFuVVsiRSvu
 W+OaJdCM4yL6UZSKhWNkBY/pWna7Onlcc+wlV+doesENgofwgZShRt6dr
 Xvyhd0loEAgXYDAEgeH7u6KwOFBZfwvaCB30viispG42ua+rzCAinORgH
 iBECPZKpHvGTm5FwaEYyw5frf/2kLAuM9Yl/YhojCI1vINnGNmf4oDG2M Q==;
X-CSE-ConnectionGUID: kSDrbGHHS0up433lme0YkA==
X-CSE-MsgGUID: v22HB+WcRyKN0WZrPuW1LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53358046"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="53358046"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 01:42:33 -0700
X-CSE-ConnectionGUID: T13ff0jdSLOK3h+hntgmiw==
X-CSE-MsgGUID: JcI2eM2mQZKl+RyDvwLAvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="153185745"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 01:42:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 01:42:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 01:42:32 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.49)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 01:42:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iVn5HugYW6TTPYhvn88epkZgKQx0szpn9ERzodGtlKu2Hedt2dbilM0hJVAtammvd70qxvrlY+EPiG7pYlnZDdwq5ZOkN/Kl8ycE+2wUQJX5P6/Q+Onhd9oJieS4zzPPfgTxWWvMcVo3YH3CpPQJWEBsfa0exJbKHqUSZ7K/FDuxKJBjuzXBmvFL/N14wfxQAoAYvB6OxuSZWMl9oK+z+q5OROE+rIb4yafo4KiI5q3wpdd9IBBzTJYDxNSXCrg3jExfXKtTMfIfRH4UauZ7RE6DgiKhGP1rHqPUAxzvbHlT2uc4Potbay8tePpIvHVtEWbtf/YWKYJPwFR0aMhejg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mTEFDpwIjFPmMwKLo3nlzf+jF1C8S9df8yvkXkJqOHI=;
 b=nZzi50i1seh9icoxvJg6a1ZFVUdWEtKgbzgUdG3nIB5UNIGjxx0ShQirofP6ILL3V/mLXNJKR/hmT0l4Gs2BLPj6XoBwr52e2GN3zDaILjvikOyYK+ZMAnnQFU2Y5M3DeBnfPHRp+01DNrN0ts9BcWveoL681pquUqaFcxTAMDpdKqvcsHaQMDo5fMj/DeDB96KH9ZhMzFJT74yI3s3/dECqoPwDIKP94ZFdnM40ukHNm4VfXnWiTmkK822QJf+7ETWsVa+/q/4hViq9LTVqPVXQPoLzk5r9zaLrqtiG4vJWfXFIZb/p29OxvL7xLB9UDBf4lVDuuq842Urm//BzyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by CH3PR11MB8519.namprd11.prod.outlook.com (2603:10b6:610:1ba::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Thu, 26 Jun
 2025 08:42:31 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 08:42:30 +0000
Message-ID: <12109e61-cca6-460d-abc1-a5d85f0b9b2e@intel.com>
Date: Thu, 26 Jun 2025 14:12:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v15 3/5] tests/kms_async_flips: Add test for all
 async format modifiers
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <arun.r.murthy@intel.com>, <chaitanya.kumar.borah@intel.com>
References: <20250623110918.606014-1-santhosh.reddy.guddati@intel.com>
 <20250623110918.606014-4-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250623110918.606014-4-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0106.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::16) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|CH3PR11MB8519:EE_
X-MS-Office365-Filtering-Correlation-Id: a5cd7249-3c70-446c-4968-08ddb48d6320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHpBOUx3UlRKTmhPRUVJblNaanlrRE1Sejd4VHdudEJkemNSaWJIOGQ4dDR3?=
 =?utf-8?B?ZWNNeEFiNHBaS2VvbStocmtXL0lNWWROS0JrdytFMHV3eHVKOGM2K3czbkpE?=
 =?utf-8?B?eU1KNEhFaFlSNGFVaGdWSEd2dGExWDVZMExCOW5qbWc2NzdrdkJMaWd1RUxp?=
 =?utf-8?B?YlJjaVdFZEZqdXNuUVNCbFhDWnJaOFRrNnVNZUF4NHdnUHBFRjN1dnNwdDBx?=
 =?utf-8?B?R25yMlpETXkyWW9rN1RDODVHLy9jL3c2NEJXTndoc1VoREtaeHNvZ0hNYnZO?=
 =?utf-8?B?S0hkSHZxdWVFQjBKWnI0RUZlc2loNU5hRmFUMVl3bmdkbVozYzkrQ1BaVS9k?=
 =?utf-8?B?UDdxMWREQitiODN2dEdydGM2QkVod3lvVEl5MHpwbCtvU215bGMrQStodHRw?=
 =?utf-8?B?UjgvWEJQdXNhT1ZOaG5wLzh5bzBvbTZjMUVKcDkrZ3dIYXJISDM1UTU5UVRa?=
 =?utf-8?B?cWZwWDBsd0M3RnMzTFlRdUlSRFZ4bExTUU9VWk90YXduSHcrNFE0TEtlSThj?=
 =?utf-8?B?RjNvUFB2SDE4K0pIOXhIS3ZBTWxCT2xIRXZ0S2hYTmRvTHUyZit6dEtkUFZy?=
 =?utf-8?B?NHNZY045amFkZ21hd3pvdjg0Tk1IcGVhbnpwbWlISDl2Q1ZkTUJUSW0vR1Qz?=
 =?utf-8?B?aThEL2ZNNStzNFFtbXRjS3JuaWV0ODlGZ3oyYllaODBydXJYL3k2VWZnZG55?=
 =?utf-8?B?TWczYStBajlrT29TUSszMUFaL3V4TWNuZHdtSmFtMEZYT1FTeGc5czNnV2xC?=
 =?utf-8?B?Um9ONlJZWjAxZm9IbG9oVkJaREswWHBFQlo5VEwrRHZTdWxoQUh5NjZRKzc3?=
 =?utf-8?B?OUFSbkd2a1NuVHBKZHVlRTVhcStBb1NIbFNJb294d25mekpIbDVOei82YjJW?=
 =?utf-8?B?Z21QaWQ4c1d2dGI3SjJsUnJ2dkhYV1BJTzFUajZGdEYrSnBkdzdUT3VuRW00?=
 =?utf-8?B?YmxUL25sL3BUUWJsY1FPdHdUMnRZWTVqalRRczc4TlVYVCt6M1VHYU9ueGhV?=
 =?utf-8?B?UEQ1K2FDL2tiSDY4VHFSWWc1bG5FY1g5SzNzdHcvanBBak56M0IwWkVBazNk?=
 =?utf-8?B?ZFRqZGthV1FNZ3RWU2dQTEcvRXdRUi9DTGpqb0lLeG5lRDdBbUVnZWU1QnhN?=
 =?utf-8?B?U2NjL2ExaXlBTjI1cTZpbUNZS3ovSVhRSDZlNldHeWptUE0yT3UxU2trRTNs?=
 =?utf-8?B?RldWSjkzV0xqSFBZMmdCNHBNOEVRRVZidHJzNTdCS1hMMXlPRjV4VXNJTEVk?=
 =?utf-8?B?ZUVxUXg1SmI4WWxXenptSkJDTWZwUGRwdVEvS0RwZmRKd1BOc05TZXN0aUZS?=
 =?utf-8?B?RGhvWUl1ajdqR2g5SzgzK2xnNnV4NTM4UHRuSERqVHlBMDV3TndNRnpONFpK?=
 =?utf-8?B?QkoxUUphMmhqZjAyeHBtcWREK1Z6Y3RQSi96SHByZC9QVlUyd1hDYWZlR0gw?=
 =?utf-8?B?KzdteTdPYW5Vdk95YUxIU1JSODhXQlZnVHNEUEV6MFVHMTNlY3BmbUtxQ0Ju?=
 =?utf-8?B?a2hqVmJJcTFsSzBXL1ZiQ0cxajMvUTkvT281RzArRzQ4Q2lKYTNiT1N5eXB1?=
 =?utf-8?B?VHFodVFlOVZja0FCV0NieG1wdFVHNE1ueHpJYUxZNHpQdEdyU0ZSVVlsRVZS?=
 =?utf-8?B?bEZxVTlreUx5V09oeTdmWEcwYU9JRjNmVGo3MzJpZU5CK0V0cnJoWHpYMVEv?=
 =?utf-8?B?NUdoY3U3T3hKMjZZT21UZCttaFNPRHJqTmMwU3ZtVDdNM2M0YmVBWUp0bndG?=
 =?utf-8?B?SVhKZzI3eERyT3ZDdW8vUmZJZFVLcUFjV21WdWk5VHV0ZDNpTGtmSnZUNnpU?=
 =?utf-8?B?eVFlRnd0WFVielowaGlGdlNmVWlwZGxsWGJVMUlqYU9qTGxPZVdqMGp4SUxP?=
 =?utf-8?B?ckh2MkZ5dTFValdjUWxERVd1MVN1eGRGRW5rQTJkeC96dVVmU3ZpcDViWUY5?=
 =?utf-8?Q?XBoMV7XldDU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjQrNDRnVFVoUUl4OWMwWC9RQUgzck1pUG0vWWRSKy9vTWZNZzQ0OHRTd053?=
 =?utf-8?B?VlFYVWVWVFpwZGNhR0Mzd1NVVFZVcXZTa01uNTgxc0VicmtxbGoySERCUUsv?=
 =?utf-8?B?blh0cDYrUXp0UzI1a1NoOGVlK3RSTVhoeGxCaTFhTW9zRFUweXZBZWNDYzZi?=
 =?utf-8?B?aUVkZU82WndmZGExelIvRS94OE5xOVY0WUo1a01Cc1lXbGJhU0hLaFkrTWtu?=
 =?utf-8?B?Z1lJN1FCbFp3VTNwQnk1SjU2Z1Qzem1UWmUrY1FLbUUyVmxEY09yYTAzMWw4?=
 =?utf-8?B?SUtZdko4S3plWVdWT2owc2ZIUmtTZUtRaCtzOW1zajVhZnNnc3dWVzF1bGxC?=
 =?utf-8?B?NjRnYnpCM0REQzFmNklzeU1lNWNoZE9nYWJHbUZlRzIwSC9rNFdoVU5NYWZq?=
 =?utf-8?B?bHNvZFZXY1dLTHY4aTJwNmhiUkdzc21BSW42cUU0MUNLZEdYSzFkeUN0RU5v?=
 =?utf-8?B?czh4ZFlOVGo4WHJncmlkcGdvZTZYT05LblZ4NElNTWZSYzhKUGROR0pvTzZZ?=
 =?utf-8?B?czg5eUNOb2x6a0g5UGVwbklSejBsRmRCYmF4NFZqNklRdTd5d3k0REwyTnBa?=
 =?utf-8?B?QW00TjhydHRoQXlWVGsycWlrcDJxSFB0dlNvam5VdGo5MEpJQ29xYWIva0Rm?=
 =?utf-8?B?ODVGVTI2dVcrdlFSN2VITFdUVUc1M1hyaTNTd1BHY3E1K2lqWkJDaWpIeVRG?=
 =?utf-8?B?Z1l3SzFiRGNQMzJIai9nU1NpbFNtU3FKbGJoUHNJQVJQTFVDazYzLzNNcU9M?=
 =?utf-8?B?Z1dCdGxlMHJlcjliNUdRbzU1Mm9qSW5VNVEweE92NzRIa2FHM2k3d0NEMjZE?=
 =?utf-8?B?Q2RmS3JuRi9qOGF6djdwSldtdHc3dzhaZWwvZTdJcUl5UTJaelk4dHIxUHNM?=
 =?utf-8?B?eGFLNGxoRU55bGVDL3JXaTJYTXZzbGlDSThzOWQwenBXMWM2STl0bmozYnVC?=
 =?utf-8?B?MEk0U2tOcGl5cWdDQytwTkovcFBYa2hvdCtTV3VtczBKWWZiU3BEU09Pem8y?=
 =?utf-8?B?RUsrSkpac1hmMWw3RE1DV0oxU2hINTJLc211R1ZsVER4VVhEeGRsb3NNME1Y?=
 =?utf-8?B?dS9tZnp1eFpFbVBCanZ3UCsvenFVQitWbnAvWmRIQkoxdmdxaHdKeENPZnJ5?=
 =?utf-8?B?TE56K3M5cEloRDc0dHRHVU9DcWhBdXJVZVc2Ym1tUXpyWDFMa1RVWG5tWEJ1?=
 =?utf-8?B?cFRqajZkcmJRQ2p6aDVtVW55NEVyb3pDelVGSWg5RHBpcWp3WkQxY3pGcndx?=
 =?utf-8?B?TXlWREd1aDhLUExsTzZFWHhPU2xZdFV0cCtsL01xWmVPNC9FWFprcUEwblJB?=
 =?utf-8?B?Y0hvS2FJNHdwSEs4UnBORlpGdlBZQS9BV2tON09EbFFiN1FyaDk5RnhOa1I3?=
 =?utf-8?B?SGNQSUp1NlpSMGFRLzFQWTNBODh5U0t2am9YUlVBSFFGNzUzQnBtbm5sVExi?=
 =?utf-8?B?SlVscVB5elp5OWN5bGRyZ1l0R2JGNUtDaktWdkg2eHo1M2lLSEZXbUN6M1Av?=
 =?utf-8?B?aHlSWFd0RnkyQWhEZmVxaHlzTlVHd241UVlqcUlzYzZYQXVpTHJmOXZLU1hl?=
 =?utf-8?B?VHN2UkxZTDhQSkFHSmJHVDdma3lNTWZ3ODhCbjV5ZG9lNWxITVM1emFUZzFn?=
 =?utf-8?B?cHZDRjJNL0FWRGVVM3VSVG9MU3lLOWdyRWdMZDRUZCt0YTZpck85ZnREcldP?=
 =?utf-8?B?WElTSHFyRzQyNXM0VmRVaEhmN3ZrT2RzUEFKS0ZsNDdQUFJ3LzRJL2F6VHJD?=
 =?utf-8?B?b1BLa2cvS2RJZCtpWTdCRWZrK3hSeDQ2ckxVQnRGQTVSMk5aMkZlTzFtQTRF?=
 =?utf-8?B?b2pnd25Ra2JZVHo5Y21aZVB6Q3RxTW90c1ZRc1QvUExUZENjUjdUcnFuejl6?=
 =?utf-8?B?dTBlOUVqN2dTc2poUGlXSStkb28wUHM4TmxmbTdYUkwxa1VGVFJDeFRiaTVM?=
 =?utf-8?B?dGU4QnBpcTQzRjJpNkpUL3hqeEwrK2c2d1AxUVVYakI3ZnNjMEdVQTJMaHVu?=
 =?utf-8?B?Y3BrRytGZ2FoSXB6dVZ1clZTUGFiRFdNM0pwTXpwUFFFY3JPWW03ZW9TcGE0?=
 =?utf-8?B?NE9UZ3R5eExyQUxFOTFPNXR1RTQydlhqSkNJbTNtNFU5NE1iNUVLaW5na3Ew?=
 =?utf-8?B?WmhJQXpCQVVLMkl0bEI4ckdqM1pxRFJuNHo0NGN5Q2VuazBWTzFBczdJUldY?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5cd7249-3c70-446c-4968-08ddb48d6320
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 08:42:30.6304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xq56S9bt50Yb91aPdI3w6FNVDiBh54p7iRXEeT9OOJ8ifWZy9+EIhoRs3V4m9sVzow2BFE6gqa768isFLP8Z0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8519
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

On 6/23/2025 4:39 PM, Santhosh Reddy Guddati wrote:
> Add a new subtest to iterate through all the supported async format
> modifier pair and perform async flips.
>
> V2: Add a check to avoid sync flip on all supported modifiers
>      subtest(Chaitanya).
>      Refactor and clean up code , split commit to include relevant
>      changes.
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>   tests/kms_async_flips.c | 119 +++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 117 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index bf14a1a93..496d1c2c8 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -36,6 +36,7 @@
>   #include "igt.h"
>   #include "igt_aux.h"
>   #include "igt_psr.h"
> +#include "igt_vec.h"
>   #include <sys/ioctl.h>
>   #include <sys/time.h>
>   #include <poll.h>
> @@ -96,6 +97,9 @@
>    * SUBTEST: async-flip-with-page-flip-events-linear-atomic
>    * Description: Verify the async flip functionality and the fps during async flips
>    *		with linear modifier in Atomic API
> + *
> + * SUBTEST: async-flip-with-all-modifiers-formats
> + * Description: Verify the async flip functionality with all supported modifiers and formats
Please call out that we're having a sanity/basic-modeset validation with 
this subtest currently. Rename the subtest accordingly.
>    */
>   
>   #define CURSOR_POS 128
> @@ -137,8 +141,15 @@ typedef struct {
>   	bool atomic_path;
>   	bool overlay_path;
>   	bool linear_modifier;
> +	unsigned int plane_format;
> +	bool async_mod_formats;
>   } data_t;
>   
> +struct format_mod {
> +	uint64_t modifier;
> +	uint32_t format;
> +};
> +
>   static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
>   			 unsigned int tv_usec, void *_data)
>   {
> @@ -211,7 +222,7 @@ static void make_fb(data_t *data, struct igt_fb *fb,
>   
>   	rec_width = width / (NUM_FBS * 2);
>   
> -	igt_create_color_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
> +	igt_create_color_fb(data->drm_fd, width, height, data->plane_format,
>   			    data->modifier, 0.0, 0.0, 0.5, fb);
>   
>   	cr = igt_get_cairo_ctx(data->drm_fd, fb);
> @@ -408,6 +419,15 @@ static void test_async_flip(data_t *data)
>   			}
>   		}
>   
> +		if (data->async_mod_formats) {
> +			if (async_flip_needs_extra_frame(data)) {
> +				ret = perform_flip(data, frame, flags);
> +				igt_assert_eq(ret, 0);
> +
> +				wait_flip_event(data);
> +			}
> +		}
> +
>   		ret = perform_flip(data, frame, flags);
>   
>   		/* AMD cannot perform async page flip if fb mem type changes,
> @@ -437,10 +457,18 @@ static void test_async_flip(data_t *data)
>   			igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
>   		}
>   
> +		/* Reduce test execution for all formats and modifiers.*/

Lets plan to eventually have full execution for all the formats may be 
with an extended flag. Please add a TODO to call that out.

With these minor updates,

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

Regards,
Karthik.B.S
> +		if (data->async_mod_formats) {
> +			igt_assert_f(ret == 0, "Async flip failed with %s modifier and %s format",
> +				     igt_fb_modifier_name(data->modifier),
> +				     igt_format_str(data->plane_format));
> +			break;
> +		}
> +
>   		frame++;
>   	} while (diff.tv_sec < RUN_TIME);
>   
> -	if (!data->alternate_sync_async) {
> +	if (!data->alternate_sync_async && !data->async_mod_formats) {
>   		fps = frame * 1000 / RUN_TIME;
>   		igt_assert_f((fps / 1000) > (data->refresh_rate * MIN_FLIPS_PER_FRAME),
>   			     "FPS should be significantly higher than the refresh rate\n");
> @@ -808,6 +836,87 @@ static void run_test(data_t *data, void (*test)(data_t *))
>   	}
>   }
>   
> +static bool skip_async_format_mod(data_t *data,
> +			    uint32_t format, uint64_t modifier,
> +			    struct igt_vec *tested_formats)
> +{
> +	/* igt doesn't know how to sw generate UBWC: */
> +	if (is_msm_device(data->drm_fd) &&
> +	    modifier == DRM_FORMAT_MOD_QCOM_COMPRESSED)
> +		return true;
> +
> +	/* VEBOX just hangs with an actual 10bpc format */
> +	if (igt_fb_is_gen12_mc_ccs_modifier(modifier) &&
> +	    igt_reduce_format(format) == DRM_FORMAT_XRGB2101010)
> +		return true;
> +
> +	/* test each format "class" only once in non-extended tests */
> +	struct format_mod rf = {
> +		.format = igt_reduce_format(format),
> +		.modifier = modifier,
> +	};
> +
> +	if (igt_vec_index(tested_formats, &rf) >= 0)
> +		return true;
> +
> +	igt_vec_push(tested_formats, &rf);
> +
> +	return false;
> +}
> +
> +static void run_test_with_async_format_modifiers(data_t *data, void (*test)(data_t *))
> +{
> +	struct igt_vec tested_formats;
> +
> +	igt_vec_init(&tested_formats, sizeof(struct format_mod));
> +
> +	for_each_pipe_with_valid_output(&data->display, data->pipe, data->output) {
> +		test_init(data);
> +
> +		igt_assert_f(data->plane->async_format_mod_count > 0,
> +			     "No async format/modifier supported\n");
> +
> +		for (int i = 0; i < data->plane->async_format_mod_count; i++) {
> +			struct format_mod f = {
> +				.format = data->plane->async_formats[i],
> +				.modifier = data->plane->async_modifiers[i],
> +			};
> +
> +			if (skip_async_format_mod(data, f.format, f.modifier, &tested_formats)) {
> +				igt_debug("Skipping format " IGT_FORMAT_FMT " / modifier "
> +					   IGT_MODIFIER_FMT " on %s.%u\n",
> +					   IGT_FORMAT_ARGS(f.format),
> +					   IGT_MODIFIER_ARGS(f.modifier),
> +					   kmstest_pipe_name(data->pipe),
> +					   data->plane->index);
> +				continue;
> +			}
> +
> +			data->modifier = f.modifier;
> +			data->plane_format = f.format;
> +			data->async_mod_formats = true;
> +
> +			igt_dynamic_f("pipe-%s-%s-%s-%s", kmstest_pipe_name(data->pipe),
> +				      data->output->name,
> +				      igt_fb_modifier_name(data->modifier),
> +				      igt_format_str(data->plane_format)) {
> +				      /*
> +				       * FIXME: joiner+async flip is busted currently in KMD.
> +				       * Remove this check once the issues are fixed in KMD.
> +				       */
> +				      igt_skip_on_f(is_joiner_mode(data->drm_fd,
> +								   data->output),
> +						    "Skipping, async flip not supported "
> +						    "on joiner mode\n");
> +				      test_init_fbs(data);
> +				      test(data);
> +			}
> +		}
> +	}
> +
> +	igt_vec_fini(&tested_formats);
> +}
> +
>   static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
>   {
>   	if (data->atomic_path)
> @@ -868,6 +977,7 @@ igt_main
>   
>   		if (is_intel_device(data.drm_fd))
>   			data.bops = buf_ops_create(data.drm_fd);
> +		data.plane_format = DRM_FORMAT_XRGB8888;
>   	}
>   
>   	igt_describe("Verify the async flip functionality and the fps during async flips");
> @@ -1033,6 +1143,11 @@ igt_main
>   		run_test(&data, test_async_flip);
>   	}
>   
> +	igt_describe("Verify async flip with all supported modifier and format combinations");
> +	igt_subtest_with_dynamic("async-flip-with-all-modifiers-formats") {
> +		run_test_with_async_format_modifiers(&data, test_async_flip);
> +	}
> +
>   	igt_fixture {
>   		for (i = 0; i < NUM_FBS; i++) {
>   			igt_remove_fb(data.drm_fd, &data.bufs[i]);
