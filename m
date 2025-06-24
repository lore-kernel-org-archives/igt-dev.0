Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35EBAC77B7C
	for <igt-dev@archiver.kernel.org>; Tue, 24 Jun 2025 03:52:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 517A210E4AB;
	Tue, 24 Jun 2025 03:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JSSTq8S5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE1110E4AB
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Jun 2025 03:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750737146; x=1782273146;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pxwM1PFvNIX0VQ90qj6VRzv+bmxg8XZYQriou48Zi/U=;
 b=JSSTq8S5J5lWfbSQYURAoWXNWqYycsCYhx0ZvxLg/szCj0IM6lqm7/0o
 htc9Qocf4juhrpWAaLb0uORE/uE8orikMe9juj5X1WdFuS3BIrwamAycM
 bi7cfcpzO98vKKoSz2a7hNEE87ltE1pWph77N2IQJ7130pxjHouTxWb81
 aQ2tyDOeHYHBAPA2tB0rB/V99uZggu77rfkNGN7lhE8H6Oj5K0OtJw6wr
 cMjng5MV/P4U8JmIz6kHBMzt7m9Io9LA6nRh4cGTGEHaTJIkS9rsvlGGr
 +Kv1wpSwecNjnh2j4B6kI9eeAwDryQWeVlgbaXDAQPLAlJjg3YBNF6Vw1 Q==;
X-CSE-ConnectionGUID: LvBPUGLhQUiPyHzGEKMaBw==
X-CSE-MsgGUID: zzDpM/LQTj6QctVz3nprTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="64021077"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="64021077"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 20:52:24 -0700
X-CSE-ConnectionGUID: noa9PqusSTSbRs5kM90kUg==
X-CSE-MsgGUID: i7Hxb9ImTaq22m4sti+Euw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="151215598"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 20:52:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 20:52:24 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 20:52:24 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.79)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 20:52:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AaP6jaohTq6YZVm0L+ii58fa6Fx+kvNn2bhzG7sCa2i4vUCXg2oM0Mpu2iNTkrRwGBZdkOFdFde9YVdyPCDyS18eEM2V3MQiJZLa44Rc57QHK23MbC64vpP2+QsicJf/BFMNe8Fjye8hKOO2RlsDzQ3KU+rX1QR6KcV1zyE829mkqeQAHWBH/9VaRbrC3HOrxve6HleABf6kDh87GrlGLEs+NSS/OSECdB5v4wlLD7McWYkhUuNqyMxnW7DQwa0bzqm2uJrFn5MEJqILTuen9PabaY/b7d7dotFf0lskBLJ9dQeh+8pMOmGaWiKr5QKFIP25LsO9y4L3dC0EyUbi0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pxwM1PFvNIX0VQ90qj6VRzv+bmxg8XZYQriou48Zi/U=;
 b=Uhw2VR4cN1BlYve1KB8AxHSOsqqW6A3EBgon1UjXH5DrJdiSGbLSCw7iFmYHdr1I/wuw4PXMvzU+ouc2bhG6aAizntfposO6vTzqyQOsQeITeZ3HERc/2P6syR/KPlYo46kvWMrKc3cUaJmjZqD26X8bdEvD4HFHWEtaW4T0xaP6+O0pgOvharMpKVQc2xAs0Ss7MIMtiWiveaNWrIDz2My0F6MTWjVo3oN5FG5tJ3neSM1OVl98GOvVSoD5ZALJKDJ81YncBc1t52/tZFVrlc04HVQqpThkH2KNHXjsw673TkaOBuWjxCQTh8X6qgTf74OYg/2b9cKXTAQ6Duxe0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by SA3PR11MB8120.namprd11.prod.outlook.com (2603:10b6:806:2f3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 03:52:16 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%5]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 03:52:16 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
Subject: RE: [RFC] [PATCH v1 1/2] tests/intel/kms_pm_vrsr: Add test to check
 primary panel
Thread-Topic: [RFC] [PATCH v1 1/2] tests/intel/kms_pm_vrsr: Add test to check
 primary panel
