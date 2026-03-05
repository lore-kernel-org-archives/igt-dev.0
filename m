Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B00F3092B
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 10:25:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F6210E24D;
	Thu,  5 Mar 2026 10:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ifo14RXZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B71DE10E24D
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 10:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772706333; x=1804242333;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fzWaQJIalqH4PrHkDKqO44jKJZpxraQ6CifavKWB214=;
 b=ifo14RXZ//0de/ZOSGLDpaQmptEi1vOsuk4sGfHEfozDORcqbuUXz9wh
 qSXx4th88F+1qz+03zXljuI55hkW69XuRsbyFvonrOwsyXvlcEB/AHyv1
 rBLEQI+GR1YHmkPhJMhc0dPt/78KqshMgQplBShB8dxEFwMjI7C/9g6QT
 0kPy8W00yiGSLxz4C0MaA1J1Kd2vVVLH44IQWpMNLpsrB+zfhnzH5ZeWX
 r5P0+5FoPjTJcqhyW5LC6W6KN61bmIUz+UsbAZhbBrY1UBVEW01YFAdFU
 +pgcZ9Xi+zXY/T9XSURILlFnt2h9oNtALJFCvw4tfVpd7gkPiWHb4IXgt A==;
X-CSE-ConnectionGUID: rWAGawwxQRS0KH+2y4eH9A==
X-CSE-MsgGUID: +qjcXq+PRgKuliCpnQuCEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73858585"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="73858585"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 02:25:33 -0800
X-CSE-ConnectionGUID: LKOgkX6NTUaM/lbeFhkGHw==
X-CSE-MsgGUID: Of9Oaa5jRmm/cKMhLk+Tag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="222788392"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 02:25:33 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 02:25:32 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 02:25:32 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.63) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 02:25:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+mtYZfZG0N5d9bZHO8LdrN9EblOlgcb83WnLfwWNF8YnHV1OjqteSWrE4E/PFIANKywO1HkubdaXdhPzzeRd8075Yny/7gaq4wUvk8fn/in8V1J78PYg1Ov3snUG9ARNYdcFti1lGZCNXMhV23RB7LaV39OTafC2WJJ9IabCXRURrla7AodXFo2F9aKpyTyv1qOe2XWa3TAws15a9BrHgOYNP6rtnGLaJQE713B1+0lrS62oVQVhPyGEglow9QFkEGie2ZxoyA+v9z0zgMyc4bbRkTGZXJzwiEGUVMGqZsISDXkXn4qq56A3D/9WoC7FpXIC8lVQXGXyBD3HFk7wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCUO0Bpt1BnycFu9Z013KpfC+WsVDqD8bxg1507CNdA=;
 b=LllcudPVKnjsclTOGyItFV887qKTkYXdjnMQI+X0Hwwk3ttFaO5HH9fuCCD+8SVtmdJonGI4QQOPO5daCccTjbYrWWENcMGpP3mYhOVVmYYQEkWVUWcE+MxkwndkQjhCgcVV59llAxUDWVVCzuBpQ7scTHpRUd0O2DR3gWf6NZmLMjtwO/xdrUiQWBVineixwfJdXLv/g+kCU5f2aDRr7eTKVCacyfCRz5eI9+sI6FkSrRVDXDlGwLzPd3HNo+Wk2RbEegmsLgoJ2/DYBzhSAkfhvw54ncikMkouT2KvASDlaYz+8Ea+Krr5Xmb50WN77VmhzMk/gDQYWxzJHvidvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by MW4PR11MB6692.namprd11.prod.outlook.com (2603:10b6:303:20e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 10:25:28 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 10:25:26 +0000
Date: Thu, 5 Mar 2026 10:25:01 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: S Sebinraj <s.sebinraj@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <jeevaka.badrappan@intel.com>,
 <kamil.konieczny@intel.com>, <zbigniew.kempczynski@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH i-g-t v9] tools/gputop: Add GPU frequencies to the client
 headers
