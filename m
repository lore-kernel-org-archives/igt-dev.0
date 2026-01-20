Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CFA4D26292
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 19:11:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EA6F10E178;
	Tue, 20 Jan 2026 19:11:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hfakfLCA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870E310E178
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 19:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768936282; x=1800472282;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qCWqiv+XvXl4p8FllBzgBknsqDI9MFa+zZxgEQQ7b2A=;
 b=hfakfLCATC4mqQOVY343dBcLNweXDhYbPOfnOBFd44uh21wRHMg3jbTV
 b1B9siKYh4X8uJXy/I4g8THT/BT1PxsV0jaGTZORshqlOzmIaOa4dJqGh
 SVzBw0ydUi2rMArR0UFEejjRwr9lZiUKb9t29Rrb89VN3eAgCqnAGUAjq
 4j7ypkYRo9EnqBlE6g9NFORxZiqMccfDzds7UACbQcCHMQOSSwh/21ab4
 bAyG9xwoKzrcSU7g/wofcRYr4FAcLxWz0prFSMR7Qv6T2CkixnBgxPgpK
 YbFgommjhMtqmxgkZUOjfxvL+LLFz5RIrkE+/sPiFZipQ+MJGL6VBeNFF A==;
X-CSE-ConnectionGUID: dnmgl4KpTm+ugtoi+gACOg==
X-CSE-MsgGUID: ptmp+SN4QB69C44OjtEe5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="92822438"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="92822438"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 11:11:21 -0800
X-CSE-ConnectionGUID: DJaDhKnITIWyWQ1avnboVg==
X-CSE-MsgGUID: puqOHTz4R0C7GWXSKmCglw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="211076718"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 11:11:21 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 11:11:20 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 11:11:20 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.8) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 11:11:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fYtnvMLlNSV40dPOLud/ieNWwj6H7Uq+zqtOds/s2RzVGoEod4voj1dbvtTeka/ivEHf5CVVFEPpeeeoKu2BFcbNVMkviMsysOFo611EQZj3gEmHplzzP85rHIorFKsHLh6J53SDdM/oSQxtUnbZOlCYHmY3hitAc0TcqFmaeZnPN/DpN01kD5peeqZTTFFlvBUn0Vxumub7h5SUsd8P67aF0KVhoRu/x3vNNUAZIZImWncWZiFVXC19nFlfIjzdzGxGFJ+YYyra/lmGsmh7ShlhjjScnQCfTFlF46fKdZaMc1oAQTx6H4NsUCVzWtpriLk++Jbk/nvtiyNgKFD7lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qCWqiv+XvXl4p8FllBzgBknsqDI9MFa+zZxgEQQ7b2A=;
 b=CVjlS4cmVWeDM1apyLC8XgWvhjT/lS9lQvxrV7E/01WAX929MElzxwA0yl87+HOyray7O+iyFtBHN7Yln0UYw+gh6RzVURN20fC76XZxSddrSKkRA7XKPmy5GXZh61wUbugbqw1VAggUz9XIO1Sj/OoDUffbJrx+tzfnTpMF8bg0fOLaV4JhP4HSrGNBYH5JIJq+QN8wlMm2q+QqDKnvcCJ9oXsG9FRe6tnqVMZtNpL8iMBydxO0R7bGeqdMP67w4piXjYo6o1XGkQWNRtlVfIhL1CS3ZluO5Ohqu90AtAsxKgCG3sl5b5oMR+gBza3PBZRZoRoF1ICCplwwo/FtUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by PH0PR11MB5032.namprd11.prod.outlook.com (2603:10b6:510:3a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 19:11:05 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 19:11:05 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH 3/5] lib/xe/xe_legacy: Assert fd when CLOSE_FD is set