Thread-Index: AQHb5HLm9Ra81gsSqEOcBCvLgTZG9rQRqXjQ
Date: Tue, 24 Jun 2025 03:52:16 +0000
Message-ID: <PH7PR11MB6053C05E5F7FE11FDAA3E1A5E778A@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20250623191230.66611-1-mohammed.thasleem@intel.com>
 <20250623191230.66611-2-mohammed.thasleem@intel.com>
In-Reply-To: <20250623191230.66611-2-mohammed.thasleem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|SA3PR11MB8120:EE_
x-ms-office365-filtering-correlation-id: d5dfde6c-f1d1-4f9e-965f-08ddb2d28305
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?dWtndStsYWk2dDRCWE1Ha1B4NW9iK0tuMTRlbXNiaGJJS1FaekhkM2YwZFZD?=
 =?utf-8?B?ME9FeXlVYVVWLzQ1dzQ0S2g0WnJXM2JiV2FRVldpL0RSakhtRUhpa2tZb2lp?=
 =?utf-8?B?L04vUzdIUzZDdU1yWVhqV0hoK0hZQ0IxaVJvaWlDR3hRNE9XQmpFV242anNk?=
 =?utf-8?B?aWtBMUEwMDZpWWJJU1p6R1hNWHp4cWlaMCtCR3FLZHRUQkpxaWJCWjN6RTZG?=
 =?utf-8?B?aWNlYzNhaU4vQk5yTVZvMDJGRWdmN2ZuSzljNEZFRzdiWmdsUUNuaU5JL2h3?=
 =?utf-8?B?eGdTZ1hDK2M4RDUrclhSdm5zMG9IZ3RSOVoxY3o2NE1SdlFDenZON04vRUpK?=
 =?utf-8?B?VDRqeGxNZHIwUDJtRFprSVpyMlFUaGdiYTRJaEFzekV5SU1QNWxHL0FRTGtz?=
 =?utf-8?B?dnFTeG1KNmJQaUd6enJkRVpqYXFGVXhHS2Q2aDJsSnpnSVY1d1MyNlliNjJi?=
 =?utf-8?B?aUF4eXB5Nk9LYVY1WktlQkdTWC9vaG12SlQyallEMVB4cVViTDNzV0FsNzRp?=
 =?utf-8?B?eG1aQi9RTFA5NDZ0SFRTYUJWZ1l1R2RWTHdPbWY3bE9iMFRXZTNjNEo4bnlX?=
 =?utf-8?B?eU1rZXNRT2xIaThvV3Y2OXprbjQzSjFFdTBreFdFVnVkSEVVVTlMMEN1L3E0?=
 =?utf-8?B?UjFnem9yck5VNWtPcEZYK2J5ZDRvUWlvcmQxaWV5WlhwUXo1K0w3NHVaeElD?=
 =?utf-8?B?Lzl0VXF0aktzVDZzSHMxUEZEQy91U244VnJOUU4rZXd2N2loS3lWN2pkTlNL?=
 =?utf-8?B?ZlZLaTAvcHl3Z2FSS01mUTdRaXpKWThXeG9nK0psV3hJUFI2VlZVVUJ3cUt4?=
 =?utf-8?B?NFc1eXlBT3grcTN2T2VucnV2dzgxQ0UwMlFxaVF6STNtZ3A0a3Qxa2JYTVdL?=
 =?utf-8?B?aDhJK241NDlvY003VlVPTVFYdlBMT2FzNEVqazhZMG4ralpaWkt5Nm9BdjM5?=
 =?utf-8?B?QjJaaEt1R3h6Z0dFNHMzMlJCZE05YS83akh4QnI2eFE1RGZ6dFZYMzFhOS9H?=
 =?utf-8?B?Y1gyZ05ucVFsL2J1Q0pmSlJvQTBteG5zMlo0MWJrdnNpNXloNFlCblNadEcz?=
 =?utf-8?B?VGpjYXNkcklzaXl0VTN2dzRGNXJncFNydkkrbzluS3pYTEtRSlpvQW11bzUz?=
 =?utf-8?B?WmhkdXd4ZzhKTFlnTnBENzhJa1pMUDYyNEErUE1laERqdHFCb085cUZBVXR0?=
 =?utf-8?B?eFJoT0VZcEoxSDBxck9oSzM4Y0lUY1o2ODdwYTdWenFDd0VvK0NlUGU3bzRh?=
 =?utf-8?B?WElqZEFFNlVSdmxmNmM3bkpod0srV29OWDlFM2tIK1grTnEzemxIKzRoSC9G?=
 =?utf-8?B?SmlhOTVIbEl2d2x6TVZ0WU5tODBEbW1KK0JtbFJIcUUxUmNhUXcyTXZESjZW?=
 =?utf-8?B?YWw4RnMwQytOY1F2cnZFZ0RETVQwSzNNVXNFeHRFK1R5WnYyODJVOVErR3lh?=
 =?utf-8?B?eGVsWGhaQzVxNGhFdURWZGdReFFETFdVZGhvV3ltU1NsNDRNejZuSHN5YjZw?=
 =?utf-8?B?cGRLbDBSRVlzaGxtcnpDM3dSdmdnUXZwRjdJbkhMWWE5VFJkcjZ2bloxMFhO?=
 =?utf-8?B?V3pwZ2dyNmlyaWRBaGxxQzBHc250Q2QvMWQ3dWx4SmpJN2dvNVN0YUlQcTVM?=
 =?utf-8?B?NFpaM0Z4eGdiOVNQUlIrWllHQ3N2SWhCajJpRXJnU24zSkd4WVl1Vmd6SHZp?=
 =?utf-8?B?c25ScHBXWk5RVVJpWHZNbjlLZWg5cUcrUDdYMDZReEtjU3VSTDN3TVhib0Za?=
 =?utf-8?B?VXorYkxzRzQ2ZHE5MnBGNWthZ0w0enV0c3JkMGxvQ2MrbVhWakx2ZXhSdTgz?=
 =?utf-8?B?bldCd0JFOXJtY3VQTUtXWmFNYVhOdjJNOFVoSzV4TG5kaGV0TjRkVGI2V05L?=
 =?utf-8?B?RXpva0Z1MjArcDQvajM3WHhVQmhXK0VmN1FKMVZVdUs5bE8zZVJwQ21Kei9G?=
 =?utf-8?B?ektMY2tRLzBTN3RvdUx1Z1FWSWRQNGRUNlB2bCtsNWhZZCtrNzlHUWhPTkJU?=
 =?utf-8?Q?R5ZTQLkRlo62Top31q129cLODuxaqs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SUYrdXhuak9XNi9odUFlMm5aOGx1L2hrMlVpNHBCQlNEUEFWM0Fod2Z1ek9S?=
 =?utf-8?B?allzZ04rVDBUOFdGWG5rOE1PTEdiYVFOOHEybHlva1hHS0FkQkNiSzFhaEhw?=
 =?utf-8?B?RDJLSENjL09rSkc5NmNoZTJkVWlHdTBrN0dHNXdmSnowazRXN2dhR0JTOTFl?=
 =?utf-8?B?eUk4TGw1YmlweXlQSlQ3dUlqVkMwSXZHVGpiRHV4dnNhbEcrOFl2ZVVMMUZY?=
 =?utf-8?B?czF0TWZYcVRXWnJseTRic3JJa1FOWXgwZTh3NjBJcWZKV1c0LzNXdldsU3E3?=
 =?utf-8?B?RW5nQ0EySGc1QWVUS2RqS0REZzl5T3VHTGhMUFNkWnNVY0xLUlF6R0YyM3ly?=
 =?utf-8?B?RC9IcWwvQWdLOGhQVCtoYlBDUGgyR0lzZ1poMUZNQmhmN0pIRDQ2d3lPdGU3?=
 =?utf-8?B?TmlvTjFza25aNXkxUTcydDhHQXFjYUZlOTFrc0hEQzl1MkZkSUtrUTFQNHBB?=
 =?utf-8?B?MnlqaEsxWU5QdnIzazQrbFRCSDNaMDJWN2VHMW9MUUlXTWwrcmFFVTlKa2Er?=
 =?utf-8?B?YlVQZnlicFRlU0pXSXIvK2dxVGg0bXdRakdYS240ZlhsWDB0SVE0WmRmQWts?=
 =?utf-8?B?d2tIbzFGQjlnTTRkQk9FNi9sRUtHOEZjcTVrckpOV1QxM01OckxEQzRxckhG?=
 =?utf-8?B?czNlMUpTRmt5WEN0cU9Da1hiRXYvRmQrVW9qMDJaYWw3QUc2SElaUDFOdkdn?=
 =?utf-8?B?c01QRitaejkvUDhuaUxQUzVoV3gzNW02RHhBUUhaNS85UzhMdm0ydm5BN3Bt?=
 =?utf-8?B?Qk1wbzVZTWFXYUJsR1cxWkN4SmJ3TGFqVmRuSTVuYktMYU80NGx3NW16Zk1Q?=
 =?utf-8?B?aG5mME15NFFRTTZBa3pMU3Y2aXVGblhxdXQ0a3g3M0U2ZWI0SlFlSDZXZ0ds?=
 =?utf-8?B?VytZQU1hNElrcFZZUzBQVGJXTEN5VDFyWDZkUmx2Rk5vMmk5Zmc4blU0eHBv?=
 =?utf-8?B?Z2gxaEZnZk9MSTQvV1luWDZrbXNtZU81L2tZMFBZM1RGeHgwcE5jQUZ3N2NW?=
 =?utf-8?B?UEN2Uk02djZwVUxaWG56TnF3dzdFZTZQaWs2NzJHSFE0RWRkRnJHWmIwMkFG?=
 =?utf-8?B?UTJVS1VjNnZCSElSUU4zZlBWS1Q0dG5QaUNMb1E3M1FIM2hhZ0VIR0wwQkJo?=
 =?utf-8?B?Y2h3dXY5cklnbExLSTk3YnNxcXprL1VkWDF1MmFDYVRLRW4xR1hqN0RtSjFM?=
 =?utf-8?B?QUx0enJVZ3c1WkNGb1Y5Sk9wdCtqLzFtQS9vcXQ5bWFScTZDbW5oYWYrbVhW?=
 =?utf-8?B?ekRVZFRPKzNvczVtVjRJVmlwRkF2SW1aRzVzWGV6R24rSnN0UDh3Wmxod0x0?=
 =?utf-8?B?RFlENmY3Rjd5eFpTWUpqY3pkV2tOMUNLNEN3dVNVTkRMazBJU1lmU0M4cFRR?=
 =?utf-8?B?TUR2VEs5YVBoR0lWbHZLc3pkdUhRYTZPRmNCWm9OQksvWE16UmpWdUllUU9u?=
 =?utf-8?B?c3FZK2xsdWVqalJkalI4Rkc5bTRZd0ZRSExoSENkKzNrT0JwSEo0QWlBYzNL?=
 =?utf-8?B?Z3pvVnJqTEtJY3ZuUzhPdXFTeXlQcW9LdXFkNFVGNHpKNEw3cnFRdDdoV242?=
 =?utf-8?B?L1NuUmtrQnE4N2ZYclVSdGlxSlg5UXR2UDJKQjZMdWV3L0wxUmwyaGttTzhH?=
 =?utf-8?B?YmI5Qm5CQ2xXVU9TdWsxbDRpRndzUHRVMExLclEramRkb3F4UGw5VFBXRkZC?=
 =?utf-8?B?ZzJoUkxJUndCTTdNWGpYUFk5TWUrdkROaDJ1eEJ3eU9KekdWQXp6VmNzcEFT?=
 =?utf-8?B?WVhEc3VmYlRwUjVGenNIajdOc2NZKzRUUXVrd3ZhZ0xxRDZCOE5ublBFNjVD?=
 =?utf-8?B?SzZsK29SeUN2UEV4UE96WFVrRDR0WkcvT2xjdWlYa2pKdHc2em8vUjZmeXND?=
 =?utf-8?B?WW00ZnJZY1lOcVNDNkgxSFJ0UVVhdU1kTkx1ZUVickRjcGhkWkJFcTFXbDlT?=
 =?utf-8?B?VTlHR3BiNCtsZ2pPYncvMDVuajI2bmVUVVVzZVZvVjhjb0VWNERyM0Zraytu?=
 =?utf-8?B?aHNSUHFEdElxYWpocXZGdkkvU1JwSlJlSlk4OVpJR1RZUC9Iejl6Z243YnhD?=
 =?utf-8?B?QjJRV3VjT2xUWmdUd0kwTUR2OVk3Q2ZtZkx0a0hjdnFlWktJSEllcXN0Yytz?=
 =?utf-8?Q?/yo7vS2+HEibL2NeThEYgrKp3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5dfde6c-f1d1-4f9e-965f-08ddb2d28305
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 03:52:16.7344 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bJw06esKHDqKCP6ACBaGMvdZarF58xyymE5KnjlsFC/pHpPSuvqjc6FVG3otwgfRalYVJ7uhj2ZcYwszyZpeIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8120
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

