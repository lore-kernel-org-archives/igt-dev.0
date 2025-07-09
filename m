Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA76C83F10
	for <igt-dev@archiver.kernel.org>; Wed,  9 Jul 2025 22:33:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E05B10E125;
	Wed,  9 Jul 2025 22:33:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z+KELkiV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D678010E125
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jul 2025 22:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752100397; x=1783636397;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=wqzoe9FRcBO/xVpk30oZFAtJA/C8MvCDcFMwgNCcOuA=;
 b=Z+KELkiVQq4SvRDKpnJBsO6+eJRppfZMCv0OEGkIFiWJNR6f5EOkGZeq
 GQsRJTcT1Cmzf1xpDEIgcj2hDfm1fU3xTGItLbMvyByAnkp/mHrDiHg+q
 wmcvpbXhWYRtzLYCwGLxLih2kUnmJ6RfOtZA7fR/Tjjcl0KmJb1o4gAK/
 y8AeFCCRtBPVwMaGRijhrrQ2pq6DVZBJTJqltGRDiVI1QPeGePMf5ZZ4Q
 fKBEEZJuYUTv06Hc9j7uRVPjWfJIZ/QojlqycXPUJP79+gRz+Z2jRrv3o
 TOqByeUtTNiCOTNZbPl8Sw7kg6ge2qLEb4y72n9wGPFsHzszCZ+B9f6uA A==;
X-CSE-ConnectionGUID: Eu60iSzJRoi26H6kD+wqsg==
X-CSE-MsgGUID: sKEnfp1vQn+PfAqWWUO6jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="64630520"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="64630520"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 15:33:15 -0700
X-CSE-ConnectionGUID: Xhyw1YUpTWSrV7sGRd31kg==
X-CSE-MsgGUID: BOsZqWeJS/OCnyBVdGqTlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="161553798"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 15:33:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 15:33:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 15:33:14 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.87)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 15:33:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pGzF+6KIB/p7np8Xrw8mWIQTDQUJxv6xXgsyvfBoKj0vDbQVkFnFzFeaFf/YZLiYomZ3w7S9m88LVDwYh+r0Z2IRKVbrkxjRP9L0rgQ93swLcT2xSs+DayV0JU3byXokkfRH5fnSdsvv4/DU970doopvUF0deBQlpluqu+O2nDZ+t0tCR0SA3FmW+iUr0NlXnJTE+oOyADHu/zlhARkaUyUixN7Qeo08rIvLQFlNRhOQ3Ug1cyBP5N2c/BnVTZLW/jYpG9qvVjKjxdcbPmNNVdSk5xrdT/aYQXsbLT8nWE2SfI3t9cZv42fCSXAb3MhBMUer7CFCdI1JtacrTBDyMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqzoe9FRcBO/xVpk30oZFAtJA/C8MvCDcFMwgNCcOuA=;
 b=rvSMCsCRZoSyRCXs5iyfFGafNRWYyxpdC8pUrkNMgFwfAWD3YiW/foqazhTBQYKpDw4yN7l2lGubLxfUPhG5kI8H4tqvmBSwJ3UBpr8jAeOunxQIDjDD1AVDxNDP12Gnfw32GAiVufMTGKBiNLdbCVWL9twzry2wQY5FKlcY6lghMS3YpBE8FHeuoR6Q66b+nmYslcYc1DMW2sWprvpGKaLa/oPsgSBjP+rI2AdzM2MCxLv0HLZ3JuGtYSdFtOieY54SQEFTt4ze1vE0extCdVg7RKg/jsCnBDUKT1UbbAL3rrP6Fy592ewhxqc1BZ7zbrpxwy6OBc2XQyBdg0aT+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CO1PR11MB4881.namprd11.prod.outlook.com (2603:10b6:303:91::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.26; Wed, 9 Jul 2025 22:32:58 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%6]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 22:32:57 +0000
From: "Almahallawy, Khaled" <khaled.almahallawy@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Mistry, 
 Disantkumar IsvarBhai" <disantkumar.isvarbhai.mistry@intel.com>
CC: "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t] tools/intel_dp_compliance: Enabling XE driver
 support
