Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A34DC5B552
	for <igt-dev@archiver.kernel.org>; Fri, 30 May 2025 10:16:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A845110E0CA;
	Fri, 30 May 2025 10:16:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BncBobNW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A87C10E00B
 for <igt-dev@lists.freedesktop.org>; Fri, 30 May 2025 10:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748600168; x=1780136168;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=KpB+DaO0Gwj2PuMTBlNRW/dLT1zYaIOcEIBvpPvj0R0=;
 b=BncBobNWv3C6G/PvxkdLJl8TpXNBYjomi9YhLiKtfvSnBQVZB/TcaPk2
 iO5dOMUZm/1vv5SxvtcZF8IoZe+OfyG1rgicp9rxwi7RfxQGDpYZWeefW
 ++vLYch8mvacOMLnBRrgK0+SG6rYzzbSSyhYqS8dJXoxOSun1oNiCEQ0w
 Wsq3UAx8aFMJcfJxgtMQVEpVG5ehZ2IpI9jUDG6TQGrqVi02CIhZ2qMUN
 6lojHlKZ2nMKZWoTWTuwRxcMrhcUR+TIvRMEcC5Ran8OLii4/fpZeU8qD
 N8yqoPDLiQAbhIkCM+/OGk1SklFb0IVAOxPT4PFTeXWMDyHfzRgSBQkPd A==;
X-CSE-ConnectionGUID: sTTN6TbFTgaOD8ARZa6Icw==
X-CSE-MsgGUID: UVsMB4KLTdiBvVfqrsl/cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50739820"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="50739820"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 03:16:05 -0700
X-CSE-ConnectionGUID: msrkwuzDTWGUtA/IXgpA3g==
X-CSE-MsgGUID: bWXtg7/eQCKEMOrTl5/LeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="144475373"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 03:16:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 30 May 2025 03:16:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 30 May 2025 03:16:03 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.43)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 30 May 2025 03:16:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xU6pGs8mUDXu+sW7/wWMLdHVAViA4n2Zi7jsOJ69HqjFsGQ+rHvYcHfL424QNHP+QABK0y1u9+INJ7o+kWbNI2ir/VkLHkJP2C+OV9A21cXKuxPDWUPSjPJa7bcQQzuUk4lHXN0gFAJSc3ia4Qc9aY5AUborzzWUgj8Dh4J12J2Mcy4OyJJUCXTk+ZAPrPgnFI6V7aVkzJseVK2JTizbkFvIc5f+uJNPBOAv/QFxL9KQcw3oTrSInWlxaNf2RdGZ+oF2stk+qcf3kCiCbgwBgjhcPXVLr2i6rRLWyx+9bmJ+0daem3dvFE451stB/8rYlma/VrPlWRhnEP6l4dzzUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KpB+DaO0Gwj2PuMTBlNRW/dLT1zYaIOcEIBvpPvj0R0=;
 b=WHjtc2p9Hjf0g23YrP2L/mCRnc5kd6FBiEqp3g+IT/HN3XEV7kgCP3rkBI6S5VFOubQduCis3troKcLy18NFfeu6RHmeARo7DX+WpSg4qmJ6IJB2Xa9c820JQr5c6ZQplnvHnLdIU/kaBy66bnsMns9wteq049xutscjyNyuRz0l4J18PNMDiMcRUNDhD67+C2/YDMI3z+/6OCIJ7uhUsHco4Qfr0axIsn3WFJpMMdPLBS9sAC/VXO/1LgtSYJihQH0l4rnVKVjwreu8fFm5cRMrFHMkPdQubhkWunZEiA4GGxEXUxf3OCIbdr+c/kYQ+X2QL5oFJFIOi/2T6whjkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by SA1PR11MB6662.namprd11.prod.outlook.com (2603:10b6:806:256::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Fri, 30 May
 2025 10:15:55 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8%4]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 10:15:55 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v3 2/2] tests/intel/kms_frontbuffer_tracking: Enable the
 tests support variations based on the WAs
Thread-Topic: [PATCH v3 2/2] tests/intel/kms_frontbuffer_tracking: Enable the
 tests support variations based on the WAs
