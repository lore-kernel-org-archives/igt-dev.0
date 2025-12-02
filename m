Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FE6D12671
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 21:52:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB6DB10E6EA;
	Tue,  2 Dec 2025 21:52:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fJlPb+Q9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3109B10E6EA
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 21:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764712374; x=1796248374;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Fg1xE6TwO55gLoP+IqNYCFWCL3hdtks1FjQxdtxKSQg=;
 b=fJlPb+Q9DWbjKxC9/upD3NvLiwfPuEYacPbZYjs8th7VOPPxuKpHJJ2p
 1XI62s5l+sQZkcNN2idyVp88t1NsHv2uwA274tVG48BP1ZQhHzQnuXv6I
 /MXxjbDYtwY1/fOhoO4oaKHenJ3VYzQAsn0EW33zJKOoRjs3LUhD/zRnQ
 HVj3+MidCRofwqL65/a4dq+Zi8wxJE3+4a4aVwpUVAh2FHBokpeYHrJrD
 r5hqok/48l095RQ4ilW/sJ0tcwBhkWsSvNwiBL5COYymasdlLL+4RUJNJ
 FLQ2iTt4UMwoZAVUVma5wFFLj1lz9uFXm9y1Ym4iS4JUfxHaNieN2V2Z1 w==;
X-CSE-ConnectionGUID: k3zouennSGO5UPmdNGQj+w==
X-CSE-MsgGUID: RAadX5DPQSWHi7ux4akKpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77016939"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="77016939"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 13:52:53 -0800
X-CSE-ConnectionGUID: vqgWjJcxSm6Y+HlsiHVNBQ==
X-CSE-MsgGUID: Ts1Zbpe9TDyR4AfPFaRQSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="194591386"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 13:52:53 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 13:52:52 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 13:52:52 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.68) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 13:52:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pfdsY9YAgYxB6XNHoZhjQq8rnWIaOAuJjrBcorQblWxuKhefcpluQYOpz0LDR2tAiIKv4wdp6emNVkr9ibhCg0z/cUqqpL+iGHnZgKHWu2oco2X6iZyKnP6o5deNcfmgOH/Si3HmseS3H4fFcLnDPE3WJ2bWidSkzkFlihGSln6lMjPfylmw4oyXyKBeA1+CruqlixZ3qtQfifFIA8PB0RBz3gbX3FG7FnGxNq4DXucDRD7drpix8/5ju8BK28O0APFT2IVXcjRLvZ5Kg7/xhe8vBXyJqmBFF4ze9IsUmotWtb73GSK45CeAqX2AyBTNoF56GzFjQiBFwnzSdyWiQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fg1xE6TwO55gLoP+IqNYCFWCL3hdtks1FjQxdtxKSQg=;
 b=Rq/7jGnQsi0hHa7771/sb5KKHA7/0jn4XtccuBzfSEr1hLuceG15pg5We6YybH2WAUBTMdTIClsrIHvds/FmFiTQmqy5r7KYtbhdVMxNnaivgbWY7nFqwrtGSKULhK8GC4oDcy1VqBqIlNepnlnqgk/bfgIQP8GTFBL5XVgIS6EPwLNigXrM0Dty642jukx1Tx9X7MGhxIoXq9xJYH+KPO9L1Ft+p32lX6TS9WDf8gupyPjQcGafk3prgIdxb98YVCVjPu6VsspArYg9xmGawcSat+hSzeFegQCAgODD4dMDN5fRmqUcbbMQCGAB3wt3H1bU5LHukyoe46lB2bxEfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN0PR11MB5711.namprd11.prod.outlook.com (2603:10b6:408:167::22)
 by DS7PR11MB5992.namprd11.prod.outlook.com (2603:10b6:8:73::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 21:52:49 +0000
Received: from BN0PR11MB5711.namprd11.prod.outlook.com
 ([fe80::4137:d45e:2206:50aa]) by BN0PR11MB5711.namprd11.prod.outlook.com
 ([fe80::4137:d45e:2206:50aa%4]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 21:52:47 +0000
From: "Taylor, Clinton A" <clinton.a.taylor@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Dugast,
 Francois" <francois.dugast@intel.com>
Subject: Re: [PATCH 1/2] lib/xe_spin: Pass drm file handle for mem_copy
Thread-Topic: [PATCH 1/2] lib/xe_spin: Pass drm file handle for mem_copy
Thread-Index: AQHcWJclBcCqaHTHuEiRYUw6nWURVLUO+u8A
Date: Tue, 2 Dec 2025 21:52:47 +0000
Message-ID: <84a688ac13a6a28b181d3ceed5847d2b163813a3.camel@intel.com>
References: <20251118142522.3957318-4-balasubramani.vivekanandan@intel.com>
 <20251118142522.3957318-5-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20251118142522.3957318-5-balasubramani.vivekanandan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR11MB5711:EE_|DS7PR11MB5992:EE_
x-ms-office365-filtering-correlation-id: 06364ddb-1b9e-4c62-c2e2-08de31ed21e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?U3ArVzFxWEdIazAxMkprdS9mRHp0b1VDNHVvNVBRb1hxbHRpRTM5NlZHeFNm?=
 =?utf-8?B?VjIvcEFzU3U0aFJ5ajFFbTBISE9iMGp5M0pvdmRJUjdJbkJlQW1CZW90OTAx?=
 =?utf-8?B?MTA1VnRmcGFMTDhtMVlJUStQZGpraFBUYUdQeTBSMXNqWlNvd0NUUysxUU1y?=
 =?utf-8?B?SWhiWnZLYVNiSi9PTUdPb1IySU5WNDh5ZjlmN3NVcmx5U010dzQyUjZacVRh?=
 =?utf-8?B?Z0NJRE9jUmUveVVpbWQwT0pQcDFTZXVaOE04RnIwczJHYWNDNFV0aTcyaFZG?=
 =?utf-8?B?amg5WFlmTFl1WGw3RFpHbXhxMHAwU0NyaGhYQThRU3pYQ3pDU1hOZXRQeE9s?=
 =?utf-8?B?OVRqQ2R2cjlOWTg5RjVrNmx5dlN6SjRqNm1ETE9qdXg3anp1bGJHanRwOXNV?=
 =?utf-8?B?Q25uazZGQUszYkJGWnppS1FUNFNzOVFiMSs4bXlxRHhGenNtWjVTR0FZWkVx?=
 =?utf-8?B?YVIrZ242eG9iYmZsTWdkUWZJRm0rMFBLa2VBNHB4Yk1PS1dtUE1leWNZdWFB?=
 =?utf-8?B?RW85eU5oVkFLcmtvR1h3VGhWZDFPVy9BbG95Ry9PY3hXTzcvS2llOVBaa1BN?=
 =?utf-8?B?eUw1SUJ1NWpmZ0twWGlFUVRQNmhKa2tnSURpd0ZoN2M3KzJIR0hMMzE5MTFK?=
 =?utf-8?B?cnRIdHJSald0amc1RFZXY01XQjdxUWM3b3o5ZHFIVUNLcThnZ3JPbEwrQVA1?=
 =?utf-8?B?YTkvQ1F3MzJFdE82NlVWU1pLSFdBVDRBTDBLbmlFaTk5THNWTFZjaTBYOHdB?=
 =?utf-8?B?VW5yWnZrcHFHTGthQitvUktOUEZhVTZRZDhmUmpDYVg4b1ZGdFlNL3U3K1dj?=
 =?utf-8?B?MGFnTW5Dc1FINUlZNFFxZ0gyR2VzY2xnWHpvNWEwZGVVRHZ2QUxGblNVZFRl?=
 =?utf-8?B?eStYK0l0WGtySUI2Y3VtRGxUbjRlRWRXZ0ZLdThEeXF3SkVIai9VRG9sSGUw?=
 =?utf-8?B?clozRXUrYmpLQWRzNWk4UEZzV3FTMVdjYml6eHorNjBURVFVWWJGSU9YQkMr?=
 =?utf-8?B?TlJCcUQ4anJwcjB6elI4U0oyZDArMForVmNUTzd4TnZZZ0M5WFR4VUt1OHBn?=
 =?utf-8?B?UEg5TXczdE1UVEM2TGs0U0thWDZIR3c5a0x6YXROaE1QSmJmL3M5VXV0UUZr?=
 =?utf-8?B?S0hObTBaYjhKdm5UVHExTXQ2Mk1iSFhGUXRlejM5SDZxdmkzbnlkRkpiR3J6?=
 =?utf-8?B?YXZ1Mmp0QUlSOGlROW9Ob0NiZWtHTktVQ2ZRWHZEQ1JpWkRyb2IrdGNGb0pq?=
 =?utf-8?B?UWNTSVdTUFk2dXFSMk05QWwrVDNGV0xTVmwzTE5KREQ5b2dwdDZqTjh1YkRM?=
 =?utf-8?B?S1NUNEk0aGZ0MmF2QU54L1hySzRtYllSK05OMHdqcmlqTEROaENqLzJOQkZZ?=
 =?utf-8?B?Y1ZVTkpQVzhNaFdNa2pQR0pmaDZwUmpRRlpUUktwV0NlYmJRbzkxdEtNYW9R?=
 =?utf-8?B?dDlMSkFRSmdwZHJKemdXSktqWG5RdVdYK2FBSlZGekJNNVBkR0g2RGt6aGp6?=
 =?utf-8?B?ZHY1eHVDd1RrTVNKMmtSaVVTM3loZ1hCWXFqVnJBQ2taeHJINUswUWhaOUdH?=
 =?utf-8?B?TnlndThDb2kxQkhUbnFMeG15Mm1aUW1jOG5veVZMUmtqY2QvSXVEc2gwTE1L?=
 =?utf-8?B?aEMweC95WEFMKzBjVThnUGhHdE1zV0xnSHA0NHIwcFZ1a2tiU2MxaDdIM3dh?=
 =?utf-8?B?YXlpb3RjbEJiU2ZDb21KUXZXZmh4SUZSU3lZSDBES1pGMFAzT0E4am5KaldV?=
 =?utf-8?B?Qi9qQ1ZOZkNzZUVjMGRHWHZoUlp5RDBYWTByeFE3N2ZYTTdtOHFUazFPNko2?=
 =?utf-8?B?RHJzdFBCbEJpWmY3TXZjZmV4LzhMN1dRMWJXUkxpOE1vbjUrZ2wwRkZPVUF3?=
 =?utf-8?B?Z0lYZ3BrVyt1cXdPQ3M1aW5KWTkxVERPdGx0WGdQSEcyY0dLbUsvYW1kWFFR?=
 =?utf-8?B?U1JCMHVCd1JGNjI4RCt0Z1loMHVWZU5ISjRzK1lGd0F2bEREUHNQbzVKcUVD?=
 =?utf-8?B?UllUMThUY2I0ZmdnRTJPM3F1WVdBYmxZV1F1dDBvY0JLbnlrVUlNbzREcGpv?=
 =?utf-8?Q?Tj/Y2c?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5711.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NTVlbmFTaVhnaml4QkZuQkZvV2R6YW9BOTM5Tm5QektGVUhid29YeXhQWExp?=
 =?utf-8?B?d3lrWkNiaGY4bXFXZVpNYXMvU0RjMWZuMnM1T1NGdUVFV0k5MHRsWndGTW5v?=
 =?utf-8?B?TFhlVjBBUDhIQXpxUnhkT0RZUXZlR3dzc3ExM25tQ3lQejBDYzBhYThrcEFo?=
 =?utf-8?B?ZTVvUWhJSkJ1dGY5WmFYSm5Da0lOOFVqeE10N3ZMZUp5TklLd1VlSWh5eTZX?=
 =?utf-8?B?UjljVkN1U3A2d2ZzWlVORTFDR3BqUk1TVGtvZEFoUFRZcVFDVWdLMHYwbUUx?=
 =?utf-8?B?NlFWMjk1Z1ZYUjFxNVEvR0xqOWsxZ3U3OEVJL21zanVYdXV1Q2RuMlFCck5m?=
 =?utf-8?B?QW1yTWtTWXQ2cStOYzhOaDBVNzdJVXVJYzA0cFFMRXRzbGk0RVlDcnZuWFVx?=
 =?utf-8?B?TlBLWnQyU1h2Z094RFNNbmphVTRCNGxaVXBJQklUZWUvOXJ4eHd3R3YyOXhM?=
 =?utf-8?B?dThSQU1qSW1SQ3pYWXVVZVByamR5NENZaWZ1S0x2dWJWRUNCek4xRnFCSG9N?=
 =?utf-8?B?bms2RGl0clhNSDdzSlIxRXl6eTdGRExpcHYzbzB0VUh6UUZvWDV3c1BaRjd1?=
 =?utf-8?B?Q0Z4MTgwajliQ0ZtN1I4emxOWUJWVnlSUWFWYmFnZU1US2FycTlBZmtuWCtm?=
 =?utf-8?B?K2xHN01kVWpJbCs0NTBsdkJQZElMUG9wZmhXSEhqTVFuSkY4VzJJNzY3eVdT?=
 =?utf-8?B?OWhFZk03RTNNVWVoSlJ6cWlDand2TTB6T2hBL1BSeTdZNUt0b3ovL0czcEhW?=
 =?utf-8?B?eTA1VlVRR3AzZkw2RlNkQWdiNHg4SG1rWldkUUhRVDRNT3BIRC96c3QxK29N?=
 =?utf-8?B?QkJ6Yldzd2hadkZQVU9zcE5KeEgwT3pDaFc3VUpnd3JpSld4WUVHNHNpSnRy?=
 =?utf-8?B?S3RhZG9oZXVSN0c4RFp0V1J3cHBmREF1dUhzOGRNaDVjcGlFY205MkRpOFRL?=
 =?utf-8?B?S2hrbnRGUlIya0Myb2M0ZExpTlZKS2dNSkF3dElYRWpzOTk2Q2w1QmtKOWlr?=
 =?utf-8?B?TmZYUUhTNkFvSUc3UUppbFQrT0UrOTMxZkpCenBBaTlueXZNVW1jREY5UUs3?=
 =?utf-8?B?YXZ6M3pwWjBMZ09UOUFkTkZGNlM5UzJ5ZHZFMEdsQWpLUkRKRjNsZTJsbUJn?=
 =?utf-8?B?WmJzUVlkUkFvVFN5SE1wZnVRei8xbDVid2JucFh1UVZ2MUV1NFF2dUpxRGEr?=
 =?utf-8?B?cTRTUGRibnZyQXNWa1MxSXMvY1EvckVidGNCUWZ4L0dEKzh4QXFPRStEdlJo?=
 =?utf-8?B?RVdUNkFHSHBDcTZMOUtLL0lLR1BHQzJNM2M3RHBLL3lUdjY4TDN0ZFZ4Wnhu?=
 =?utf-8?B?NjAzWDQvalg2U2tubStwZk5OcUdseWJTZVJYSnZpRGxuZzVwTm9sMzlwSG5E?=
 =?utf-8?B?SnFPN1lkV0tDVVVJR29iUmtTRnpUR1dCT0ppREVTdFA3NVM5cGJkNnVyM1VZ?=
 =?utf-8?B?M2xOZlFoQmM0VE1tSU5BQlM2NCtNYmtqQkdWaVBhc1Z3SzF5NGlQaS9CUWI4?=
 =?utf-8?B?TUF2UFZNMDlnRU5ZQ0U5ZzU1dkQ4d3NlMWhPUmRrRTExdXhyU0VxbnpCVnV3?=
 =?utf-8?B?ZG5FVnBZRnZxOFB2a1B0L3RuS0ppY1FoSVhSTDJnQm83WkUvM1VqWHBoUy9X?=
 =?utf-8?B?T2Z6b2x4ZitZYTl1cnU2eGY1RWd6bldmN3pjc0ROU0hhTXI3SFIzMWd4MUht?=
 =?utf-8?B?NVd1RnFCTEJGTXp1RHE0NnFSdWZaZjJBUlZvQkVLdTBra2UxV1ZoY0IvMFk5?=
 =?utf-8?B?dkhDQkxnVG5mMC8zM3FhOW4zR2FRQ1JENHdBejVKMXl2Zk1WZ0lGV2xST3N3?=
 =?utf-8?B?bFdOS0FmYUdLQVpyOVltQ0JOdXJQbVBzTllOdS93OFhFc09PWHMxVVpUNCsw?=
 =?utf-8?B?RzJNanVGWTEzUHVpQWFaeHhHYlR1YnJJa1BBMzBCN3I1ZGZEMWV3WmpLTTZt?=
 =?utf-8?B?cHJIYXljZVQ1cVBEbmdrTkF4cFBsQWRWdlYrVmpmdk9YTHZyUVRzQVhNNkJ2?=
 =?utf-8?B?Q09qZW12N3ptcE5iT3IrMitHV0dIMFFDTzBzcG5FRnJlQlBYaEI4cDJDS00y?=
 =?utf-8?B?YkkvNG9XcFBjUlhReFRWd1B5K3AzcnZyYzZSWTZzREltUmtqMHJLRlBvRXlv?=
 =?utf-8?B?Wkg5N1o2S3NpYXdMZU9qSFg0aThTTlFIdEw5aFViN3pNZk5WdlNJbmlpR0xK?=
 =?utf-8?B?V2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E5D3165A31915A4EA317E7A6741FE876@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5711.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06364ddb-1b9e-4c62-c2e2-08de31ed21e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 21:52:47.8429 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZCmGYfNora/iUzwghyRXO+aQhoCMDGF+mjH+pTykbn+sFMKUJ9Dws7UtqzQEDtI1SJAqKqC2qQdOZ/LBjub6xhQ9QFEdpHVmMtdWmXNqUF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5992
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

TG9va3MgZ29vZCB0byBtZS4NCg0KUmV2aWV3ZWQtYnk6IENsaW50IFRheWxvciA8Q2xpbnRvbi5B
LlRheWxvckBpbnRlbC5jb20+IA0KDQotQ2xpbnQNCg0KDQpPbiBUdWUsIDIwMjUtMTEtMTggYXQg
MTk6NTUgKzA1MzAsIEJhbGFzdWJyYW1hbmkgVml2ZWthbmFuZGFuIHdyb3RlOg0KPiBSZWNlaXZl
IHRoZSBkcm0gZmlsZSBoYW5kbGUgZm9yIG1lbV9jb3B5LiBJdCBpcyByZXF1aXJlZCB0byBjaGVj
ayB0aGUgSVANCj4gdmVyc2lvbiB3aGlsZSBjb25zdHJ1Y3RpbmcgdGhlIG1lbV9jb3B5IGluc3Ry
dWN0aW9uIGR1ZSB0byBjaGFuZ2UgaW4NCj4gdGhlIGluc3RydWN0aW9uIHN0cnVjdHVyZSBiZXR3
ZWVuIHBsYXRmb3Jtcy4NCj4gRm9sbG93aW5nIHBhdGNoIHdpbGwgYmUgdXNpbmcgdGhlIGZpbGUg
aGFuZGxlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQmFsYXN1YnJhbWFuaSBWaXZla2FuYW5kYW4g
PGJhbGFzdWJyYW1hbmkudml2ZWthbmFuZGFuQGludGVsLmNvbT4NCj4gLS0tDQo+ICBsaWIveGUv
eGVfc3Bpbi5oICAgICAgICAgICAgIHwgMSArDQo+ICB0ZXN0cy9pbnRlbC94ZV9yZW5kZXJfY29w
eS5jIHwgMSArDQo+ICB0ZXN0cy9pbnRlbC94ZV9zcGluX2JhdGNoLmMgIHwgMSArDQo+ICAzIGZp
bGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2xpYi94ZS94
ZV9zcGluLmggYi9saWIveGUveGVfc3Bpbi5oDQo+IGluZGV4IGMyMTk5ZDBhYS4uOTI0NzllYjQ1
IDEwMDY0NA0KPiAtLS0gYS9saWIveGUveGVfc3Bpbi5oDQo+ICsrKyBiL2xpYi94ZS94ZV9zcGlu
LmgNCj4gQEAgLTM1LDYgKzM1LDcgQEAgdm9pZCB4ZV9zcGluX2ZyZWUoaW50IGZkLCBzdHJ1Y3Qg
aWd0X3NwaW4gKnNwaW4pOw0KPiAgICogVXNlZCB0byBwZXJmb3JtIG1lbW9yeSBjb3B5IHdpdGgg
dGhlIHNwaW5uZXIuDQo+ICAgKi8NCj4gIHN0cnVjdCB4ZV9zcGluX21lbV9jb3B5IHsNCj4gKwlp
bnQgZmQ7DQo+ICAJc3RydWN0IGJsdF9tZW1fb2JqZWN0ICpzcmM7DQo+ICAJc3RydWN0IGJsdF9t
ZW1fb2JqZWN0ICpkc3Q7DQo+ICAJdWludDY0X3Qgc3JjX29mZnNldDsNCj4gZGlmZiAtLWdpdCBh
L3Rlc3RzL2ludGVsL3hlX3JlbmRlcl9jb3B5LmMgYi90ZXN0cy9pbnRlbC94ZV9yZW5kZXJfY29w
eS5jDQo+IGluZGV4IGFlMmJiNmY1OS4uZGZmY2UxZTdmIDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9p
bnRlbC94ZV9yZW5kZXJfY29weS5jDQo+ICsrKyBiL3Rlc3RzL2ludGVsL3hlX3JlbmRlcl9jb3B5
LmMNCj4gQEAgLTQ1OCw2ICs0NTgsNyBAQCBzdGF0aWMgdm9pZCBtZW1fY29weV9idXN5KGludCBm
ZCwgc3RydWN0DQo+IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmh3ZSwgdWludA0KPiAg
CWludDMyX3Qgc3JjX2hhbmRsZSwgZHN0X2hhbmRsZTsNCj4gIAlzdHJ1Y3QgYmx0X21lbV9vYmpl
Y3Qgc3JjLCBkc3Q7DQo+ICAJc3RydWN0IHhlX3NwaW5fbWVtX2NvcHkgbWVtX2NvcHkgPSB7DQo+
ICsJCS5mZCA9IGZkLA0KPiAgCQkuc3JjID0gJnNyYywNCj4gIAkJLmRzdCA9ICZkc3QsDQo+ICAJ
fTsNCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX3NwaW5fYmF0Y2guYyBiL3Rlc3RzL2lu
dGVsL3hlX3NwaW5fYmF0Y2guYw0KPiBpbmRleCBlZTJkMGVjM2YuLjYxNTM3MzkxNyAxMDA2NDQN
Cj4gLS0tIGEvdGVzdHMvaW50ZWwveGVfc3Bpbl9iYXRjaC5jDQo+ICsrKyBiL3Rlc3RzL2ludGVs
L3hlX3NwaW5fYmF0Y2guYw0KPiBAQCAtMzMzLDYgKzMzMyw3IEBAIHN0YXRpYyB2b2lkIHhlX3Nw
aW5fbWVtX2NvcHlfcmVnaW9uKGludCBmZCwgc3RydWN0DQo+IGRybV94ZV9lbmdpbmVfY2xhc3Nf
aW5zdGFuY2UNCj4gIAlpbnQzMl90IHNyY19oYW5kbGUsIGRzdF9oYW5kbGU7DQo+ICAJc3RydWN0
IGJsdF9tZW1fb2JqZWN0IHNyYywgZHN0Ow0KPiAgCXN0cnVjdCB4ZV9zcGluX21lbV9jb3B5IG1l
bV9jb3B5ID0gew0KPiArCQkuZmQgPSBmZCwNCj4gIAkJLnNyYyA9ICZzcmMsDQo+ICAJCS5kc3Qg
PSAmZHN0LA0KPiAgCX07DQo=