Message-ID: <xocuvxchd3uo7rbewv463aes7sqgziyidmm3gre5om7i2z6vrr@udl5kmjtgypd>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260211054638.4090041-1-s.sebinraj@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260211054638.4090041-1-s.sebinraj@intel.com>
X-ClientProxiedBy: TL2P290CA0013.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:2::7)
 To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|MW4PR11MB6692:EE_
X-MS-Office365-Filtering-Correlation-Id: fdbda0c7-5e0c-4055-0534-08de7aa17d44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 2ohUOy32X+KOFCHzTSJtRXNpSnsQBXESt7JZ7UR0NHHykEzMxMzVzN1KlLFrKeeVhJgg1Qst1gZSd7kKh2SeXDdIYM+f8E7hnTcHjWwetXMqNg3KybMJkDfY6KMEysuGZMQ2cAig/slBQyd1DTT9YpzfOlyfGLMZxPthM8bUoSEcX1sLep/NOUK1EkvHnYF+TjTRGQ9tXUYmrZGvl+vNDFjxy/ScV34iHmByfYc2vCxRPaO77NmXRA0TEBeQz9aMWCqQGISm2RKZ007bBlzeEKMHS16P7VrS5Wzjh4QBWRPCQmJPh6MFUINqFXvmkL+ZCbEdtGSM9ONFvq2mOI+6GYOA3biCEYIcwNIs3RZC10GTwKopO6Ip9gQAf+KCPMLyW/juqlQRcisSed9qVjCnP9HeyyBcuG7eSMFsx7tPKbU2QKkHnAG50e368/TGHkue2BE9geNQ6ksZqgra1A1qGipIt6V9i0tYRVBj/STjtUIfDELBMU3C5AEHrT//LSIZUNTN//6jfHNtO0yEzS89dFwhGE32Mkcv2AA9zHAw8LcHxnWBHdxzWnotEplBcY/ePOPmXeKmawX5BnoY13LXM0NBEV4fRqPmmRYkdZOFVUnlnjMAWQUxMECd1r2xNX74abgljbwuHDOgZsKZjp/1CMFGSiKqZ/Gpy4zuGf9LZwrsPiq33UeXQkFBygPB8wQ3K1H3TXwRgG/l7ToKqq5PAMkT04E6TWmdSFr5YWulK/8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUQ4ODhtYlhaNkhTSGpTa2dvbnJ1ZjRWSU5wK2VIbCs1bzd4RXpKN0huUzAz?=
 =?utf-8?B?czF2VUpSSjBXd29kYmd3VFBxUStHanhlNnBwYkkxZDNrS2g5dlBTV0RjZ1VP?=
 =?utf-8?B?WXdjT1UxUytGU2xiR3RacmNCUDdnVzVVVVA2bEtrdENLOWpJV3JDbXV5YzNl?=
 =?utf-8?B?elo4U0k1RWloWmJRbklDc1JJY0trMldldDFIbkxBdnlQQUlTbk5hSnFxaEZO?=
 =?utf-8?B?S0p4SnhLcWVGTDd4ZmkrTmc3NE15UlZPaStPTmRsVjBiK1ZtOWtWbWdiRkZm?=
 =?utf-8?B?Y0lOd2x3QzJpZjRnQnMrYVFXYTJFM2kvSkluWEp5b1NwOFB3b1kvaGVTUDRD?=
 =?utf-8?B?dC94NmFodHRYNUlkNVVMNU1BVHk2OVdOWVNkSjRaQy96RXd5UEhRODBLLzBU?=
 =?utf-8?B?WThXcG03ZmpubkFla3RrOXQ4U0NzcXdpVE1jbzB5cXAwbkJWb1M3NHRqdWpN?=
 =?utf-8?B?M3E0dWtyTXA5R01nbUZrSzMrTERZZThtS29zaXk0NjRxblZPU0RVZEJlbHM3?=
 =?utf-8?B?QUE1THEvd2NkQTVabWljc0RGNVBTbFF3MExkV1VTZzlzN2dZd2hySlNkcHR2?=
 =?utf-8?B?NTFka3FHbDE0WUt2TEV0cUxidVY3elFDeW9RRGRuTkNoTmpYRGRIQytSS3Zm?=
 =?utf-8?B?Y1R3dzhNb2xDMms3Q3dWaWxha1JBc1JUa0xJd2RIVStDQ3BiNkRpUXpGSG1F?=
 =?utf-8?B?ZzhXOGVCcHJSSElYNmJod05jWHg3ajYxZjlWUmFYU1FHVHYzMXM1Qm1NU2hz?=
 =?utf-8?B?NG9McEQvcTVTdFZFa2xlY09tazBVU3REQXp3WG5jNUV2eEpwRTJRVW9CczZT?=
 =?utf-8?B?S0lZWjBVNUc3YlI3TENjR0ozWEk4TzBlaitzS1cwTGI2K2xKME9rZGc2eEFS?=
 =?utf-8?B?V3pmeHEyN3RValN5RXdJekRyOW1Qa2lJNkNuR0RHY1E3bnR2cFNSdXY4TFYy?=
 =?utf-8?B?RitiZFkvSG11ejRlRjBaR2lmaGYzTm91ajVCRE5majdkcmRlcnZPQXFNT1BS?=
 =?utf-8?B?L0o2WTB3SEo4V0JnNEhCNDVWY0ZPdWU0NnpIdU1yL3o3NWZTRGNLazJ0em5n?=
 =?utf-8?B?SVlJdWlOWTM2VlVhMEpMQ0FTM2NOc2o3WHFhelU4eEUvaW1iUXZPakR3aWd5?=
 =?utf-8?B?emY0d2ZwWWJaSTAxYmJkRENLemdiZElTMjRsWUcvdmhHZWpydEU1S1NDSEtR?=
 =?utf-8?B?UzhEV0pwYXlZbHNpQ2dyU0xIQUxjYXpHaXlYU0ZxMXdlMDkvZ1V5YmF2dWNm?=
 =?utf-8?B?dzRWSWtmZ01UQXB2N3dQdG1TdDdkMTludkpUbEJmdDVFRjk0aFNPRXZNUmtr?=
 =?utf-8?B?YXBtSzIvZUI5QUZSQXNkRGJOTDVQaFgzQ0RXd0tNc2JKQTJBaWJRVlVxTEVR?=
 =?utf-8?B?VENtOU9FRVhQT0JPQlJ5c040Y0hwRzdEQ2hQQ0N2WEZJUWZLSmhFak5Id3Zp?=
 =?utf-8?B?aWVXeDN4OE9MOGl3aFZpeGFkRFZmRDFlYm9KNjlPM200ZEpGcnV4MTRNTlFM?=
 =?utf-8?B?QktkRDUzbnZ4eVVGZTZCaWViZE5jazhVZEVwd1ZSaW9WS0xOcUlHRzUvWTA4?=
 =?utf-8?B?OTZIVTFPWkNCdWt6Nk1FT0dsZllLZFU4OWZMWjR1SEkwTk4wNEdJNllmNWw2?=
 =?utf-8?B?WFMvL1ZJcWR4U0Q1NloxbTkzUlUzTlZxMVpETHZhSkNMQkNIc1N4a3B5a2xp?=
 =?utf-8?B?UHpJekEvRVNDM1BzS0pxajRkRktlTlE5ZGZuYXdMUG8zTHl5WUxkVGNjYjAr?=
 =?utf-8?B?WDhWTndUaWlvVllsWWpxTHN4MDc0c2l0UFRqLzhiOEFsbUt2V3FHckovQ2h5?=
 =?utf-8?B?Zkp0TnRFVjZWWEVldkRxNmx1R1JudmwzTDltSGt3ZVorM1p6bWhuNThZdlk5?=
 =?utf-8?B?MXh5M1UyWWRIYWpJSmZ5bW5GMmlkc2hxcms3L2lDZ1B4ajU0N0hMYzRqOElD?=
 =?utf-8?B?U0NsMTMxaGc0Lzh5bHZZS0ZuUWFBeUVEdGtUWm01ZFhDUGxWU1lSc2ZoWjcz?=
 =?utf-8?B?eHkwWHVqbXdUOHc4azlYU2dUbXVvZTU0OG5XZTR1cm5VRTEwMXNwU20rRGUr?=
 =?utf-8?B?eEdaL0c2L1FmTloxMFBxK0dML0hDWWVZVnZ6RG5NVXJCeFhMeHRoaVlMSzUv?=
 =?utf-8?B?MTJUNkxkVENzSlE2QmZLL3ZmdzlWUE50SFJnS0hjb0Z4OHVuUUIyODh3dDdj?=
 =?utf-8?B?WGl5T3RmaFlZRVU2UlUrS0ZodWtoTjc4SXh5VCtKa1ZoaDNIeW92QWJSU1hX?=
 =?utf-8?B?Y01HSWRDbHVkQnU2WHZ1WEdWM3ZjUjc4WmNzNXpBZVdIWmk5bHZaMmRwWUpW?=
 =?utf-8?B?RFlQblYvTnN4SXVoVWd5REhnUFdybkloM1dSL3FLZk5HdkM3Z2JIR011Vmdu?=
 =?utf-8?Q?OLi1ZA9JXycer4YA=3D?=