Thread-Index: AQHb0TgpEYQjG8HuEE+JpMq3TscY5rPq9TWA
Date: Fri, 30 May 2025 10:15:55 +0000
Message-ID: <521b729df326e12958b6a60f00904cc59dcfbdb8.camel@intel.com>
References: <20250530075811.1033-1-mohammed.thasleem@intel.com>
 <20250530075811.1033-3-mohammed.thasleem@intel.com>
In-Reply-To: <20250530075811.1033-3-mohammed.thasleem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|SA1PR11MB6662:EE_
x-ms-office365-filtering-correlation-id: 00c10acc-39d6-4e9c-b945-08dd9f62f6d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WUlFWFZCK1JUTFV0Y1BwWFVXKzlHalYvNjhhbC9LMWZqeVVLVUliMU9GUndx?=
 =?utf-8?B?eTRrUzgvNDdzTEFlcTE2WHRSSmYybFJKWjBtZmFZN2UyV24xZWxnOUhlZmp6?=
 =?utf-8?B?cHJGTkpoajI3YXZxMHR3aFRTLzM3am9kZW1pZkFoL0cvT21GMmMrVGExMU12?=
 =?utf-8?B?NjFRWW5TTU5sdUhFdENwWUM4ZTFac3RZQU9WRzZIdWlyWW4waEpkN3ZLOUhD?=
 =?utf-8?B?b1gwWXBQTTd3ODU5ODhIdUI1bWFHYXE1c0ZEMmlEaCtZaXVkNFZwckFLbmI0?=
 =?utf-8?B?TlA0RnJQMi9pdFBRd1NCM0VzNUN3U2g0RURxcS8yb1VpQ3dUUlZyS3ROM2Vs?=
 =?utf-8?B?ZTVySVRtenMzTVM1d2h2YndOYUlQOC9YU3FQT3dpNnVsZUlTV3J3eFdrdGxo?=
 =?utf-8?B?cGZacE1RbWVGTzNEOE5hR1RvNXBhWWk5VEg2Uk0xUDIyRXF3OGNzRFpESndF?=
 =?utf-8?B?ZW9oL2NhdlVMYXJYU3RLbDkxMnBhV28yRzFFUlg1alpEcmxjYmwwVUsybStq?=
 =?utf-8?B?MkZGdVFIQXVZWkRRa2dXUm0rK29pZ09LeEsvK2RHWHFlREpzMkVHa04zTUc1?=
 =?utf-8?B?R3Zhd0RSUnVrMlV5N2U2UXFlRmZ3Y0Z1QUdZZUxZY1VNWmtZUTh3TlBWQXda?=
 =?utf-8?B?MjdlVjBnS0VIRXpZcTlGRmE5WmhERXEzZ2VwTW9SenFYbGJ5N3ZnRGt4VUhj?=
 =?utf-8?B?elRhMWFEenpaREhqNFhySlh0YnAvSUxTYm9wUnFUL2MzN2ovMW5pWnFFR2pv?=
 =?utf-8?B?VkdiTTRSa01nMlJOVVB0YjNLN3hVSnhIREtSR2pCd1pTRnJZQWhQZ2dVaFQv?=
 =?utf-8?B?dk1UalNJSjhHdXd2Y3FnZHlHYTdwNFFWNVNYMkhRdzRQOWFhQVBRMllUUmFG?=
 =?utf-8?B?M205NkwvNTBFZVN1VTlaUkkrUGp6QjR2L0Z3a2hlaURGTEhGcUVWcG84VmRX?=
 =?utf-8?B?ZjUyQmNvamxHNWhpdFJwWERZVXF6WjAzOW1yMy9mZ1BPLzhWYXZDZCtqQTc2?=
 =?utf-8?B?UXg5WTRUMllwOEpESGY1djMrME5yUzcvTFBrUlIvSGNGSUpobDE1RStlQlBw?=
 =?utf-8?B?YUNrWlIzME9NZTlQMTNWUU5aUjhWNWtjQnR2RzRMUWdSdWpONFFsRGd2aXpQ?=
 =?utf-8?B?WWpTNXlKdGxMeHFxbE5mNlg1TU5rQ2o4MkhIUkFiVEdXdXBLa1V6cjBUUWpU?=
 =?utf-8?B?Lzkyb0RpS2JTQWdCS3RsNytkQ1plTVdxUjF1Z3FnZWlZam1la1NyL1ZnTTNo?=
 =?utf-8?B?TDN5MjlBOFZTbWxKajI5RVRQM05wai8rYitaYlNxNi8yelpLYTJ4OGpKTjMz?=
 =?utf-8?B?Tk9qWGFhSVdEaHhUNGFwZVdHV00wU0VVcDJrVmN6MmFUTXg3QWUzanYreU1k?=
 =?utf-8?B?QjlYTVBGUERhUmVlbWJTV2duVVRCeVJvbW50VkpiZVhDNGdOSkc1YnFBbGZk?=
 =?utf-8?B?bVdnUzA1VHgrQnpTdE9hWDZCTzN5VEtqM2tDeFVUZlA2STdSWldjWDlPTVow?=
 =?utf-8?B?U3BFR2JveTRXY1ZoVDl6cE1wOXRCS2FCZHpTU3Z0bEthVmU4MmhDNktiN2JE?=
 =?utf-8?B?QWZzU1dJV1gzM2EwYWExbkVWbTJkSTVRalkvYnkyVGV6dHBTQytOMkJhR3ZG?=
 =?utf-8?B?cWVLZ3B0cGh2SEgxL0RkTUdNdXNMVVJmd0RaOEx5NE80dVU4MUp6NldZVlcr?=
 =?utf-8?B?SmJhZkNjZWwzQ2FNMXErSnMzb05QUG5sOElpQU10R1NQQkc3V3RZSDZBMDd4?=
 =?utf-8?B?UHR5Z0FUSFVKc1lwT2I5RTNsUFY4UnNIbERTam9VT0ZlTTQrQW5DVXRuVlVp?=
 =?utf-8?B?OXVqT3MvS3BlS3RNWndIM2FtWGJEWVphS3pVQUJjcWpuTVhBNkpMRTNXM05T?=
 =?utf-8?B?QVowSlpwRyt1bzVzYytudzc4NmlMUktvd2l1ankrMkVuTUw5U093R1pBQTZ4?=
 =?utf-8?B?NENWZkFhZWsvRU9NL0ZHcnhUdXY2WTkyUEpHTVBsSytoSGduZW5DdDBXUGRj?=
 =?utf-8?B?ckxwM2RLek1BPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3ROYy9GQmVlODNGSGJsTnI4NkZOaGQyTldoaTNJV3UyUkFKMUJiSkJMZElh?=
 =?utf-8?B?RE9rbVQyeDUyTkc0Wlova3Q2bWNkS0dDUlFXekZUTStucnpMRG9CZ0EzV1Bw?=
 =?utf-8?B?MjhKTFAvOEZzM3FZZWhzNlBZdHAzNld5WkJRdThKalZKd3UwQVlwWWJBVkpL?=
 =?utf-8?B?NEY4UVM1WlYzZGlibTdMV3hBeDJBUFNWVFQ4a1pPeGMrZ3VrbTR4V3E4NlNB?=
 =?utf-8?B?TkFxb3hha3gwdGpzZy9lVTlvYkM2RTZwTUU2cm4wTU03bENJUnRnYkJnTktP?=
 =?utf-8?B?bFBjSXlhZklTWDRPdTA3ckFDei9UTmQxaThIYjJQZ2lGWnJHdU82VjFDYlJM?=
 =?utf-8?B?MWlINVV4WURRQkVHTXhJMTZ2dHJDKzYwNVI5SFV4aVc0dGFPbDZJenVIMWVN?=
 =?utf-8?B?enZGb2FzTnlXOUlMNGhrRDNhT2FOcVo0b3gyR3ZoVGNTTnVPRHJBL1NmRlpX?=
 =?utf-8?B?dnVYUXJrdGw5NDlvQWp3ZEJkZ3U2cVhtTHFZa29yaElWM2NrNWc0bVpVN3hq?=
 =?utf-8?B?Rlp3QnlRZlBHc3dHbU5JeFovc24yTlZ0SW82WXM5enVQa0hZYXBwZGRCQmpH?=
 =?utf-8?B?VTlETnBzMlVHQXBmVENYeUdVN3lSQlZ2aGVkOFRickZ0ald6cXFsMzlxMDc4?=
 =?utf-8?B?WXFvaDFmVHpTNzdXdldnN0RxRlBNaTF2amZlNDhQMHN0U29GUndvQk1WS09X?=
 =?utf-8?B?bTIvUXpnRSt3RjZDMTVFY0xMNEFFNlhjeW5XNVRPUkI2WnBLZlgrbjA5VE5O?=
 =?utf-8?B?VUw4eTVPNXlrSWI2YVNoMGJuR3JkVnROOG5tbTExclpNVzVXeUJhajRGakU4?=
 =?utf-8?B?MG9BZzltMjZGNmhSK24vNlB6WnFGekdtZTBEZ1Fxcm1yd3FvblllSFNzVmQ3?=
 =?utf-8?B?OU0xUnBncFRMTmFYV09ybjZxMWFNRVNoSjNhckpSNE1xMm1YWHFPOXhYeE9k?=
 =?utf-8?B?SWFsRmFKVUVhVlJKS2w4UDd6eDZVcTRlTDg0K0VHdEk3YUVBWlEwYVZZTURq?=
 =?utf-8?B?TWNUT1FYUEgzSGJkVU9nMGlmd3pFQWo2L2tzOHk2L2lUYXU5ODBFSmNrdXhj?=
 =?utf-8?B?aml5bUczTWhHakVGRWhhN2c1UXoxMnpaOVJOczJta1FpMXRqTEtVbm41MUFm?=
 =?utf-8?B?bmNnSWEvdUZ4a0k1UXluK2JkeDlvS05Lb0dMU2dENnlKSllYb3hMdmZxVEJq?=
 =?utf-8?B?OG1PK2FYaUVNTFJCK1EzTGxUTWtNUllFZ1ErUHJGeGRUeHdjN2NRYzBLVEVJ?=
 =?utf-8?B?bVBaSnlEZ2hEOGVHakpReXpXdmk5Z01PT0U5KzlDZ0lYaU4wcE85bDBpeDJH?=
 =?utf-8?B?em1QTjl3NXZPTEQ0YzhWM2hJNGJsUFV0blQzQ0pIUzdQWlIvdnZybklURVQ3?=
 =?utf-8?B?Q2d5dlB0STJOWllNNWlVamhZWmlyRGNPTEZ1V2p1OWJzT2dHYVFVN2pHa3Jj?=
 =?utf-8?B?YUF2bk9VS0NQRVcyaktkTk15SkI3NGJWSTBUcU13ZFJMcHliUDVYQmtXWlN5?=
 =?utf-8?B?ZDYvN2V5VWE5K3JZdGFaaWJUdklYNzVlRTRURjZrTndHd1NKV1NHU3ZUZHhj?=
 =?utf-8?B?RUFzSmIyQUx5c3o2dEYra1VtWGlxRXFyNWJYZW82K2c4ak0walZyV2M0WDZu?=
 =?utf-8?B?NWp6SWgrTTF0N0c5YVZVUnBqMEErcnYxTlpqWlgvRDNFMHhqSHhvc0dZOE1z?=
 =?utf-8?B?YWM3aWQrMnlxazVNZmtTMEkrbXhWblYyVjR3bnk1cUZTVk42QUhSaW50dTNa?=
 =?utf-8?B?S3lYK2ZHYVJVeG4rNkZLSFdoaUdFcWcrZ2xmMjRyTTcyZGE2eDRvd0JEbWVC?=
 =?utf-8?B?N2lkQ25GMGJyN2o2UVFNNlpDaWJPM3Nsd1hGYmlMTFJ1Wks5NXg4cnVYYUZG?=
 =?utf-8?B?cktrOXg4NjdxcTBNVDU0eEc0c2NKUm02c0QzYVI0bjdmdmttNjY2ZEF6bDhL?=
 =?utf-8?B?YURMVmFjUXVPUjBTNXNoZklVZFpZK0toWlA1YnEvRGwzQnJwM3cyRlBKakti?=
 =?utf-8?B?V0lGTzdpMjdFUkxFNWpsK1JqVWpuN3paNTdGQ3RuazZpL054L2xEeHRWOG16?=
 =?utf-8?B?T1dzRm9iUFhJVzdSMWhreDNDUWw4V1BHU05lWVBkckQwSWtkYXY4aDN0N1Bz?=
 =?utf-8?B?dmNoL0x6ZHB2UFVKOHMrNVFXcGVyQ1lyYW5WWGszYnMzRCtUWEc0cXE2dzJn?=
 =?utf-8?Q?e9FxyCd4saxE+P+N/2Iqk5E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <940F77481FDAEE4EBE47B54E49DA32B8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00c10acc-39d6-4e9c-b945-08dd9f62f6d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2025 10:15:55.2746 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W6Lb56L3wBa7IF5rS+wwujAiXd0il2W9CsK7fy3SNMGi05lZ2Ie7S+xv+8zyaimgKZmmPMWz5YQE+xh46B1zJjhxuuefjNgfDgd79glSb0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6662
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

