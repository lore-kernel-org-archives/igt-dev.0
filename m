Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF8B3D2ED11
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 04:34:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 629B410E187;
	Tue, 20 Jan 2026 04:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EkbmqiNE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4943010E187
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 04:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768883640; x=1800419640;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Gy573nCHZQNQnk0cTo4+P/5Sv0tikT/P11R4thWqJhE=;
 b=EkbmqiNEykVtb1Mp9SkfDMteZbFEzCsr5Bi1k3fD3TgJumcSNCzC5vvp
 NlPov/rHvUQdI1ZBC6G8l8VC1i7FFb1HZTGtKuXyWpMVy008IHqkIG1WM
 JAPiReIuLCs2MYVI/TtC+IG/bWUaQ0i20FxqKZK4SHpiJVI6Cwfp4v9Mw
 /CEdpopoLLSyzGMIpbQeaJ2Za5pYdTENvMb/09tHrC/bsz/QjrEy30G5W
 WbBw0cE/EIoSy/rPjAGMm+ZnZnvycyedK3MsX5amQkRs68A3aOqdOIHtN
 5cFEDBGaq8Gce5TKaFAuUDNZLMDY0+RMR08Avfz6m3XHOaShViAvkyUsG w==;
X-CSE-ConnectionGUID: 7TrE3W93TMK/5uH5vjCtqA==
X-CSE-MsgGUID: a58/DHVVSrmaANTbQv1+Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="69984500"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="69984500"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 20:33:59 -0800
X-CSE-ConnectionGUID: ANzRzy5jQyGLxZ35enqMVw==
X-CSE-MsgGUID: wzfb0qJ/TGSWK7JEnv5U1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="210865308"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 20:33:59 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 20:33:58 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 19 Jan 2026 20:33:58 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 20:33:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mvNMQUc1HsC5HtXMNp5WrAjvWIwdozWBd+XrVBtiRFweqHO7S1cgMrdVTlAdibtvq4Jc+FOHrsPcUNBb0KOAPafY8PmVXpEGcGldD5kcWrTJ12/o5JDM8wNVP2/Dpa1nEeATMT1m/0virm1DvVfBJ1ZabHK4z7OHA3AtwzZ+2Y05yIPnlQgM0yLYXEcOXaclQsD8GE2TZufSj8xA2jbpOjkXpac+74ez+WcVjtHjb4G1oTNJEvXBlfnGtMyYv+m5cL9k7KTBBqud5vsHNTCOHIChJDvvkhCMj97hIflje/0iDSbPO864NT120c1V0ZkZZVDHs6umKzgUkdk0N4FAgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gy573nCHZQNQnk0cTo4+P/5Sv0tikT/P11R4thWqJhE=;
 b=MBX60uOO35VYwYIo+wjj2BDxhAMZPhANuj2dk62x0kYz4szvP6uDheaAobEdTUY4iEvKcUWkPHKWCRSv48TiL8gkbTnGW6aD5BnKUFkXuyDBJLrX4r0GEirbWuGNvBCCKOON8Dvayzlr6Ee+an3zRV5eSE36wJjma8ch1+Ar9mgvXNC3S/26lDa0TCnrnfVARGNITz2l7qqMIIqQE7qNkISpbJvxImA9qOh4zlv4jRQI7/pCof6vR6sOKTETkZhvquTL6U6Cre+X2QV5G8pKxZ0zdXTjwZ8N4tk/netLBiOcweaE4aNm3NgMLiqm29XPc9ZB8Cs9TRulIg4koCJ7FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SA1PR11MB6614.namprd11.prod.outlook.com
 (2603:10b6:806:255::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 04:33:56 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 04:33:55 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Alex Hung <alex.hung@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "aurabindo.pillai@amd.com" <aurabindo.pillai@amd.com>
Subject: RE: [PATCH 1/2] lib/igt_kms: Increase MAX_NUM_COLOROPS
Thread-Topic: [PATCH 1/2] lib/igt_kms: Increase MAX_NUM_COLOROPS
Thread-Index: AQHciZUDsMJJe9ItkU24/ViCIw6iXrVaXtpggAAVjYCAAAQnsA==
Date: Tue, 20 Jan 2026 04:33:55 +0000
Message-ID: <DM3PPF208195D8D70C9BE60D8ABF0011C17E389A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260119224237.561000-1-alex.hung@amd.com>
 <DM3PPF208195D8DF69335A6195C2064A37CE389A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <126dc573-e29d-4982-9803-857763d6b343@amd.com>
In-Reply-To: <126dc573-e29d-4982-9803-857763d6b343@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SA1PR11MB6614:EE_
x-ms-office365-filtering-correlation-id: 2fd405ed-3f6f-4236-d220-08de57dd1f5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?RG41YXYxU1dtNjdSbjRVUEIrbW53aGZuRGpGazFFUCtPTEJxemxKU25HR0t5?=
 =?utf-8?B?OGFDYTl5M2tFUDVQUFZsSStTTzBYTHhYNTRvUExpNVdkUURQNkhGc2FpaEpH?=
 =?utf-8?B?cHpMNnRtWHRoU29FVUgvaWVDdk5DOXNxRC8vM2xVWWtEcDdIaGNON1l3RHBS?=
 =?utf-8?B?b21qRzNPRVZncUMwWHNpVC9ZYndNa0RCamJNUE1GU0diVFNsQmh4SWw1VzlF?=
 =?utf-8?B?K1VUaWhpL3BndTZzOWtKMUgwdHFJSTFtWFRaSSsrdThzanZVbVN5T3BhbHUy?=
 =?utf-8?B?WkdlUGlhbE5xbXRReWYrQVE4Nm83eTJXOWhjWGxkd0NZcEF0cTNtNUlhSGRu?=
 =?utf-8?B?NTlEQkhSVElQcTBRWjlIWkRnWExEK1RFb1Jwd3JjK2xnOUlURHVZRFFBbDJ0?=
 =?utf-8?B?RTVNNXdXdzh4Yk5RNnAyd1N4b0wxZW1tbWt6RWxSMXhjbk84RHdkT3RJRHlv?=
 =?utf-8?B?bFAwazE1WmNMdmxuT1RjdkQ2MGI1a0xWRkF6ZE1rejl0cXFZKzdhOUNyaU43?=
 =?utf-8?B?R0l6WmRrSlNJWklsYlErd3A3V1BudGZVNU9xcXNMOHVUeSt2NDZjOTgwSkJE?=
 =?utf-8?B?eXgrcStkUXZnUEZFbzE3L2R1QWF4OUFYVlZYNmFLSW1CVkEveXRvQzFsMmEw?=
 =?utf-8?B?VEUxNUYyY0ZRYks5d1cybll1eTZ2ZkRHQlhVSGFOSnRCMU5ocTJkc2VUZ1Va?=
 =?utf-8?B?clpHV2JYOTR1dC9xNGtpUUFwelBnUUd2Z2ZhZEFSQXJXMEpWRzJEWGdUcW5V?=
 =?utf-8?B?MnBRWmdSVzJxcGFKVGdrL1JoK0J1WkhYMVYrVVhKWi9KU1ExVFFiSGoraUNn?=
 =?utf-8?B?eHBtdEJpYkVDNGtiNnA2aldLYXo3cFVQT1JuR2krKzFJWTFLSGdaZUE3WEJ3?=
 =?utf-8?B?dk55WXlIZVg2cmhvcm1JeXdSTGZlMDdPNU9wajNEazFkYTZkU2Zrb1dnTU9o?=
 =?utf-8?B?U1pSang5WTVzeit6VnREbS95TDhFUkh4UEtzU3NobS8rMW1vMnVqeEliVlEv?=
 =?utf-8?B?djRBeUdheTQ1amw1YmY2TWRNY2hwYnBqWDF1RFo3ait2dG41YkJmOXRWeXhN?=
 =?utf-8?B?aCtybWlPK2J2cjBUOWVoTU52YzN1c2ttZnpQcVVkaXUrQnhoUEZWK3FEVklC?=
 =?utf-8?B?dnJzYlRJTzFqSWtWNC9KQ3RHVXJ4S1hFeDBsTTVpcjNvTlBLSTIxNHIwRzlv?=
 =?utf-8?B?c3BRN3ZESE5QaHVKUEJVUDhxRWNsRUxmMEozTG5yQm1vUzNKdnF2QzJLRFN0?=
 =?utf-8?B?OVNueDN4NmZoWjNMdGFjSWdwRHBGN1RrNGdYRUZXdUpCK2JRcjBFemdpVWh6?=
 =?utf-8?B?Y2F1cnhoWVNoZVJpWUZ3eERwajZrZVoyVGRwakl4R3g1UHE3Nm5BOFRXZ1hj?=
 =?utf-8?B?VjRPWHJhd1dNYzAwb1A0MWxlc2NveHVXMmNMdWxxL05pN2NURTdaQjlxbGJ2?=
 =?utf-8?B?R3lXSHlka1FzVFBMczJVbnpUL0F1RXVuajhpeTg1Ujd3ZkZqTzhzdTJtYUx4?=
 =?utf-8?B?RWFCelZPUE5tc0lnWkVxZm10dDdSVnROUVRXUVM1Lzk0aUsyaEsvYUl4MXdZ?=
 =?utf-8?B?NmF6bHpYUDF3T2EzejNVWEc5V0J0bUVVdmY0bzNjMU5icXZIWk16WGRrN2RO?=
 =?utf-8?B?ZVZkQ2xXTHgvSGk4c25kd2huamxscEhjbVFmOEhJT1d0VzBmSmhwZHFSNXc2?=
 =?utf-8?B?M1l4VTQ2WXVTL0l6TnBxMU8xaTRMYTFhRVFYdDd3YmZ5THltNi9LdytWRzZK?=
 =?utf-8?B?WUdiSDBFbTg1MkoyK3BCUmJVdExvNStadjcwRmM3YWhrdFdRcjlmbCtra0NO?=
 =?utf-8?B?a2RDSHJRZEwxbzRwRldXUWdGR2NBZUVJN3J5aWRyaUxXdlM0MTk0WnB4ZG9p?=
 =?utf-8?B?UEdqb09rNVl5QlpBTHRHVmFqYzRBNGZ3Q3lOQXYxRjNNZy93dTNoYmN3MnFs?=
 =?utf-8?B?MzFWVDNpUHdLeWdxYlFmM0xTKzhYMGtxKzNtWEl1NXIxNXhHR3pEVWhUY2lv?=
 =?utf-8?B?aEpnY2JuUXN5VTNidmtqV1BvaGVBREZTT3h4MG9SZ1h5WXl3TUxXeXJzR3hD?=
 =?utf-8?B?T0QzTSs2Tmt5V1JlUmZDdUlaUlNKc3N1WlpwSkZzR2M4RGpjNFUxQjZZd3Qy?=
 =?utf-8?B?b0tWWDJRVmpxdXNiSHd3b0Vna1BPNTRVd25lVUJKNmIvYk15S0VMdlFLOUcr?=
 =?utf-8?Q?QFAUDPxV9OfY+XpUEbosnFM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R2xSTFNNc2hkQk14Zkl1Z1Z0RTA2SFNVUVVOdXRERXNhblF3VG5OWEJ3dGRj?=
 =?utf-8?B?dU9obk5OQ3grdVF1UDVBSzZzbWlHeDVHeG9MVUUwcEVtWFV6aSt4Y1B5b0JX?=
 =?utf-8?B?dGVpOStlL3BndnNyTDJVbDh6aS9JQWZBeXhmNDhadzJPWTZ1VUovVTlkcmk2?=
 =?utf-8?B?WWJVclhwYU55US9Mc0JIRitPNzZpVTlha1Y5UVAvdkYzQ2pEbGpOZXVWeXNY?=
 =?utf-8?B?aEZiSDZ3bjdRcGlQYjVlQWJsMXFPMVVOdEhGOVFQYU9vZHNmKytsU3dHSFJP?=
 =?utf-8?B?N2k5UzJQcFljWVlGVzdzYTlsK01NRzJUU0dKcnI1MDFPU21kMGYvU2dIMk1o?=
 =?utf-8?B?L3RtUGZCei82YURpd0JqUXlhUjE5UGlLRGNmaGhGVkRPSWxTSlBBSElnTjZu?=
 =?utf-8?B?Z1UzVGZsSU1OSlE3bERyVFduWmUzLzRhcXkrY2FFdk51QkFQQTZ1cXFRSHpn?=
 =?utf-8?B?cmNEeUh6YVk0cnlzNnJzS2YvSHlJcnVHZmhUc0VwTkthaU9QMkZFVkVlb2xj?=
 =?utf-8?B?bFVRYURESHl1YzZSVUdGYndnaHJicHBLSGVCV04wWVN2VUErYTVsS3BTVnZ6?=
 =?utf-8?B?RWV6aWJYNTNuWVprQ2NXQ1JDWXE4ZFI2VXZhS3FXVElibTFUdnoxN05ZZ2hN?=
 =?utf-8?B?dU45ZjlMRGJkN0lQbVFsQit5WWhkQXBnQVBEMEtSMytRdm42MmRGcEVnRWNF?=
 =?utf-8?B?VEFTaDZHR29PWVRIZnVEakJlLzBoWlFIYkdtRUxhVnl4bU01aENrOUVhSEVh?=
 =?utf-8?B?RHR1WHQrRU15MHMyRUx2dDE2S3ZqNENsdGNGMlg3Sm5wMEFTam41U0IzeUdB?=
 =?utf-8?B?am1nMGE2VFI4RkV2UGZUem5QWGVIVU1jbGpZczBnL1dKTXBiUjc1QWcxdm5m?=
 =?utf-8?B?amNMWnpBZW51SHZqMCt6b0R3TU1nS01zTTJLQzFCb0h4SjIrMUFmZjhGUGdY?=
 =?utf-8?B?RGQwN1NiR2dKMWtmTmZQTld4OVFYTk11UWNxUXlnc0tBMjlDK0dyK3ZYUFha?=
 =?utf-8?B?bkxqWTZrR2swdUpERHg5TVh0eTZRMUlkTjdlTGkvak9vbUI1NGtYZTBqNXlO?=
 =?utf-8?B?YW5VVjNCNXZBL29haEtLakdJSVZBckl0RU1HM0w1ZGlQWktNcGZJTHZ6czZM?=
 =?utf-8?B?RWpPaGN6RnFDZnJQbkxZeVdwaHFacHZPTUFWSHJzUGtOSUE1U09wRWFMWGFE?=
 =?utf-8?B?d2M1TzFJa0NHeSt0b1FrRkVGNkdwOS9rWU1xL29CcS9Hb0dzeGl4RzFiaUZu?=
 =?utf-8?B?THZwYU9JYUZ0SktJQjhTN1hicSs5RnB4L1FQd1QyWGtUY0RTV1pwMG9LRDhu?=
 =?utf-8?B?U01SRWM3eEVhNGNpUzNRWFlqQUFFdWNrNWJHSTRKNkM1N213OFNDekF6aXRP?=
 =?utf-8?B?YWNrOHVYbVYreXNKNTFlMG9tRkJzMkdTbTNmODRlQStkQllHUjd4VzdBZVl3?=
 =?utf-8?B?WlpUdVIwbzJ6NDZJeTdmdmt0MUY0Snk0WkJ3SG5Ta2VqMFZzZ0tHVlNHdEtr?=
 =?utf-8?B?b0lPdHRxWG5ER3UxcXBwVkF4SlIvWGdLRCs4bWlrdEJwaGc2b1gzb2pnbmQz?=
 =?utf-8?B?WkplK241emFwdmQ0Qnc2b01BR2NUa0kwbHpOTjhFNlp4VFVlUEFDUys0bG5u?=
 =?utf-8?B?Y2NVVS9WQXM5NStuQWtaSFBTNkFrQm5GTE1pcjVwcWp1M1Y3RzgyZlpPY09L?=
 =?utf-8?B?L0F2QlpYN0Via3VERWIwdkpwUUdheXI1UkQxL1NybUlqQ2FTMkc0NktrYmdZ?=
 =?utf-8?B?NU9BeWVLcGhPbENMc0VDb3JJOFp5QTZqcktNOWdZK0kvZjJoaTVwTm1Mcjh6?=
 =?utf-8?B?VU1oemRBOHFHUS9SNkZtaWdvUHNaSUFSQWpZbGliOWU0UFBlclk5VXVGSDFF?=
 =?utf-8?B?RHZORHpRQlJhMEFheWE1bjU2OE5IQnRsbWl0WEgvcEJGakNyNGRSL2dPT3E2?=
 =?utf-8?B?blZyRFlMTXp2RHh6bERzY1NnQXJsUTd3Y1J0T0dtNUZjT01pRms2Q0xQQURE?=
 =?utf-8?B?REY3dm55a2RnSE9abHBlNlNMRHdicFpWZTZ3dGpFVW1RLytEYy9TazVlOHFy?=
 =?utf-8?B?MUJKdUFucWpCSm9hYVJnVllpaGxNVHRYL2RvNndMSGxoQWJUYkRSOVIvRFlY?=
 =?utf-8?B?N1h3Tk1TY200aU9nK2FrV3BROEVnQlk5b01JSXBickwreStWYmRjVGxTK3lH?=
 =?utf-8?B?S3pCcUtoUDlvTGMrM0VFNWRUVVN5Zy91djUvZWF1S2tHVEtFcEJsWlRqeW9U?=
 =?utf-8?B?Y0xIOUhrZVJqQkdOZldsZXFUWDNhY2txS1lic0oydVI3WWVCVG0xaGtMdk93?=
 =?utf-8?B?ZURnMFlraDRuUE1ZWmFXTG93aVdiZE4ySFc0czlwWHJuT3dkWjJXZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fd405ed-3f6f-4236-d220-08de57dd1f5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 04:33:55.8226 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s1kkf1tHogkGxsG4ywH1olUd6lb/0bp0XFaYtQM4PwMZBo/QuU1jZ1etUy1CPU0cZTMWgt6vz/j/MgYDLuTazQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6614
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIDEvMl0gbGliL2lndF9rbXM6IEluY3JlYXNlIE1BWF9OVU1f
Q09MT1JPUFMNCj4gDQo+IA0KPiANCj4gT24gMS8xOS8yNiAyMDowMiwgS2FuZHBhbCwgU3VyYWog
d3JvdGU6DQo+ID4+IFN1YmplY3Q6IFtQQVRDSCAxLzJdIGxpYi9pZ3Rfa21zOiBJbmNyZWFzZSBN
QVhfTlVNX0NPTE9ST1BTDQo+ID4+DQo+ID4+IE1BWF9OVU1fQ09MT1JPUFMgPSAxMjggaXMgdG9v
IHNtYWxsIGZvciBzb21lIGhhcmR3YXJlIGFuZCBpdCBzdG9wcw0KPiA+PiBrbXNfd3JpdGViYWNr
IGZyb20gcnVubmluZy4NCj4gPg0KPiA+IEhvdyBkb2VzIHRoYXQgc3RvcCBmcm9tIGttcyB3cml0
ZWJhY2sgZnJvbSBydW5uaW5nIG5lZWRzIHRvIGJlDQo+IG1lbnRpb25lZCBpbiB0aGUgY29tbWl0
IG1lc3NhZ2UgaGVyZS4NCj4gPiBBbHNvIGN1cmlvdXMgbXlzZWxmID8NCj4gDQo+IFRoZXJlIGlz
IGFuIGFzc2VydCBmcm9tICJpZ3RfYXNzZXJ0KGRpc3BsYXktPm5fY29sb3JvcHMgPA0KPiBNQVhf
TlVNX0NPTE9ST1BTKSIgYXMgYmVsb3cNCj4gDQo+IChrbXNfY29sb3JvcDozMjMzKSBpZ3Rfa21z
LURFQlVHOiBUZXN0IHJlcXVpcmVtZW50IHBhc3NlZDoNCj4gcmVzb3VyY2VzLT5jb3VudF9jcnRj
cyA8PSBJR1RfTUFYX1BJUEVTDQo+IChrbXNfY29sb3JvcDozMjMzKSBpZ3Rfa21zLUNSSVRJQ0FM
OiBUZXN0IGFzc2VydGlvbiBmYWlsdXJlIGZ1bmN0aW9uDQo+IGlndF9maWxsX3BsYW5lX2NvbG9y
X3BpcGVsaW5lcywgZmlsZSAuLi9saWIvaWd0X2ttcy5jOjg3NzoNCj4gKGttc19jb2xvcm9wOjMy
MzMpIGlndF9rbXMtQ1JJVElDQUw6IEZhaWxlZCBhc3NlcnRpb246DQo+IGRpc3BsYXktPm5fY29s
b3JvcHMgPCBNQVhfTlVNX0NPTE9ST1BTDQo+IChrbXNfY29sb3JvcDozMjMzKSBpZ3Rfa21zLUNS
SVRJQ0FMOiBMYXN0IGVycm5vOiA5NSwgT3BlcmF0aW9uIG5vdA0KPiBzdXBwb3J0ZWQNCj4gKGtt
c19jb2xvcm9wOjMyMzMpIGlndF9jb3JlLUlORk86IFN0YWNrIHRyYWNlOiBub3QgaW1wbGVtZW50
ZWQNCj4gDQoNClNvIHRoaXMgc3RvcHMga21zX2NvbG9yb3BzIGZyb20gcnVubmluZyBub3Qga21z
X3dyaXRlYmFjayBhcyB5b3Ugc3RhdGVkIG1heWJlIHRoYXQgbmVlZHMgdG8gYmUgZml4ZWQNCg0K
UmVnYXJkcywNClN1cmFqIEthbmRwYWwNCg0KPiA+DQo+ID4gUmVnYXJkcywNCj4gPiBTdXJhaiBL
YW5kcGFsDQo+ID4NCj4gPj4NCj4gPj4gRG91YmxlIE1BWF9OVU1fQ09MT1JPUFMgdG8gMjU2IHRv
IGF2b2lkIGZ1dHVyZSBmcmVxdWVudCBjaGFuZ2VzLg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5
OiBBbGV4IEh1bmcgPGFsZXguaHVuZ0BhbWQuY29tPg0KPiA+PiAtLS0NCj4gPj4gICBsaWIvaWd0
X2ttcy5jIHwgMiArLQ0KPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvbGliL2lndF9rbXMuYyBiL2xpYi9p
Z3Rfa21zLmMgaW5kZXggNzdiM2FlMmFmLi5kZmRlYmI4M2YNCj4gPj4gMTAwNjQ0DQo+ID4+IC0t
LSBhL2xpYi9pZ3Rfa21zLmMNCj4gPj4gKysrIGIvbGliL2lndF9rbXMuYw0KPiA+PiBAQCAtOTIs
NyArOTIsNyBAQA0KPiA+PiAgICNkZWZpbmUgTUFYX0NPTk5FQ1RPUlMgMzINCj4gPj4gICAjZGVm
aW5lIE1BWF9FRElEIDINCj4gPj4gICAjZGVmaW5lIERJU1BMQVlfVElMRV9CTE9DSyAweDEyDQo+
ID4+IC0jZGVmaW5lIE1BWF9OVU1fQ09MT1JPUFMgMTI4DQo+ID4+ICsjZGVmaW5lIE1BWF9OVU1f
Q09MT1JPUFMgMjU2DQo+ID4+DQo+ID4+ICAgdHlwZWRlZiBib29sICgqaWd0X2Nvbm5lY3Rvcl9h
dHRyX3NldCkoaW50IGRpciwgY29uc3QgY2hhciAqYXR0ciwNCj4gPj4gY29uc3QgY2hhciAqdmFs
dWUpOw0KPiA+Pg0KPiA+PiAtLQ0KPiA+PiAyLjQzLjANCj4gPg0KDQo=