Thread-Topic: [PATCH i-g-t] tools/intel_dp_compliance: Enabling XE driver
 support
Thread-Index: AQHb8JIkqcLF2Wwo4UOpf3ZTTjrv37QqYa+A
Date: Wed, 9 Jul 2025 22:32:57 +0000
Message-ID: <0d6f49b890d60aa8ffcb6197c2320d24c3764462.camel@intel.com>
References: <20250709050744.3050283-1-disantkumar.isvarbhai.mistry@intel.com>
In-Reply-To: <20250709050744.3050283-1-disantkumar.isvarbhai.mistry@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5373:EE_|CO1PR11MB4881:EE_
x-ms-office365-filtering-correlation-id: 64967e9d-e8fc-4c77-e3ac-08ddbf388e05
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?K3pDcDR6RjVXMTROOWxNenIvWmxDYmQ4L3g3c25tTGNqVVBZQlErWWg3VEVa?=
 =?utf-8?B?cDJsOVV3em1aZ3R2VDNtNHBWMlJZMmkxdm42NkZvVHVvZnR2OTJVNGZQcTBF?=
 =?utf-8?B?SVh1b3cvQi9oTVZxUUJQSDBYTGtCaU5zUnlKK0FjaldmeXFOR21nQmN3bktW?=
 =?utf-8?B?REdUYi9ka2IzbXF1Wkk2cjlvMzMwQ0gxcUNkUlZDZk1IbGZFMUZsekx2UG1R?=
 =?utf-8?B?aDFEZ3B6M0hFaGUxcmZIUTBlRGwyY00wZlF2eGdBbis4aG16eHFkMDdkWE5V?=
 =?utf-8?B?N21zWm04SE1zbkhEcmxEdjQ2OGVQUDRqQ0RucllHVkNtNDVjOTBqNXBTUG5q?=
 =?utf-8?B?ckdLMlp0WFh6ZVZJZWYvK0JCS2QwWW9idGZEVDZNdzZYM2FxK0hucGVUeDhm?=
 =?utf-8?B?T0xsT2NOV0U2eElIbUM3RXZ5VUFlQzlEc0RWbC9PbUxUMGxoUEh1alpPb1lI?=
 =?utf-8?B?K3R6emUyYkRFZGR2MGFwRHBWWU84LzhpVmc2YnUrb3NUbERWaEVjd0lGV0pP?=
 =?utf-8?B?M2diQnhzVytiTG1VLzNrMzVKOHVFZVdIeVZkMXF0MjVrZ0xqN2M0YjR5SnJ2?=
 =?utf-8?B?SW1sSFdXcUlKZ29yeE5kaVlFYmFYSEpCbSt3RWpsNVlNSkYzWGIxOTMyZU54?=
 =?utf-8?B?NWZ0MjI3dkxxMFA2bWRVbXE3K3ppK2wyK0VuR0ZIVmlGYklORTQrcDdoYm43?=
 =?utf-8?B?dUV1YjFLOHNyVXo1dlpUendmRWlLN24wU1d1R2kxR1YwdG1SaitIRXljdnhy?=
 =?utf-8?B?SXlSbk9rTmgrZk9DOGJaZW40Ri9QNWR4Z2NCU25JWDJrNDYrMUtSUDl4dHc3?=
 =?utf-8?B?QnRlVXNyeFlDaVoxRGpaTHJlaTRvVTdBZHU3czJPTXJmdnRzUXMzQ3RTTzVF?=
 =?utf-8?B?VnNsZXUwRjRIZTBJZGw5V1l3YXJmNzVQMG8zbHR4ZGxkbnh1QVFrYlA3Sk9y?=
 =?utf-8?B?UUZNMVFqTy84L0FXS1N4VnR2UWlBemZObW01KzVSNmVlM1BSamJpQm5YVkR6?=
 =?utf-8?B?T0ZRRWJrM292K0FMZDBJYUZzcGUvVVM5cHczcXRXWDNGN0U5eWhtZHFVUW1w?=
 =?utf-8?B?UmdVeTh3MU5Tcm8razZacHBJOTNMQUJ6Sm44d3NxeGVDV2ZqcGdlYlB4bkhG?=
 =?utf-8?B?ZlV5aUtMbHM4UjRtYWRld2JkSVhDSDFCdm5LNGR1c1lsM2pSaGMwWWZjbGlN?=
 =?utf-8?B?RmhkS2t4MTd5Z3JESktMV2NnQ2xHM0ovWUlhZGl1N2dmM0tudzNqMjJRenJD?=
 =?utf-8?B?Y015SWI1MXdwR3dXSWMyWmxVZGYrWFM1Y3hIWWVLTkVqaU9JWSt0c2tkZXdv?=
 =?utf-8?B?NkJ5d082NnR2UzhlVG9SWTBCOHFxVEdKcHU1MTNFYjJsWjhDUDRvSUhMN0I2?=
 =?utf-8?B?STJ5a01DcXFRY0dORGMrQTUvU0tGM3hnNmlGQSs3UjRFV2o3WjJjRlFLeU1T?=
 =?utf-8?B?c3NWN3IvQzhNcnIzd0crUTBvUHNlaHJWZ1J3aDRLekxUYkZjSlgvbXNLYkJj?=
 =?utf-8?B?Z2pIbVRuR3c0UVVjR2FVRGZOd0w5WVBOL3B6azl3Y3R6bWdQNXp4U3Nyem1r?=
 =?utf-8?B?UzNWNm53R2hSM1pyOHZ0THZ4ZDVXejcrcWwyYVJjTStkUWMvRklMam5hN3dO?=
 =?utf-8?B?MkpYTnBKS2xMTUxkMDBnR25CMVM3Z0h4RFNsNExnS2VoeXMva1lRdmFRc0ZQ?=
 =?utf-8?B?aEFURENuQUVTWkFlSThqREd2cit1VTlVSHFFOUZkUVRYRHJmeDVPTy9qWEZt?=
 =?utf-8?B?THQ4RFVKd3c2bmNoSDFZVHFVMkZESU9NSjZsUVFwNjMyajN5ZW1oUFRrcDlm?=
 =?utf-8?B?Wm05VWcxVzVwOUVOb09lbHBiRVUyUlZ0VWVkYkV6aHZxOUhOYlpuWVRPQTlG?=
 =?utf-8?B?UmMrZklIek9JcmhYS0l0eWZrOGQySFNMRXUxTUlMRTFwM0pXVnlhbVBoYTRJ?=
 =?utf-8?B?L21EVDU3bVc3ZFZadjFkWXpHdTY2Q0FLdUN6QUNjR0FIemNPdXJPM1FibUZZ?=
 =?utf-8?B?RmNiMTdiY0J3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2o1K3Y0TUVqbGFqQ2QreXJCSlJ6dENnL2hsaGZUSmJJY3R4Sjh2WVN0VGxJ?=
 =?utf-8?B?blp2VjdiRVBSQmtGcDY1azVDZzB6cGdaNWRaVzlkaDVROXlYdWpFK1Vyek5F?=
 =?utf-8?B?YkZBbWoxdHdwQTB4cm9PU0RpVXBlM1ZNSTJzTnJFYUY1MXR6RDNxTUZidkM0?=
 =?utf-8?B?a29HUmxMMC9nQ0o1WUZ6T0ZyVTNMdUNoMzh3L1pzRExHWVA1b0U0dUdwYnJW?=
 =?utf-8?B?c2QrSnBmUHQ4YUFESVRaeE13cUdnZkNxUmN1a25wZlN3V1c2Wk9QenVOMnZO?=
 =?utf-8?B?RE9NWllHN2dYQ3psekJDRmFzSVZkZS9TYlF3Uys4ZWRkS1RNbFN6dGVvejlJ?=
 =?utf-8?B?NDJWT0JVUVhFQnI0d2R1NnFUN29IVUNzWmJmSklVbVRNWW5FNERXWDc5NDNK?=
 =?utf-8?B?aDdPYUN2akNKVUovcldqdFFUOER4SXJJTmNDQjlETXVsamNIYURFaXc3TnJ2?=
 =?utf-8?B?K09FQ3ZNL2FUbFp6ZXQ0UE9DdURKd1hROENJdG9tdllDTU94QitBV2hjSEJH?=
 =?utf-8?B?cnNGb3ZocnZzTHNCMittNHZwYThHUXB4U3FqVUN6dDltWm9rQVUrY2dZNGhs?=
 =?utf-8?B?ZjM4MDkvL1lsRlg1MVBmNUJCTHRuMk9wU2hWLzVncUQydEU1MVd3R1dqUkRB?=
 =?utf-8?B?cVU1ekh1QmxydlJmTmw4STQzWmJLdVd1dEpScGk5WGNHdHI5VEFiR0VIU25S?=
 =?utf-8?B?RVFMVWo0T083WHQrOHd5c0RMSzFCTkh5UEZoT1Ywb1U1VGFPTUJkL3FkMGM5?=
 =?utf-8?B?VGpQcVVxWHBES3pJOHRwdTM3WW45QklRaEJUaWtsNGtoN09tTTY1TXA5cStu?=
 =?utf-8?B?djczR1pyMHhqdHVhRVRmVkFSOXlEQWhxcXBQYThDc1pQZklybHBISkk3QlNq?=
 =?utf-8?B?aTVCYjdvQnFWUWc5NTNYcnhIUUgyZ0FtS0RMaXczc3RVR0pxeEp5OElmSUQ1?=
 =?utf-8?B?N1lCV1VIQUpKODJtajhkT2RBQU41NVhhanR3THQwRnhJR0lOOUl6c0RUSkJC?=
 =?utf-8?B?dStMZTMvQUpaRGhrOEREZUZaaTFyWFYvQjlYSG1CQ2pmWFZiU2hOUXA4T3ZW?=
 =?utf-8?B?Wi85Q1ZZKzZ1MW9OcFhOSFJvbE0wTHhUd2Z6T2QyeHU3M3J3OE5udFk3UzRP?=
 =?utf-8?B?ZGhtUkE2bzhnWkswZjlTOVdjb0Mxa1p2a25CNW14a0dRNEU4OXJKcTA1ZEtp?=
 =?utf-8?B?OVpINThsREE0QzVKeGdZTW9YSE9saGdUUEd4bDN3bGxneXVYVSt3T243RzBJ?=
 =?utf-8?B?QjkwaTloSGdaMFAvbElWUFBsVjF1YTZueEhhZmYyVUdBL2hPYUNHRFZrbS8r?=
 =?utf-8?B?U0gyOThLeUlrcUFsYlh6U1dvTU1TQy9GQXI2RFJON1ZlVEp5Mmtid3V3Nys4?=
 =?utf-8?B?Z2taN2FvMWVXTzBZS083cUFXODFjcEVRVFB2anF5MW1KS29SQUVtUHRVVWRw?=
 =?utf-8?B?c2dkOUs5OVV4bWVZdHZPalBIclJCZUxGR055ZDgzSXRiZk9LWXk2ekFBT0dB?=
 =?utf-8?B?T2RFQ3Y2WnJFVVhiTjFEOUpQbnJLNjM4eG9SdW9ubHNTQjU1UXVuNjhhM2J0?=
 =?utf-8?B?U3lKOFArTkJ3VWxCZWlheXBxbUV4TFdmSFpkdWJSZ0J0Y3JuNThqNHBiUjJy?=
 =?utf-8?B?V1BVQ0lHZjY0bXNzN2RlaTRLQkNqaWJqNHJvNGlRZ0RHT2h5Kzd1UDVHWkk1?=
 =?utf-8?B?NTlOdjkwTlE2WW1zNWYvUnQ4MGlBb0lqOS9xM3JuanNtbzZCeVNDZUpJK1Ex?=
 =?utf-8?B?MW1PdTZzQU1OUWh2Z0lkVzVMZ1ZoR2loMFdOblRVQVdDa0tqbTJ3djBVRTJJ?=
 =?utf-8?B?NlkzeWVja1VFcE1tUW9RZStjWkhKYjQrbmIxc09Wa096M2xLZVN0Z1cyZlpT?=
 =?utf-8?B?SVJQS2pIK3ZSTU5TUGM4WTE2Z3dnZGhYRUZ0TE42RnJPcHBGMEwxOERXVHd6?=
 =?utf-8?B?Z0p4L1o4RTFqMTNFUjByb29yS0o0VHJqOTZHbzQrUU1Qejl6aEhnZmVKdUor?=
 =?utf-8?B?T1dVcHpUaDBPZ2tiMXQ0REhPQ1haS2UxbUd4YlAwbUVSR0VrOGtWM1VwUVVJ?=
 =?utf-8?B?TzNOSkhPZEdPTHpXenFZdFZ4N1E2L3VpYmQvYjZUOG9qeTJiVlZIZmlhOTRq?=
 =?utf-8?B?S0UxaDRGdUdOd1RZSFA2SVFxREZYZThJYXk2RlRQeDlDb2V5SXljU0Fudjgr?=
 =?utf-8?Q?C8zQIf8yFRg26LFbPX5OMec=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1337F984CE58FC48A1A58A7E3DD477CB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64967e9d-e8fc-4c77-e3ac-08ddbf388e05
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 22:32:57.7856 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qnzlIAiIbkbIZzt2scYkVWMb1So6aIjgcqgyi+VuinuFt0fq9SwaBq20MTnAS7AXxLTwugQ3qG2fGtsZHCI0NxupBFCYtYmmpUH1o8IlIaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4881
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