T24gRnJpLCAyMDI1LTA1LTMwIGF0IDEzOjI4ICswNTMwLCBNb2hhbW1lZCBUaGFzbGVlbSB3cm90
ZToNCj4gVGhpcyB1cGRhdGUgc3RvcHMgc2tpcHBpbmcgZmJjLSogdGVzdHMgc3VwcG9ydCB2YXJp
YXRpb25zIGJhc2VkIG9uIHRoZSBXQXMuDQo+IA0KPiB2MjogVXNlIFdBX0ZCQ19ESVNBQkxFRCBp
bnN0ZWFkIENIRUNLX1dBLiAoVmlub2QpDQo+IMKgwqDCoCBVcGRhdGUgaWd0X3NraXBfb25fZiBk
aXNjcmlwdGlvbi4gKFZpbm9kKQ0KPiB2MzogUmVtb3ZlIHBsYXRmb3JtIGNoZWNrIGFuZCBtYWtl
IGl0IGZvciB4ZSBzcGVjaWZpYy4gKFZpbm9kKQ0KPiDCoMKgwqAgUmVuYW1lIGZ1bmN0aW9uIG5h
bWUgd2l0aCBpc19mYmNfc3VwcG9ydC4gKFZpbm9kKQ0KDQpNeSBpc19mYmNfc3VwcG9ydGVkKCkg
c3VnZ2VzdGlvbiB3YXMgZm9yDQoNCnN0YXRpYyBib29sIGlzX2ZiY19zdXBwb3J0ZWQoaW50IGRl
dmlkLCBjb25zdCBzdHJ1Y3QgdGVzdF9tb2RlICp0KQ0Kew0KCWludCB3YTsNCg0KCXdhID0gaWd0
X2hhc19pbnRlbF93YShkcm0uZmQsIFdBX0ZCQ19ESVNBQkxFRCk7DQoJaWd0X2Fzc2VydF9mKHdh
ID49IDAsICJXQSBwYXRoIG5vdCBmb3VuZCBvbiBHVHNcbiIpOw0KDQoJcmV0dXJuIHdhICE9IDE7
DQp9DQogDQpBbmQgaW4gc3VidGVzdHMsIHNraXAgaWYgRkJDIG5vdCBzdXBwb3J0ZWQuDQoNCmln
dF9za2lwX29uX2YodC0+ZmVhdHVyZSA9PSBGRUFUVVJFX0ZCQyAmJiAhaXNfZmJjX3N1cHBvcnRl
ZCguLi4pLCAiV0EgaGFzIGRpc2FibGVkIEZCQyBvbiBCTUdcbiIpOw0KDQpPdGhlcndpc2UsIHBs
ZWFzZSBrZWVwIHRoZSBvcmlnaW5hbCBuYW1lIGFzIGNoZWNrX2ZiY19zdXBwcG9yKCkNCg0KV2l0
aCB0aGF0IGNoYW5naW5nIGJhY2ssIHRoaXMgcGF0Y2ggaGFuZGxpbmcgZm9yIGttc19mcm9udGJ1
ZmZlcl90cmFja2luZyB0ZXN0cyBsb29rcyBvay4NCg0KUmV2aWV3ZWQtYnk6IFZpbm9kIEdvdmlu
ZGFwaWxsYWkgPHZpbm9kLmdvdmluZGFwaWxsYWlAaW50ZWwuY29tPg0KDQpQUzogQnV0IHBsZWFz
ZSBub3RlLCB5b3UgbmVlZCB0byBhZGQgc2ltaWxhciBjaGVja3MgdG8ga21zX2RpcnR5ZmIgYW5k
IGttc19mYmNvbl9mYnQgdGVzdHMgYXMgd2VsbA0KcHJvYmFibHkgYXMgc2VwYXJhdGUgcGF0Y2hl
cy4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTW9oYW1tZWQgVGhhc2xlZW0gPG1vaGFtbWVkLnRo
YXNsZWVtQGludGVsLmNvbT4NCj4gLS0tDQo+IMKgdGVzdHMvaW50ZWwva21zX2Zyb250YnVmZmVy
X3RyYWNraW5nLmMgfCAyNCArKysrKysrKysrKysrKysrKystLS0tLS0NCj4gwqAxIGZpbGUgY2hh
bmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS90ZXN0cy9pbnRlbC9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYyBiL3Rlc3RzL2ludGVsL2tt
c19mcm9udGJ1ZmZlcl90cmFja2luZy5jDQo+IGluZGV4IDA4MDkzNTJjYi4uZmQzNWNiZDg4IDEw
MDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYw0KPiAr
KysgYi90ZXN0cy9pbnRlbC9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYw0KPiBAQCAtNzgxLDYg
Kzc4MSw3IEBADQo+IMKgICovDQo+IMKgDQo+IMKgI2RlZmluZSBUSU1FIFNMT1dfUVVJQ0soMTAw
MCwgMTAwMDApDQo+ICsjZGVmaW5lIFdBX0ZCQ19ESVNBQkxFRCAiMTYwMjM1ODgzNDAiDQo+IMKg
DQo+IMKgSUdUX1RFU1RfREVTQ1JJUFRJT04oIlRlc3QgdGhlIEtlcm5lbCdzIGZyb250YnVmZmVy
IHRyYWNraW5nIG1lY2hhbmlzbSBhbmQgIg0KPiDCoAkJwqDCoMKgwqAgIml0cyByZWxhdGVkIGZl
YXR1cmVzOiBGQkMsIFBTUiBhbmQgRFJSUyIpOw0KPiBAQCAtMjI0OCw2ICsyMjQ5LDIwIEBAIHN0
YXRpYyB2b2lkIGRvX2ZsdXNoKGNvbnN0IHN0cnVjdCB0ZXN0X21vZGUgKnQpDQo+IMKgDQo+IMKg
I2RlZmluZSBBU1NFUlRfTk9fSURMRV9HUFUJCSgxIDw8IDExKQ0KPiDCoA0KPiArc3RhdGljIHZv
aWQgaXNfZmJjX3N1cHBvcnQoaW50IGRldmlkLCBjb25zdCBzdHJ1Y3QgdGVzdF9tb2RlICp0KQ0K
PiArew0KPiArCWludCB3YTsNCj4gKw0KPiArCWlmICh0LT5mZWF0dXJlICE9IEZFQVRVUkVfRkJD
KQ0KPiArCQlyZXR1cm47DQo+ICsNCj4gKwl3YSA9IGlndF9oYXNfaW50ZWxfd2EoZHJtLmZkLCBX
QV9GQkNfRElTQUJMRUQpOw0KPiArDQo+ICsJaWd0X2Fzc2VydF9mKHdhID49IDAsICJXQSBwYXRo
IG5vdCBmb3VuZCBvbiBHVHNcbiIpOw0KPiArDQo+ICsJaWd0X3NraXBfb25fZih3YSA9PSAxLCAi
V0EgaGFzIGRpc2FibGVkIEZCQ1xuIik7DQo+ICt9DQo+ICsNCj4gwqBzdGF0aWMgaW50IGFkanVz
dF9hc3NlcnRpb25fZmxhZ3MoY29uc3Qgc3RydWN0IHRlc3RfbW9kZSAqdCwgaW50IGZsYWdzKQ0K
PiDCoHsNCj4gwqAJaWYgKCEoZmxhZ3MgJiBET05UX0FTU0VSVF9GRUFUVVJFX1NUQVRVUykpIHsN
Cj4gQEAgLTI2MTAsOCArMjYyNSw3IEBAIHN0YXRpYyB2b2lkIHByZXBhcmVfc3VidGVzdF9kYXRh
KGNvbnN0IHN0cnVjdCB0ZXN0X21vZGUgKnQsDQo+IMKgc3RhdGljIHZvaWQgcHJlcGFyZV9zdWJ0
ZXN0X3NjcmVlbnMoY29uc3Qgc3RydWN0IHRlc3RfbW9kZSAqdCkNCj4gwqB7DQo+IMKgCS8qIEZC
QyBkaXNhYmxlZDogV2FfMTYwMjM1ODgzNDAgKi8NCj4gLQlpZ3Rfc2tpcF9vbl9mKChJU19CQVRU
TEVNQUdFKGRybS5kZXZpZCkgJiYgdC0+ZmVhdHVyZSA9PSBGRUFUVVJFX0ZCQyksDQo+IC0JCcKg
wqDCoMKgwqAgIkZCQyBpc24ndCBzdXBwb3J0ZWQgb24gQk1HXG4iKTsNCj4gKwlpc19mYmNfc3Vw
cG9ydChkcm0uZGV2aWQsIHQpOw0KPiDCoA0KPiDCoAlpZiAodC0+cGlwZXMgPT0gUElQRV9EVUFM
KQ0KPiDCoAkJZW5hYmxlX2JvdGhfc2NyZWVuc19hbmRfd2FpdCh0KTsNCj4gQEAgLTI2NTgsOCAr
MjY3Miw3IEBAIHN0YXRpYyB2b2lkIHByZXBhcmVfc3VidGVzdChjb25zdCBzdHJ1Y3QgdGVzdF9t
b2RlICp0LA0KPiDCoHN0YXRpYyB2b2lkIHJ0ZV9zdWJ0ZXN0KGNvbnN0IHN0cnVjdCB0ZXN0X21v
ZGUgKnQpDQo+IMKgew0KPiDCoAkvKiBGQkMgZGlzYWJsZWQ6IFdhXzE2MDIzNTg4MzQwICovDQo+
IC0JaWd0X3NraXBfb25fZigoSVNfQkFUVExFTUFHRShkcm0uZGV2aWQpICYmIHQtPmZlYXR1cmUg
PT0gRkVBVFVSRV9GQkMpLA0KPiAtCQnCoMKgwqDCoMKgICJGQkMgaXNuJ3Qgc3VwcG9ydGVkIG9u
IEJNR1xuIik7DQo+ICsJaXNfZmJjX3N1cHBvcnQoZHJtLmRldmlkLCB0KTsNCj4gwqANCj4gwqAJ
cHJlcGFyZV9zdWJ0ZXN0X2RhdGEodCwgTlVMTCk7DQo+IMKgDQo+IEBAIC00MTU3LDggKzQxNzAs
NyBAQCBpZ3RfbWFpbl9hcmdzKCIiLCBsb25nX29wdGlvbnMsIGhlbHBfc3RyLCBvcHRfaGFuZGxl
ciwgTlVMTCkNCj4gwqAJCQl0LnRpbGluZyA9IG9wdC50aWxpbmc7DQo+IMKgDQo+IMKgCQkJLyog
RkJDIGRpc2FibGVkOiBXYV8xNjAyMzU4ODM0MCAqLw0KPiAtCQkJaWd0X3NraXBfb25fZigoSVNf
QkFUVExFTUFHRShkcm0uZGV2aWQpICYmIHQuZmVhdHVyZSA9PSBGRUFUVVJFX0ZCQyksDQo+IC0J
CQkJwqDCoMKgwqDCoCAiRkJDIGlzbid0IHN1cHBvcnRlZCBvbiBCTUdcbiIpOw0KPiArCQkJaXNf
ZmJjX3N1cHBvcnQoZHJtLmRldmlkLCAmdCk7DQo+IMKgDQo+IMKgCQkJZm9yX2VhY2hfcGlwZSgm
ZHJtLmRpc3BsYXksIHBpcGUpIHsNCj4gwqAJCQkJaWYgKHBpcGUgPT0gZGVmYXVsdF9waXBlKSB7
DQoNCg==