X-Exchange-RoutingPolicyChecked: T9+0GXngq2OHSF2lsVWfwkaVH5EtJsp1LVn6wA3ywFICOw2xthqsByEMC1SzIxM7qxZ50146jX+DwaTAgsAD5nzZLhOeJ54d3KmmRpDTdtMHGcHzVsNNFTQU+I3YMdQp34GJDLPaUmAOAMeokCNY6Rc+yDpa7QedNdhkmZ+yimz0YUMDwD3pQmqKzEaJCFMqsOhlJ+4T7Or5oS4FayIdYtjmzbhHpD63MVX5azIgV1H5zIvEjLT43mzSuq7GQXb3NsLT7PnG9Ju+mPuhPuvGu/4SLXERBDY0VbDuePyEfcQRGtGXT459f75+6aQKeq+TRRrR/umR5kM3UfLNVtDKwA==
X-MS-Exchange-CrossTenant-Network-Message-Id: fdbda0c7-5e0c-4055-0534-08de7aa17d44
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 10:25:26.3083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yMKsng+7Wy3GhSoY+h+gEm1tknyUxgIx7goDbdAO/abNJUnKrNAsgMl3pkQdwI04hrCvy/qezaAt8g9nlmEJJT/Il6LDTySGH+rHYfmItxg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6692
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

Hi S Sebinraj,

[...]

> +/* Detect which driver is bound to the device */
This comment still does not answer "which" - it does not give
you the driver, which is bound, but it checks if the driver you
gave it is bound.
This is a minor thing though, so address it only if you plan to
prepare v10, otherwise ignore it.

Rest of the code looks good to me:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

> +static bool is_bound(unsigned int drm_minor, const char *driver_name)
> +{
> +	char path[256];
> +	char link[256];
> +	char *driver;
> +	ssize_t len;
> +
> +	/* Read the driver symlink */
> +	snprintf(path, sizeof(path), "%s%u/device/driver", 
> +		 get_sysfs_drm_path(drm_minor), drm_minor);
> +	len = readlink(path, link, sizeof(link) - 1);
> +	if (len == -1)
> +		return false;
> +
> +	link[len] = '\0';
> +
> +	/* Extract driver name from path (e.g., "bus/pci/drivers/i915" -> "i915") */
> +	driver = strrchr(link, '/');
> +	if (!driver)
> +		return false;
> +
> +	driver++; /* Skip the '/' */
> +	
> +	return strcmp(driver, driver_name) == 0;
> +}

-- 
Best Regards,
Krzysztof