Thread-Topic: [PATCH 3/5] lib/xe/xe_legacy: Assert fd when CLOSE_FD is set
Thread-Index: AQHch0UTIDtm5krqM0eywMZi6kczFbVZt3iAgAG37hA=
Date: Tue, 20 Jan 2026 19:11:05 +0000
Message-ID: <DM4PR11MB5456B1FBD40A2B930AB64DBBEA89A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260115222938.330490-1-shuicheng.lin@intel.com>
 <20260117000456.26207-1-shuicheng.lin@intel.com>
 <20260117000456.26207-4-shuicheng.lin@intel.com>
 <20260119164523.44czpckj2wkn5zvz@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260119164523.44czpckj2wkn5zvz@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|PH0PR11MB5032:EE_
x-ms-office365-filtering-correlation-id: 9e17e327-3ea0-4f84-0ed0-08de5857a92b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ZEZEMlJLa051RXAzdWVQY05FWlhUQklrdlZyUCtPRjlvM0hadm5uM05WTk1H?=
 =?utf-8?B?MzZoSVZFT0NpSmptWkpCdG5RQWhxRGVXNllGY1grVUdXY1ZDVko5bWl1MCs0?=
 =?utf-8?B?dXJiU3FSSVduQ1JTOTJaeFArWlE3QU10OUQ4THJYQXdiYWR2ZVFBU3Vlek4r?=
 =?utf-8?B?WGxUVndHT0psTndoVUlUMDkwdmordzJIYzA1ZlpkTzJlV1VkT1JpZnZMS0ha?=
 =?utf-8?B?Sy92KzF4cjcxblFMUXc4a21NejFLT05zbVk4Um9oNjg2RkhhQm9WTmVKdEdH?=
 =?utf-8?B?VXEzS0xUdmc5cUVNd1FDRXgrWmZBZmczckM3TXFYS2ZaajZXWEtPcG5ianhC?=
 =?utf-8?B?RHNleGNhVVFtTm5YZ21PcHR2dDRJU1NJb3I3eWlGNFByd2hWYUxCRFBaWnlv?=
 =?utf-8?B?VUFSS2ltM3RCZVZlbEhUMG5wKzRJRVUvN0tLMmZMY1ZzeHNnRXB3UTFDN2lS?=
 =?utf-8?B?QmVBR1JnSUdQZVFhYVJEL1lrSW90REtxZWlEcXRHbW16VW9GRzhJQzZ3Q2Z0?=
 =?utf-8?B?WjF1eXZJdnhKTU5KTEpDWmRGTmZEVlBJY3N5cXMwL0hrVmxmZGs1T1JRK1pD?=
 =?utf-8?B?V0FYYUY0SFc0ck9DZDFTRnhvSlYvL0lteTZrMGN2SzZVK3pTZndkL1NvRnhF?=
 =?utf-8?B?QUpjQTZ3alF4Q2tlK1F6SnF5ZVRoNTNNYU9jaTJ2T3pQRHNWNGdocWQ2R3N0?=
 =?utf-8?B?SEs1alhYTXNTUXZTMlJ5enJvUWdTdEE2Zml2bkpwVGNlbk1Mb1JEL0NYSlBZ?=
 =?utf-8?B?QW1telRNOTh2R21oYTkrNFFIMmRqbFlSN3hYdWd5VGhXMk50dG1UemFOcUNx?=
 =?utf-8?B?U1lrQ0dIcC94OVcwWElLKzllbWtHcmM1bFd3WTlxd1lOYlMra2QvbzNkRVZl?=
 =?utf-8?B?a3pQOFAycE1VVWpUVnA2QWVDUjF0bjh0M09nTlpXajBLbmxNd0YvWUM3S3FV?=
 =?utf-8?B?QW11UEZZQU43UmRUcjVZS1RaZVRFVm9Ya2FuU0t0M1EwRThRTk03N3lPUnR0?=
 =?utf-8?B?NTFuNVduM25VM2EvendnR3FmdWMxU1lMMzdSVk5UbmhRSW15dUlNYityamRF?=
 =?utf-8?B?VnNWcDh6NzZMaGJ3RkxxOStsQXE0RGdMRTg3TnNIWDhJRitzSFhzSjkyYkF0?=
 =?utf-8?B?WnI4b3JoRG1GMTQxNWwrRXRZaFdzNk8rVjdkc083T2Z0VE1tOU5qU2xaT2Rj?=
 =?utf-8?B?Uk8rNXVzbGxwM2JvMGpFMHZnekVJem1pb3FFYVY4cURXbWNBQWt1R3BIbU1a?=
 =?utf-8?B?bGZvSEpWNWFTVWZUMFltandLUlBRdDZjK3pZSlpkY2FwNzhQSWoyVGwxQi9I?=
 =?utf-8?B?U1IwYVJaNkZvb3RXeDcrdWh0UTU2bjQ3ZEJ6RkdQdFVEL3I2cFJNVzNLM3Qy?=
 =?utf-8?B?aG5HaG1rMm5hdkhZUCsrdWE4Sk1DdW91cE9wZERKWWtmS1l2QWFRc2RyUStD?=
 =?utf-8?B?YVhYU29zK1Uxd0h5RHRVdXdLR3YzQjRES0NEQkFtNURKS3d1Q3JJMHI5REdn?=
 =?utf-8?B?Sy9KTS9wVVBEVGsrRVRwTElCYUxrbjJwYTlLNTNBQnRyZ2xUK0plbHgzeS93?=
 =?utf-8?B?eEMwK2FueVVQQ3k2alFLQXFJS0c3eGk5RyszejR4YVRkWmZGRlk4WGtmTEdO?=
 =?utf-8?B?WE5hRVJ3WmdyWUdXNTViVFVOM0c1TWtOcVpGMEVyQS9weWt0M0hnZzNvQm1W?=
 =?utf-8?B?U3cyV0ZXQklURE1jNFFhUnJyUFdhTTZIdkJEOHlmVEpaVFlwUXZzaTg3Mml4?=
 =?utf-8?B?ZGViYW15MUNzSmZBQitMVWZXZHpLSGd6ekh0TEFnTkw4VEQ1R0ZMdkRFc0dk?=
 =?utf-8?B?K0szaUExeHM2QWFReGVpc3ZaM3FsNjFneUdwUTVncERSLzFWanp4U2N6cDJS?=
 =?utf-8?B?UWh3UUZqZlcrdUJSVlBoR1htRzhDa3dIY1JjUDNDSXZneEEyaVZCTTVsRGw2?=
 =?utf-8?B?Q3VpYk5PUG92Tlhqa01hbEg4ZDRhdTNMT0J2YlQ2dmlTckh6cEg5MVpNRmVG?=
 =?utf-8?B?eDc5VDZXWmZ5VnJuZTJXM283YlFFcUdLaU15cTQ3eUwycGo1SnZWRUNxZk56?=
 =?utf-8?B?cGxIMHdtV1RKYVJBZTErTXcvdTZQbzBFSkNJUHkra2p4QnZtNGRWS1RnRWRD?=
 =?utf-8?B?a0RmVERqL1V5UElVOWxoa1k2WS9DWXFsci9UbkFIMEljYXhONytrSDlSRlNQ?=
 =?utf-8?Q?uRkkxPbsNNrOYndZyajh8uY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OXB6ajdnNWtJRERreXZtOFpPWlpoRUhBR2dKY1ljQlRFOGIvQzFUQytGL2wr?=
 =?utf-8?B?bEZlMkYyb2k2aDVkNUorZStTN3M2eDRIRFVBcktsVkNnOEpnS3BFVmNPbURL?=
 =?utf-8?B?R2FkcGRsVGRqR1V0OSsxR2lMYzBZWlVieU5pUzlPVDVPSHg3RWVhYXprNkgr?=
 =?utf-8?B?QVd0cTE4ZEY3ZDJvdEw1RVFkcXFOSEJYdE1rR3Jpa2JPL01ZcmJpcVhrMThU?=
 =?utf-8?B?TW0waW1rNlpvUlFUZTNNSnp0TkNVY3g2NUh5YzdxNE52VCt5RUJpM0ExSUVl?=
 =?utf-8?B?Mlc0R3hEdENoZDJKMnR5KytJZmkzOC9JelF1MDlCSUt6UWdackVmNmdlN0Zj?=
 =?utf-8?B?Ym13TXliWDIwSXl6QmRpSWVGT1M0QkFyRjE4RHg0S3B4TGN6VEt2K0RBVWMr?=
 =?utf-8?B?eEYybnI2Z2RwU1o1cFZnMGJjRTFWUzBZOVhielRxRUk0MnVDd3hqNlpMK3Vr?=
 =?utf-8?B?MHdvcFRQZzhOOXFSRHoxVkZhVkNCMVpKSGNNNm1WKytSSzArYlEzRDlHVlMx?=
 =?utf-8?B?TUc2RndJVnBMMUJ4Q3lrQ2krRUVMVStqU3hsRk5VYzQ5ZzNXdnNSSTlqc3My?=
 =?utf-8?B?VkhzL3ZwL3ZpQUIrcnlOVjAzalJlVTZxemtSTWpOZGYwSW43RnM3S2c0dnFL?=
 =?utf-8?B?eEY0S1ptdUpOZ3l4S05kdWVxTVJwNkgzUzBwUG1vQ3I5MzZxSGpucGtoZFR5?=
 =?utf-8?B?RVQxWEM0dHlhY1NNWXBXRUFqMHJCRnVmL0VGZnQxU2NiSlZkZFJjMUVHOG9B?=
 =?utf-8?B?SDVmc1ZXT1hMeEFucFJyMUFPMW9rMHptVG91THFFazVMR01kS2F0eG1oYUR2?=
 =?utf-8?B?TmZvQ21QdGxyNnF1MlVTTys5dDBRRVJHcjZRUk4xdUpha1NxeDc0eUdoZ0J6?=
 =?utf-8?B?Q2c2Y29lZUh4bHBQSTd2ZzBnUEJheDcrYU03VENzcVA1aHRUUUVtS0F2Q1lG?=
 =?utf-8?B?bThMalFFNWJzTS9JZEtLd0FCNEZyd3U5Tmx3SmloVC9KdXFNS1RjNXNpNjdp?=
 =?utf-8?B?T3F5alFINENxVVB6MEVzZHNhZWtpYkR4WXJrSFNWbnpWUy9VeTR0OC9kaVl4?=
 =?utf-8?B?dS85RlZTMmtLa1Ruam5NaGN4S3I0OFFUNmdLMUxlc2ludmp0ejBpSmlRSnZn?=
 =?utf-8?B?c3hzdU5NSHlxOVI3RDlGTDFCb0RqNlphSmhtRnZST2g2ejJwUU9KY2pQR3Fa?=
 =?utf-8?B?OXB5N2pHemh6dnhyc2JUeFlQUG8yYTQ3elRvVEUvLytlU2t4dDRsbVd5Nnhl?=
 =?utf-8?B?TTlrOGJqUWh1RnhPZHdZMHFBVWdmdUNYcEc4a3pyUFhkeWYrR3VOR2IrajFV?=
 =?utf-8?B?WkFzdC9tS0ZTL3lwRlBpWjlEWUpmdWN3VDR5UG5kSmEzZWpWNUhjWGNzR1Fr?=
 =?utf-8?B?d2xDTWhaSlZJNlFMQURtYUp5a1hsMmZ3SCswek1PNXBOSUovcU9OZVpwa2x1?=
 =?utf-8?B?bi9hZnUxdHo3T3F6a2NteWxjZG5pd3lDWktMeDJhR0VzR3BOckJqYjJvNGdM?=
 =?utf-8?B?TzRFc2x4VEY2WmhkOWZUWW9leXQ5M0trdUZEZFFVYXIrVTlPNlgxSlZhbmZi?=
 =?utf-8?B?Ymc4WFVINVdLRURueFEzS2taMGlzQk5MaXBsa0RWVGJiekt4UGVqT0ZuZHd0?=
 =?utf-8?B?blIwMmhzSkRKTTFhMnpFSG5ocW41NytMUy9JRHRoaUpEVGtMUC9YQVlyME5w?=
 =?utf-8?B?OW9DQXgzOUlETUYyODUvWEVtTU8zTlJGcGx0SXdwNGdlL2JZblQ4UlFjQjFS?=
 =?utf-8?B?N3Y4NmkzRDdPTDBhNUd2aGM2NW5KbjB1RzRaZkVCbVc4THRsZnhaN1JMTmp6?=
 =?utf-8?B?S05pakxNMWV2bGxQdFBzUFp1K1VWUGhsTEx0akE2TklMekVUVFpUbCtyKzRJ?=
 =?utf-8?B?MVdVd3JMRjFFOXpiYWZ2Vks2eGhBWXNIOC85K0wxSlQ1RXA3MmFlS1BZWURG?=
 =?utf-8?B?Qytoc1VzUkFrdzNPZzBuRnNCMHRjSExoZ3JuKzZoVWhlY3laSnA2TzFpNU92?=
 =?utf-8?B?aldoRC84T3FyVzMwemdoYWlkM3c2c1FaWGR5bzY2cFBZeXBqOGlDOW12Y2ds?=
 =?utf-8?B?RU5BK0JpVjNvRnVnUHJRTlA1eGdnM0NXR2N4YnlHZExxYVVxd0Y0NTFvRVZV?=
 =?utf-8?B?REhuVlVOWjFlRFFnY3oxOXRwRVI4UEdhcFF6cnorSXpIM2lkblBNSVdrR0d5?=
 =?utf-8?B?ZzZQai9CU0g1aHBYeWRJWUtnM3BvTWJNaFI0RTBKT2dyRk1zZjZ6czVXTEp3?=
 =?utf-8?B?WTY5MjdWOWN2aWwxS29peHJIajl0a2h3allBU3ZDVTdBcEJVTUZzd3JEVGo5?=
 =?utf-8?B?bW1KT1JSYmcybEFZY25HQmZrcmVLT1lERlFZSFBSdUYrTWRLVEtXQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e17e327-3ea0-4f84-0ed0-08de5857a92b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 19:11:05.6362 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ziKIyj4+041BqklU+cvtZVWs1zBibpOT4jRJxUSvr3IsZ5VjOnKXKJOrd+e+EAqc/0MtivsVqML6vJoFumoDXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5032
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