VGhhbmsgWW91IGZvciB0aGUgcGF0Y2gNCg0KVGVzdGVkIHVzaW5nIFBIWSBDVFMgc2V0dXAgdXNp
bmcgTVRML2k5MTUgYW5kIFBUTC9YRSBhbmQgdGhlIGZsb3cgaXMNCnN0aWxsIHdvcmtpbmcuIA0K
DQpUZXN0ZWQtYnk6IEtoYWxlZCBBbG1haGFsbGF3eSA8a2hhbGVkLmFsbWFoYWxsYXd5QGludGVs
LmNvbT4NCg0KT24gV2VkLCAyMDI1LTA3LTA5IGF0IDEwOjM3ICswNTMwLCBEaXNhbnRrdW1hciBN
aXN0cnkgd3JvdGU6DQo+IGk5MTUgYW5kIFhFIGRyaXZlciBoYXMgZGlmZmVyZW50IGFwaSBmb3Ig
bWFwcGluZyBidWZmZXIuIEVuYWJsaW5nIFhFDQo+IGRyaXZlcg0KPiBzdXBwb3J0IGJ5IHNlbGVj
dGluZyBYRSBkcml2ZXIgc3BlY2lmaWMgbWFwIGJ1ZmZlciBhcGkgZm9yIFhFDQo+IGRldmljZXMu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBEaXNhbnRrdW1hciBNaXN0cnkNCj4gPGRpc2FudGt1bWFy
LmlzdmFyYmhhaS5taXN0cnlAaW50ZWwuY29tPg0KPiAtLS0tDQo+IHYyOg0KPiDCoC0gVXBkYXRl
ZCBjb21taXQgZGVzY3JpcHRpb24NCj4gLS0tDQo+IMKgdG9vbHMvaWd0X2RwX2NvbXBsaWFuY2Uu
aMKgwqAgfMKgIDEgKw0KPiDCoHRvb2xzL2ludGVsX2RwX2NvbXBsaWFuY2UuYyB8IDQzICsrKysr
KysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tDQo+IC0tDQo+IMKgMiBmaWxlcyBjaGFuZ2Vk
LCAzMCBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90
b29scy9pZ3RfZHBfY29tcGxpYW5jZS5oIGIvdG9vbHMvaWd0X2RwX2NvbXBsaWFuY2UuaA0KPiBp
bmRleCAyMjZhMTM2NjI4NzEuLmI0MzU3Y2E1NTczMyAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvaWd0
X2RwX2NvbXBsaWFuY2UuaA0KPiArKysgYi90b29scy9pZ3RfZHBfY29tcGxpYW5jZS5oDQo+IEBA
IC0zMyw2ICszMyw3IEBADQo+IMKgI2Vsc2UNCj4gwqAjaW5jbHVkZSA8Z2xpYi5oPg0KPiDCoCNl
bmRpZg0KPiArI2luY2x1ZGUgPHhlL3hlX2lvY3RsLmg+DQo+IMKgDQo+IMKgZXh0ZXJuIGludCBk
cm1fZmQ7DQo+IMKgDQo+IGRpZmYgLS1naXQgYS90b29scy9pbnRlbF9kcF9jb21wbGlhbmNlLmMN
Cj4gYi90b29scy9pbnRlbF9kcF9jb21wbGlhbmNlLmMNCj4gaW5kZXggOTkxOTZhNDUwYjQ1Li4y
YjJmZmQ0MDJkYzYgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL2ludGVsX2RwX2NvbXBsaWFuY2UuYw0K
PiArKysgYi90b29scy9pbnRlbF9kcF9jb21wbGlhbmNlLmMNCj4gQEAgLTM0OSw3ICszNDksMTQg
QEAgc3RhdGljIHZvaWQgZHVtcF9pbmZvKHZvaWQpDQo+IMKgCWlndF9kdW1wX2Nvbm5lY3RvcnNf
ZmQoZHJtX2ZkKTsNCj4gwqAJaWd0X2R1bXBfY3J0Y3NfZmQoZHJtX2ZkKTsNCj4gwqB9DQo+IC0N
Cj4gK3N0YXRpYyB2b2lkICptYXBfYnVmZmVyKGludCBmZCwgdWludDMyX3QgaGFuZGxlLCBzaXpl
X3Qgc2l6ZSkNCj4gK3sNCj4gKwlpZiAoaXNfeGVfZGV2aWNlKGZkKSkNCj4gKwkJcmV0dXJuIHhl
X2JvX21tYXBfZXh0KGZkLCBoYW5kbGUsIHNpemUsIFBST1RfUkVBRCB8DQo+IFBST1RfV1JJVEUp
Ow0KPiArCWVsc2UNCj4gKwkJcmV0dXJuIGdlbV9tbWFwX19kZXZpY2VfY29oZXJlbnQoZmQsIGhh
bmRsZSwgMCwNCj4gc2l6ZSwNCj4gKwkJCQlQUk9UX1JFQUQgfCBQUk9UX1dSSVRFKTsNCj4gK30N
Cj4gwqBzdGF0aWMgaW50IHNldHVwX2ZyYW1lYnVmZmVycyhzdHJ1Y3QgY29ubmVjdG9yICpkcF9j
b25uKQ0KPiDCoHsNCj4gwqANCj4gQEAgLTM2MSwxNSArMzY4LDE5IEBAIHN0YXRpYyBpbnQgc2V0
dXBfZnJhbWVidWZmZXJzKHN0cnVjdCBjb25uZWN0b3INCj4gKmRwX2Nvbm4pDQo+IMKgCWlndF9h
c3NlcnQoZHBfY29ubi0+ZmIpOw0KPiDCoA0KPiDCoAkvKiBNYXAgdGhlIG1hcHBpbmcgb2YgR0VN
IG9iamVjdCBpbnRvIHRoZSB2aXJ0dWFsIGFkZHJlc3MNCj4gc3BhY2UgKi8NCj4gLQlkcF9jb25u
LT5waXhtYXAgPSBnZW1fbW1hcF9fZGV2aWNlX2NvaGVyZW50KGRybV9mZCwNCj4gKw0KPiArCWRw
X2Nvbm4tPnBpeG1hcCA9IG1hcF9idWZmZXIoZHJtX2ZkLA0KPiDCoAkJCQkJZHBfY29ubi0NCj4g
PmZiX3ZpZGVvX3BhdHRlcm4uZ2VtX2hhbmRsZSwNCj4gLQkJCQkJMCwgZHBfY29ubi0NCj4gPmZi
X3ZpZGVvX3BhdHRlcm4uc2l6ZSwNCj4gLQkJCQkJUFJPVF9SRUFEIHwgUFJPVF9XUklURSk7DQo+
ICsJCQkJCWRwX2Nvbm4tDQo+ID5mYl92aWRlb19wYXR0ZXJuLnNpemUpOw0KPiArDQo+IMKgCWlm
IChkcF9jb25uLT5waXhtYXAgPT0gTlVMTCkNCj4gwqAJCXJldHVybiAtMTsNCj4gwqANCj4gLQln
ZW1fc2V0X2RvbWFpbihkcm1fZmQsIGRwX2Nvbm4tPmZiX3ZpZGVvX3BhdHRlcm4uZ2VtX2hhbmRs
ZSwNCj4gKw0KPiArCWlmIChpc19pOTE1X2RldmljZShkcm1fZmQpKQ0KPiArCQlnZW1fc2V0X2Rv
bWFpbihkcm1fZmQsIGRwX2Nvbm4tDQo+ID5mYl92aWRlb19wYXR0ZXJuLmdlbV9oYW5kbGUsDQo+
IMKgCQnCoMKgwqDCoMKgwqAgSTkxNV9HRU1fRE9NQUlOX0dUVCwgSTkxNV9HRU1fRE9NQUlOX0dU
VCk7DQo+ICsNCj4gwqAJZHBfY29ubi0+ZmJfc2l6ZSA9IGRwX2Nvbm4tPmZiX3ZpZGVvX3BhdHRl
cm4uc2l6ZTsNCj4gwqANCj4gwqAJLyogQWZ0ZXIgZmlsbGluZyB0aGUgZGV2aWNlIG1lbW9yeSB3
aXRoIDBzIGl0IG5lZWRzIHRvIGJlDQo+IHVubWFwcGVkICovDQo+IEBAIC0zOTEsMTUgKzQwMiwx
NyBAQCBzdGF0aWMgaW50IHNldHVwX2ZhaWxzYWZlX2ZyYW1lYnVmZmVyKHN0cnVjdA0KPiBjb25u
ZWN0b3IgKmRwX2Nvbm4pDQo+IMKgCWlndF9hc3NlcnQoZHBfY29ubi0+ZmFpbHNhZmVfZmIpOw0K
PiDCoA0KPiDCoAkvKiBNYXAgdGhlIG1hcHBpbmcgb2YgR0VNIG9iamVjdCBpbnRvIHRoZSB2aXJ0
dWFsIGFkZHJlc3MNCj4gc3BhY2UgKi8NCj4gLQlkcF9jb25uLT5mYWlsc2FmZV9waXhtYXAgPSBn
ZW1fbW1hcF9fZGV2aWNlX2NvaGVyZW50KGRybV9mZCwNCj4gKwlkcF9jb25uLT5mYWlsc2FmZV9w
aXhtYXAgPSBtYXBfYnVmZmVyKGRybV9mZCwNCj4gwqAJCQkJCQkgZHBfY29ubi0NCj4gPmZiX2Zh
aWxzYWZlX3BhdHRlcm4uZ2VtX2hhbmRsZSwNCj4gLQkJCQkJCSAwLCBkcF9jb25uLQ0KPiA+ZmJf
ZmFpbHNhZmVfcGF0dGVybi5zaXplLA0KPiAtCQkJCQkJIFBST1RfUkVBRCB8DQo+IFBST1RfV1JJ
VEUpOw0KPiArCQkJCQkJIGRwX2Nvbm4tDQo+ID5mYl9mYWlsc2FmZV9wYXR0ZXJuLnNpemUpOw0K
PiArDQo+IMKgCWlmIChkcF9jb25uLT5mYWlsc2FmZV9waXhtYXAgPT0gTlVMTCkNCj4gwqAJCXJl
dHVybiAtMTsNCj4gwqANCj4gLQlnZW1fc2V0X2RvbWFpbihkcm1fZmQsIGRwX2Nvbm4tDQo+ID5m
Yl9mYWlsc2FmZV9wYXR0ZXJuLmdlbV9oYW5kbGUsDQo+IC0JCcKgwqDCoMKgwqDCoCBJOTE1X0dF
TV9ET01BSU5fR1RULCBJOTE1X0dFTV9ET01BSU5fR1RUKTsNCj4gKw0KPiArCWlmIChpc19pOTE1
X2RldmljZShkcm1fZmQpKQ0KPiArCQlnZW1fc2V0X2RvbWFpbihkcm1fZmQsIGRwX2Nvbm4tDQo+
ID5mYl9mYWlsc2FmZV9wYXR0ZXJuLmdlbV9oYW5kbGUsDQo+ICsJwqDCoMKgwqDCoMKgIEk5MTVf
R0VNX0RPTUFJTl9HVFQsIEk5MTVfR0VNX0RPTUFJTl9HVFQpOw0KPiDCoAlkcF9jb25uLT5mYWls
c2FmZV9zaXplID0gZHBfY29ubi0+ZmJfZmFpbHNhZmVfcGF0dGVybi5zaXplOw0KPiDCoA0KPiDC
oAkvKiBBZnRlciBmaWxsaW5nIHRoZSBkZXZpY2UgZnJhbWVidWZmZXIgdGhlIG1hcHBlZCBtZW1v
cnkNCj4gbmVlZHMgdG8gYmUgZnJlZWQgKi8NCj4gQEAgLTQyOCwxNCArNDQxLDE2IEBAIHN0YXRp
YyBpbnQNCj4gc2V0dXBfdmlkZW9fcGF0dGVybl9mcmFtZWJ1ZmZlcihzdHJ1Y3QgY29ubmVjdG9y
ICpkcF9jb25uKQ0KPiDCoAlpZ3RfYXNzZXJ0KGRwX2Nvbm4tPnRlc3RfcGF0dGVybi5mYik7DQo+
IMKgDQo+IMKgCS8qIE1hcCB0aGUgbWFwcGluZyBvZiBHRU0gb2JqZWN0IGludG8gdGhlIHZpcnR1
YWwgYWRkcmVzcw0KPiBzcGFjZSAqLw0KPiAtCWRwX2Nvbm4tPnRlc3RfcGF0dGVybi5waXhtYXAg
PQ0KPiBnZW1fbW1hcF9fZGV2aWNlX2NvaGVyZW50KGRybV9mZCwNCj4gKw0KPiArCWRwX2Nvbm4t
PnRlc3RfcGF0dGVybi5waXhtYXAgPSBtYXBfYnVmZmVyKGRybV9mZCwNCj4gwqAJCQkJCQnCoMKg
wqDCoCBkcF9jb25uLQ0KPiA+dGVzdF9wYXR0ZXJuLmZiX3BhdHRlcm4uZ2VtX2hhbmRsZSwNCj4g
LQkJCQkJCcKgwqDCoMKgIDAsIGRwX2Nvbm4tDQo+ID50ZXN0X3BhdHRlcm4uZmJfcGF0dGVybi5z
aXplLA0KPiAtCQkJCQkJwqDCoMKgwqAgUFJPVF9SRUFEIHwNCj4gUFJPVF9XUklURSk7DQo+ICsJ
CQkJCQnCoMKgwqDCoCBkcF9jb25uLQ0KPiA+dGVzdF9wYXR0ZXJuLmZiX3BhdHRlcm4uc2l6ZSk7
DQo+ICsNCj4gwqAJaWYgKGRwX2Nvbm4tPnRlc3RfcGF0dGVybi5waXhtYXAgPT0gTlVMTCkNCj4g
wqAJCXJldHVybiAtMTsNCj4gwqANCj4gLQlnZW1fc2V0X2RvbWFpbihkcm1fZmQsIGRwX2Nvbm4t
DQo+ID50ZXN0X3BhdHRlcm4uZmJfcGF0dGVybi5nZW1faGFuZGxlLA0KPiArCWlmIChpc19pOTE1
X2RldmljZShkcm1fZmQpKQ0KPiArCQlnZW1fc2V0X2RvbWFpbihkcm1fZmQsIGRwX2Nvbm4tDQo+
ID50ZXN0X3BhdHRlcm4uZmJfcGF0dGVybi5nZW1faGFuZGxlLA0KPiDCoAkJwqDCoMKgwqDCoMKg
IEk5MTVfR0VNX0RPTUFJTl9HVFQsIEk5MTVfR0VNX0RPTUFJTl9HVFQpOw0KPiDCoA0KPiDCoAlk
cF9jb25uLT50ZXN0X3BhdHRlcm4uc2l6ZSA9IGRwX2Nvbm4tDQo+ID50ZXN0X3BhdHRlcm4uZmJf
cGF0dGVybi5zaXplOw0KDQo=