SGkgVGhhc2xlZW0sDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0
LWRldiA8aWd0LWRldi1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9m
IE1vaGFtbWVkDQo+IFRoYXNsZWVtDQo+IFNlbnQ6IFR1ZXNkYXksIEp1bmUgMjQsIDIwMjUgMTI6
NDIgQU0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBUaGFzbGVl
bSwgTW9oYW1tZWQgPG1vaGFtbWVkLnRoYXNsZWVtQGludGVsLmNvbT4NCj4gU3ViamVjdDogW1JG
Q10gW1BBVENIIHYxIDEvMl0gdGVzdHMvaW50ZWwva21zX3BtX3Zyc3I6IEFkZCB0ZXN0IHRvIGNo
ZWNrDQo+IHByaW1hcnkgcGFuZWwNCj4gDQo+IFRoaXMgdGVzdCBkZXRlY3QgcHJpbWFyeSBjb25u
ZWN0ZWQgcGFuZWwgYW5kIGRvZXMgdGhlIGZsaXAgb24gaXQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBNb2hhbW1lZCBUaGFzbGVlbSA8bW9oYW1tZWQudGhhc2xlZW1AaW50ZWwuY29tPg0KPiAtLS0N
Cj4gIHRlc3RzL2ludGVsL2ttc19wbV92cnNyLmMgfCAxMzIgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysNCj4gIHRlc3RzL21lc29uLmJ1aWxkICAgICAgICAgfCAgIDEgKw0K
PiAgMiBmaWxlcyBjaGFuZ2VkLCAxMzMgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IHRlc3RzL2ludGVsL2ttc19wbV92cnNyLmMNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9p
bnRlbC9rbXNfcG1fdnJzci5jIGIvdGVzdHMvaW50ZWwva21zX3BtX3Zyc3IuYyBuZXcgZmlsZSBt
b2RlDQo+IDEwMDY0NCBpbmRleCAwMDAwMDAwMDAuLjY3MTYyMWE2Ng0KPiAtLS0gL2Rldi9udWxs
DQo+ICsrKyBiL3Rlc3RzL2ludGVsL2ttc19wbV92cnNyLmMNCj4gQEAgLTAsMCArMSwxMzIgQEAN
Cj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQNCj4gKy8qDQo+ICsgKiBDb3B5cmln
aHQgwqkgMjAyNSBJbnRlbCBDb3Jwb3JhdGlvbg0KPiArICovDQo+ICsNCj4gKy8qKg0KPiArICog
VEVTVDoga21zIHBtIHZyc3INCj4gKyAqIENhdGVnb3J5OiBEaXNwbGF5DQo+ICsgKiBEZXNjcmlw
dGlvbjogVGVzdHMgdG8gdmFsaWRhdGUgdnJhbSBzZWxmIHJlZnJlc2ggYWxvbmcgd2l0aCBkaXNw
bGF5IGZsaXBzLg0KPiArICogRHJpdmVyIHJlcXVpcmVtZW50OiB4ZQ0KPiArICogTWVnYSBmZWF0
dXJlOiBEaXNwbGF5IFBvd2VyIE1hbmFnZW1lbnQgICovDQo+ICsNCj4gKyNpbmNsdWRlIDxmY250
bC5oPg0KPiArDQo+ICsjaW5jbHVkZSAiaWd0LmgiDQo+ICsjaW5jbHVkZSAiaWd0X3N5c2ZzLmgi
DQo+ICsNCj4gKy8qKg0KPiArICogU1VCVEVTVDogdnJhbS1zZWxmLXJlZnJlc2gNCj4gKyAqIERl
c2NyaXB0aW9uOiBUaGlzIHRlc3QgdmFsaWRhdGVzIGRpc3BsYXkgZmxpcHMgd2l0aCB2cmFtIHNl
bGYNCj4gK3JlZnJlc2gNCj4gKyAqDQo+ICsgKi8NCj4gKw0KPiArSUdUX1RFU1RfREVTQ1JJUFRJ
T04oIlRoaXMgdGVzdCB2YWxpZGF0ZXMgZGlzcGxheSBmbGlwcyB3aXRoIHZyYW0gc2VsZg0KPiAr
cmVmcmVzaC4iKTsNCj4gKw0KPiArYm9vbCBrbXNfcG9sbF9zYXZlZF9zdGF0ZTsNCj4gKw0KPiAr
dHlwZWRlZiBzdHJ1Y3Qgew0KPiArCWludCBmZF94ZTsNCj4gKwlpbnQgZGVidWdmc19mZDsNCj4g
Kwl1aW50MzJfdCBkZXZpZDsNCj4gKwljaGFyICpkZWJ1Z2ZzX2R1bXA7DQo+ICsJaWd0X2Rpc3Bs
YXlfdCBkaXNwbGF5Ow0KPiArCXN0cnVjdCBpZ3RfZmIgZmJfd2hpdGU7DQo+ICsJZHJtTW9kZU1v
ZGVJbmZvICptb2RlOw0KPiArCWlndF9vdXRwdXRfdCAqb3V0cHV0Ow0KPiArfSBkZXZpY2VfdDsN
Ckl0IHdvdWxkIGJlIG1vcmUgY29uc2lzdGVudCB0byBhbGlnbiB0aGUgbmFtaW5nIHdpdGggdGhl
IGV4aXN0aW5nIGNvbnZlbnRpb24sIA0Kc3VjaCBhcyBkYXRhX3QsIHJhdGhlciB0aGFuIGludHJv
ZHVjaW5nIGRldmljZV90Lg0KDQo+ICsNCj4gK3N0YXRpYyB2b2lkIHZyYW1fc2VsZl9yZWZyZXNo
KGRldmljZV90ICpkZXZpY2UpOw0KPiArDQo+ICtzdGF0aWMgdm9pZCBkaXNwbGF5X2ZpbmkoZGV2
aWNlX3QgKmRldmljZSkgew0KPiArCWlndF9kaXNwbGF5X2ZpbmkoJmRldmljZS0+ZGlzcGxheSk7
DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyB2b2lkIHNldHVwX3ByaW1hcnkoZGV2aWNlX3QgKmRldmlj
ZSkgew0KPiArCWlndF9wbGFuZV90ICpwcmltYXJ5Ow0KPiArDQo+ICsJcHJpbWFyeSA9IGlndF9v
dXRwdXRfZ2V0X3BsYW5lX3R5cGUoZGV2aWNlLT5vdXRwdXQsDQo+ICsJCQkJCSAgICBEUk1fUExB
TkVfVFlQRV9QUklNQVJZKTsNCj4gKwlpZ3RfcGxhbmVfc2V0X2ZiKHByaW1hcnksIE5VTEwpOw0K
PiArCWlndF9jcmVhdGVfY29sb3JfZmIoZGV2aWNlLT5mZF94ZSwNCj4gKwkJCSAgICBkZXZpY2Ut
Pm1vZGUtPmhkaXNwbGF5LCBkZXZpY2UtPm1vZGUtPnZkaXNwbGF5LA0KPiArCQkJICAgIERSTV9G
T1JNQVRfWFJHQjg4ODgsDQo+ICsJCQkgICAgRFJNX0ZPUk1BVF9NT0RfTElORUFSLA0KPiArCQkJ
ICAgIDEuMCwgMS4wLCAxLjAsDQo+ICsJCQkgICAgJmRldmljZS0+ZmJfd2hpdGUpOw0KPiArCWln
dF9wbGFuZV9zZXRfZmIocHJpbWFyeSwgJmRldmljZS0+ZmJfd2hpdGUpOw0KPiArCWlndF9kaXNw
bGF5X2NvbW1pdCgmZGV2aWNlLT5kaXNwbGF5KTsNCj4gK30NCj4gKw0KPiArc3RhdGljIHZvaWQg
ZGV0ZWN0X3ByaW1hcnlfb3V0cHV0KGRldmljZV90ICpkZXZpY2UpIHsNCj4gKwlpZ3RfZGlzcGxh
eV90ICpkaXNwbGF5ID0gJmRldmljZS0+ZGlzcGxheTsNCj4gKwlpZ3Rfb3V0cHV0X3QgKm91dHB1
dDsNCj4gKwllbnVtIHBpcGUgcGlwZTsNCj4gKw0KPiArCWZvcl9lYWNoX3BpcGVfd2l0aF92YWxp
ZF9vdXRwdXQoZGlzcGxheSwgcGlwZSwgb3V0cHV0KSB7DQo+ICsJCWRybU1vZGVDb25uZWN0b3JQ
dHIgYyA9IG91dHB1dC0+Y29uZmlnLmNvbm5lY3RvcjsNCj4gKw0KPiArCQlpZiAoYy0+Y29ubmVj
dGlvbiAhPSBEUk1fTU9ERV9DT05ORUNURUQpDQo+ICsJCQljb250aW51ZTsNCj4gKw0KPiArCQlp
Z3RfZGlzcGxheV9yZXNldChkaXNwbGF5KTsNCj4gKwkJaWd0X291dHB1dF9zZXRfcGlwZShvdXRw
dXQsIHBpcGUpOw0KPiArDQo+ICsJCWlmICghaW50ZWxfcGlwZV9vdXRwdXRfY29tYm9fdmFsaWQo
ZGlzcGxheSkpDQo+ICsJCQljb250aW51ZTsNCj4gKw0KPiArCQlkZXZpY2UtPm91dHB1dCA9IG91
dHB1dDsNCj4gKwkJZGV2aWNlLT5tb2RlID0gaWd0X291dHB1dF9nZXRfbW9kZShvdXRwdXQpOw0K
PiArDQo+ICsJCWJyZWFrOw0KPiArCX0NCklmIG5vIHZhbGlkIG91dHB1dCBpcyBmb3VuZCwgc2tp
cCB0aGUgdGVzdCBncmFjZWZ1bGx5Lg0KVGhpcyBlbnN1cmVzIHRoZSB0ZXN0IG9ubHkgcnVucyB3
aGVuIGFwcHJvcHJpYXRlIGhhcmR3YXJlIGlzIHByZXNlbnQuDQoNClNvbWV0aGluZyBsaWtlIHRo
aXMgY2FuIGJlIGFkZGVkDQppZ3RfcmVxdWlyZV9mKGRldmljZS0+b3V0cHV0ICYmIGRldmljZS0+
bW9kZSwgIk5vIHZhbGlkIGNvbm5lY3RlZCBvdXRwdXQgZm91bmRcbiIpOw0KDQo+ICt9DQpVc2Ug
YmxhbmsgbGluZSBoZXJlDQoNCj4gK3N0YXRpYyB2b2lkIGNsZWFudXAoZGV2aWNlX3QgKmRldmlj
ZSkNCj4gK3sNCj4gKwlpZ3RfcGxhbmVfdCAqcHJpbWFyeTsNCj4gKw0KPiArCXByaW1hcnkgPSBp
Z3Rfb3V0cHV0X2dldF9wbGFuZV90eXBlKGRldmljZS0+b3V0cHV0LA0KPiArCQkJCQkgICAgRFJN
X1BMQU5FX1RZUEVfUFJJTUFSWSk7DQpJIHRoaW5rIHRoaXMgcHJpbWFyeSBwbGFuZSBzdHJ1Y3R1
cmUgY2FuIGJlIHVzZWQgaW4gZGV2aWNlX3Qgc3RydWN0dXJlLiBTaW5jZSBpdCBpcyBpbml0aWFs
aXplZCANCmluIGRldGVjdF9wcmltYXJ5X291dHB1dCBmdW5jdGlvbiwgc28gbm8gbmVlZCB0byBk
ZWNsYXJlIGl0IGFnYWluIGhlcmUuDQoNCj4gKwlpZ3RfcGxhbmVfc2V0X2ZiKHByaW1hcnksIE5V
TEwpOw0KPiArCWlndF9kaXNwbGF5X2NvbW1pdCgmZGV2aWNlLT5kaXNwbGF5KTsNCj4gKwlpZ3Rf
cmVtb3ZlX2ZiKGRldmljZS0+ZmRfeGUsICZkZXZpY2UtPmZiX3doaXRlKTsgfQ0KPiArDQo+ICsN
CkF2b2lkIGV4dHJhIGJsYW5rIGxpbmUNCg0KPiArc3RhdGljIHZvaWQgdnJhbV9zZWxmX3JlZnJl
c2goZGV2aWNlX3QgKmRldmljZSkgew0KPiArCWRldGVjdF9wcmltYXJ5X291dHB1dChkZXZpY2Up
Ow0KPiArCXNldHVwX3ByaW1hcnkoZGV2aWNlKTsNCj4gKwljbGVhbnVwKGRldmljZSk7DQo+ICt9
DQo+ICsNCj4gK2lndF9tYWluDQo+ICt7DQo+ICsJZGV2aWNlX3QgZGV2aWNlID0ge307DQo+ICsN
Cj4gKwlpZ3RfZml4dHVyZSB7DQo+ICsJCWRldmljZS5mZF94ZSA9IGRybV9vcGVuX2RyaXZlcl9t
YXN0ZXIoRFJJVkVSX0lOVEVMIHwNCj4gRFJJVkVSX1hFKTsNCj4gKwkJZGV2aWNlLmRlYnVnZnNf
ZmQgPSBpZ3RfZGVidWdmc19kaXIoZGV2aWNlLmZkX3hlKTsNCj4gKwkJaWd0X3JlcXVpcmUoZGV2
aWNlLmRlYnVnZnNfZmQgIT0gLTEpOw0KU2tpcCB0aGUgdGVzdCB3aXRoIHByb3BlciBza2lwIG1l
c3NhZ2UgYXMgYWJvdmUNCg0KPiArCQlrbXN0ZXN0X3NldF92dF9ncmFwaGljc19tb2RlKCk7DQo+
ICsJCWRldmljZS5kZXZpZCA9IGludGVsX2dldF9kcm1fZGV2aWQoZGV2aWNlLmZkX3hlKTsNCj4g
KwkJaWd0X2Rpc3BsYXlfcmVxdWlyZSgmZGV2aWNlLmRpc3BsYXksIGRldmljZS5mZF94ZSk7DQo+
ICsJfQ0KPiArDQo+ICsJaWd0X2Rlc2NyaWJlKCJUaGlzIHRlc3QgdmFsaWRhdGVzIGRpc3BsYXkg
ZmxpcHMgd2l0aCB2cmFtIHNlbGYgcmVmcmVzaCIpOw0KPiArCWlndF9zdWJ0ZXN0KCJ2cmFtLXNl
bGYtcmVmcmVzaCIpIHsNCj4gKwkJdnJhbV9zZWxmX3JlZnJlc2goJmRldmljZSk7DQo+ICsJfQ0K
PiArDQo+ICsJaWd0X2ZpeHR1cmUgew0KPiArCQljbG9zZShkZXZpY2UuZGVidWdmc19mZCk7DQo+
ICsJCWRpc3BsYXlfZmluaSgmZGV2aWNlKTsNCj4gKwkJZHJtX2Nsb3NlX2RyaXZlcihkZXZpY2Uu
ZmRfeGUpOw0KPiArCX0NCj4gKw0KPiArCWlndF9leGl0KCk7DQo+ICt9DQo+IGRpZmYgLS1naXQg
YS90ZXN0cy9tZXNvbi5idWlsZCBiL3Rlc3RzL21lc29uLmJ1aWxkIGluZGV4IDU1YmNmNTdlYy4u
M2I4ZWRmZTg5DQo+IDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9tZXNvbi5idWlsZA0KPiArKysgYi90
ZXN0cy9tZXNvbi5idWlsZA0KPiBAQCAtMjY1LDYgKzI2NSw3IEBAIGludGVsX2ttc19wcm9ncyA9
IFsNCj4gIAkna21zX3BtX2RjJywNCj4gIAkna21zX3BtX2xwc3AnLA0KPiAgCSdrbXNfcG1fcnBt
JywNCj4gKyAgICAgICAgJ2ttc19wbV92cnNyJywNCj4gIAkna21zX3BzcicsDQo+ICAJJ2ttc19w
c3IyX3NmJywNCj4gIAkna21zX3BzcjJfc3UnLA0KPiAtLQ0KPiAyLjI1LjENCg0K