T24gTW9uLCBKYW4gMTksIDIwMjYgODo0NSBBTSBLYW1pbCBLb25pZWN6bnkgd3JvdGU6DQo+IEhp
IFNodWljaGVuZywNCj4gT24gMjAyNi0wMS0xNyBhdCAwMDowNDo1NCArMDAwMCwgU2h1aWNoZW5n
IExpbiB3cm90ZToNCj4gPiBXaGVuIENMT1NFX0ZEIGlzIHJlcXVlc3RlZCwgeGVfbGVnYWN5X3Rl
c3RfbW9kZSgpIGV4cGVjdHMgdG8gb3BlbiBpdHMNCj4gPiBvd24gZmQuIEFzc2VydCBmZCBpcyAt
MSB0byBhdm9pZCBsZWFraW5nIGFuIGFscmVhZHktb3BlbiBkZXNjcmlwdG9yLg0KPiA+DQo+ID4g
U2lnbmVkLW9mZi1ieTogU2h1aWNoZW5nIExpbiA8c2h1aWNoZW5nLmxpbkBpbnRlbC5jb20+DQo+
ID4gLS0tDQo+ID4gIGxpYi94ZS94ZV9sZWdhY3kuYyB8IDQgKysrLQ0KPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0
IGEvbGliL3hlL3hlX2xlZ2FjeS5jIGIvbGliL3hlL3hlX2xlZ2FjeS5jIGluZGV4DQo+ID4gMTdk
MDgzOWJlLi42YzBlZDU2YzkgMTAwNjQ0DQo+ID4gLS0tIGEvbGliL3hlL3hlX2xlZ2FjeS5jDQo+
ID4gKysrIGIvbGliL3hlL3hlX2xlZ2FjeS5jDQo+ID4gQEAgLTczLDggKzczLDEwIEBAIHhlX2xl
Z2FjeV90ZXN0X21vZGUoaW50IGZkLCBzdHJ1Y3QNCj4gZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0
YW5jZSAqZWNpLA0KPiA+ICAJaWYgKGZsYWdzICYgQ09NUFJFU1NJT04pDQo+ID4gIAkJaWd0X3Jl
cXVpcmUoaW50ZWxfZ2VuKGludGVsX2dldF9kcm1fZGV2aWQoZmQpKSA+PSAyMCk7DQo+ID4NCj4g
PiAtCWlmIChmbGFncyAmIENMT1NFX0ZEKQ0KPiA+ICsJaWYgKGZsYWdzICYgQ0xPU0VfRkQpIHsN
Cj4gPiArCQlpZ3RfYXNzZXJ0X2VxKGZkLCAtMSk7DQo+ID4gIAkJZmQgPSBkcm1fb3Blbl9kcml2
ZXIoRFJJVkVSX1hFKTsNCj4gDQo+IE9yIGl0IGNvdWxkIGJlIGRybV9yZW9wZW5fZHJpdmVyKCkg
Pw0KPiBGb3IgY2FzZSB3aGVuIGZkID09IC0xLCBhbGwgcHJldmlvdXMgaWd0X3JlcXVpcmUoKSBj
aGVja3MgbG9va3MgaW5jb3JyZWN0Lg0KDQpOby4gZHJtX3Jlb3Blbl9kcml2ZXIoKSByZXF1aXJl
cyBhbiBhbHJlYWR5IG9wZW5lZCBmZCBhcyBpbnB1dCBwYXJhbWV0ZXIuDQpCdXQgZm9yIENMT1NF
X0ZEIGNhc2UsIHRoZSBmZCBpcyBzZXQgdG8gLTEgYmVmb3JlIHRoZSBkcm1fb3Blbl9kcml2ZXIo
KS4NClRoaXMgeGVfbGVnYWN5X3Rlc3RfbW9kZSgpIGlzIGEgbGlicmFyeSBmdW5jdGlvbiB0aGF0
IGJlIGNhbGxlZCBieSB0ZXN0IGNhc2VzLg0KQWxsIGN1cnJlbnQgY2FsbHMgYXJlIGNvcnJlY3Qg
d2l0aCBmZCA9PSAtMSBmb3IgQ0xPU0VfRkQgY2FzZS4NClNvIHRoZSBhc3NlcnRpb24gaXMgYWRk
ZWQgdG8gYXZvaWQgdGVzdCBjYXNlIGNhbGwgaXQgd2l0aCBvcGVuZWQgZmQgZm9yIENMT1NFX0ZE
IGNhc2UgaW4gZnV0dXJlLg0KTGV0IG1lIGtub3cgaWYgeW91IHN0aWxsIGhhdmUgYW55IGNvbmNl
cm4gYWJvdXQgaXQuDQpUaGFua3MuDQoNClNodWljaGVuZw0KDQo+IA0KPiBSZWdhcmRzLA0KPiBL
YW1pbA0KPiANCj4gPiArCX0NCj4gPg0KPiA+ICAjZGVmaW5lIFRIUkVFX1NFQwkoMyAqIDEwMDAw
MDAwMDB1bGwpDQo+ID4gIAlpZiAoZmxhZ3MgJiBMT05HX1NQSU4pDQo+ID4gLS0NCj4gPiAyLjM0
LjENCj4gPg0K
