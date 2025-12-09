Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C38DD3B996
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 21:17:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3633F10E55B;
	Tue,  9 Dec 2025 21:17:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bw5edu0Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A54B110E62E
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Dec 2025 21:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765315066; x=1796851066;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=mBsHc6GDwI+/pUetVDJrq7sNz23jpx2rzBy9SQ8X1AI=;
 b=bw5edu0ZTBUpAzcQGzEdZppPtXW9W0zZ1FviInAa8veVp3HsRlXNHeE+
 bZComsIQx2vk6WD2U7L70LGLA5AUtNmZOz0qb8jN1ExJD3HzykkBm3Yh/
 1oFgZeuS+ibE0nLwfwY9m7OZxOIqqn0MH+LvmpXMNkENb+GZMZeucy3IU
 WfmuXV+kzUp2/bvb5wuQ6wkJnJnKuQ133xLQdmijLQfVT1sBUutwYS1xX
 PG1oK5rKPZE9I/iD2Fc5UpXkUeQ6cDsDFsJGpAbMabTSe51lC5e9RLb5h
 F+JJkUI1roIBBjRvLAQH34boMwGCnHK36S6dPwxeRPhARqghFbOgX60FN g==;
X-CSE-ConnectionGUID: GhDyXwPuRNGdSrQJTZj0TQ==
X-CSE-MsgGUID: LWe2GInVTGebbXSbZQTQrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67169213"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="67169213"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 13:17:46 -0800
X-CSE-ConnectionGUID: HDLjGyhpQKetQXy4uL7+Yw==
X-CSE-MsgGUID: X17qVlEhSEK2VM5mBT9qkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="196375188"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 13:17:46 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 13:17:45 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 13:17:45 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 13:17:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cvGmjB9JZuk3pNNu4fI286jL63oJhm39IaraWxbtPLwJnUxpGV1S3LW12lBwRiv1tIM3H2cD/oZ154Kmeu4X8nPrzurPVqzazs/4t6FJpCzHAZmnTtToDmEjyGVZX6gMEyJuG7pStyRinbc76PVmATWB7ivh5ZNCmqgdzdG9fUa3BEKby/fenNerfthOvT0lXABgj/g/YFm468d11BwyyBoPf5Ht+fu4nzXCJ7WZi5SxEGFLbScqazxxGnR+Q7JuPj46c09Rx11ahIBHcnkJnFZOY4BN1g5zXIlS9kip1uH8nmJBtlfOB0ezFN6+VMQ3vQU9uOSCXDOd2/vTjeqHlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBsHc6GDwI+/pUetVDJrq7sNz23jpx2rzBy9SQ8X1AI=;
 b=rXON/N6pBiP2iCjbAoYLbhGwwdWPtljQQjHFlZbBk1hv67Q0AuGwDsvnU6qwSJpBJJWj/pyWVq4MnNK/5gv1rT1DUavmYyxbPCzauDLwk6L9zYfwBYB0FGtrTYZoMxjE4Y1QJ3u30hS1GeNnogLPf/eG7TDUb6SsNJMdTv8rtf7Dov7ckCAl83dOF+n+xIhWW6Y3vCMg6o+b2I4sF5WyW01AGBuJ0IiBrcKDqN4NPSbhpJQQdPVN8fBo67Xn2Xn7JjO5Hjx1A2O9qgSH3nPdnVt+QkklgKr8a6USK3eZqc0nMf8vZxP54/yRNO5NJEmQMjBzQ5K39RF4vtsdqAUxGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DM3PPF97A7CBDC1.namprd11.prod.outlook.com (2603:10b6:f:fc00::f3c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Tue, 9 Dec
 2025 21:17:34 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9412.005; Tue, 9 Dec 2025
 21:17:34 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
CC: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v3 07/18] tests/intel/xe_exec_multi_queue: Add multiple
 placement test
Thread-Topic: [PATCH v3 07/18] tests/intel/xe_exec_multi_queue: Add multiple
 placement test
Thread-Index: AQHcaLsQAr0ecJNySEaLBHpvCFBmubUZ0QAA
Date: Tue, 9 Dec 2025 21:17:34 +0000
Message-ID: <f2f8a3e2f31318ca0a8c829272964ff252974dab.camel@intel.com>
References: <20251209032208.1540217-20-niranjana.vishwanathapura@intel.com>
 <20251209032208.1540217-27-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251209032208.1540217-27-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DM3PPF97A7CBDC1:EE_
x-ms-office365-filtering-correlation-id: fb9f8a8e-730c-41e5-0a6c-08de37685f1b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?aWRoSWNDQ0JHV0F5T3FwdW1DZHRxa1BPQ3VyQ09oK0ltVm5ROHdmYkkwRFJT?=
 =?utf-8?B?ZzhvRTZScGhIbVJsL3lyRzJGRWI2RkptNVJ2RmdxT0FJcHVGTUZRSW1yV1Vu?=
 =?utf-8?B?dE5SSkNOZDNaZ0EwUEprOFhMQ3ora1R4MUl0YkVVaXp2U0xZczZXWE1ZZWFr?=
 =?utf-8?B?T1VNR3FZUVlTTVdQZTU2TzhBRFN4UnFDdHNJakxpc1lTZHJZQ09jT1FHejNU?=
 =?utf-8?B?TzNZRFhtMWJUYk9XMlhjZXA0NFYrNTh6UHZIZ0FVbFdnOENQQStDSVUvRkRR?=
 =?utf-8?B?RE9UMmQ1TXBLRndZcFpjQUdESnd1Z3FhaVd0clQ2dVliKzZxR0NGRkcyTnRP?=
 =?utf-8?B?VnFhdG53cmZyR2pvNVZ1Tzc0d0xuVTRZSnFFYW5jRG4zSzQ0TFFIZVdmQSsz?=
 =?utf-8?B?UmxleUV5dWFQNXIrUzI5bkJWb1FkSlUyWUczbHFXcXdCZXBzUENZMFhVa3E3?=
 =?utf-8?B?cjZhUmV2aStJOXdwRzBhblF3em85ZHZHWkluWWFxVVBNdjFHcExwTktEUWEv?=
 =?utf-8?B?akdBTlkvUTNDS1ViaGk2Rjg3MGRDMW1ZUGxoempDSWxxamRLUGVHNUVGdjBX?=
 =?utf-8?B?cG01d2ZkWkhNM0FYUzA3SDdsQzBmSC9iU25jbHFxQlF0QVlpeitPY3QrZk9Q?=
 =?utf-8?B?cUp6dndidlJJNUhMRkRwMkd1aDB0emN0amFkRDlyNW1waGJNWGVCZ3RkMFB6?=
 =?utf-8?B?NThjaGpVc2VFLzZIcUp6NlZ4UmZORE5aaWY4ZVJvcGdkQ2NyRjFRdkYyUVVz?=
 =?utf-8?B?WUlCelo3UFNPRnF0c1VMajhkSTJSUmVxcHZHSXl1WTJwSWR3WjNUbEpjOGtU?=
 =?utf-8?B?ZC9rTEtnNGVlbWJoSkt2MjZpTEJEWmdydzdReFdwRFViN0FHdEVWWURaaXZn?=
 =?utf-8?B?eW1RKzluNU8rbzdJK0hBd1ViZUdYelpqY05LMThQR1JTQ0g1L1I3Q1M3OXdI?=
 =?utf-8?B?bW50dGZsbXRpeGxOSHNiUUNya2YvZDRXZ0d0aHRzc0luV0I5a3FTOXhoQU9J?=
 =?utf-8?B?TzdBa3RYSE9LZ3c0YzE5R1ZFbDNOYlh2UG1ZNWtuZmlPbGtpK0VwSGJlL3BQ?=
 =?utf-8?B?UGVzMDh2d3p6eWJOWXNrb251aG9GUVY5VkJORG1FNlhYS29XYmxERkgxSU1j?=
 =?utf-8?B?VDZIRGlUQmlDOE5pMGIzUHQ0RmZyYjZJbkNrNVR4YjZ5d0M3Tkc0NUFCTVV1?=
 =?utf-8?B?MjVPRkpHaFBNZUNGK3UrRHpPOUFOMVRjakI5c0JkMEZoRWRMblNzSWRDc3po?=
 =?utf-8?B?SW4xK1lnZzVIRG9ma1FadWtWZ0JFeldhdWQrZWwvQ0xQbmtVUG12czc1eFMy?=
 =?utf-8?B?ZXVSNGtvNUpKMStVL09DVjRFRjBqSmRBRWJCZld4TlNkdXVHK3NoOWc2dGxY?=
 =?utf-8?B?TjZGWTVhbWw1T3NyUU9NanNZV2JTc0xraDJyTDE3NmpjbGxFQm5KZFZtSTJt?=
 =?utf-8?B?cm8vM0pKKzY3VU9QOC9QazJVV1l6YmYvcnNFOXNyeEZONUxiLzNybXliOFZo?=
 =?utf-8?B?VzhZYTluNHZIM0ZPdlVBK1ZUUXpOaGhCaCtXc3JIMFpyRkg1MFE3emlVcjUx?=
 =?utf-8?B?S3YydTRjYnV6QWNUYUsyZWN4ZDl5NzY4MW1xcnY2MTREaS8rSy9USUl0d3VC?=
 =?utf-8?B?TmhyZHgrM3l4MG5ud3Iwc2hkd0VBNzNRaDhHS3FNc3B2aC8wYnRJQmNyMjZT?=
 =?utf-8?B?QjRJbThFUEl5Tlh3Q2xtVlYzSUd0TkpCRVluOWlHM3NTRzJoWnlLM3d1NFhI?=
 =?utf-8?B?SnFtaGxUbFZNa1phZk1zc3ZKeWp0b3l5b2RRMkNWc3o2aEZwVG1GS2dkOXJB?=
 =?utf-8?B?bTBxT3l6VTBFQWJCaTUrVTBvbU9DUlc2VHNKRFNlbldqV2JUUzI0ZzRZdVNx?=
 =?utf-8?B?RGpWcG45S3dOdTJjVG9PTC8rZElxdktxYk5lZ3dzM2pTWC9NYStDTVM4b3hB?=
 =?utf-8?B?QVpXSHdYRmJVeitoOFZuKzllUUV5dGRHdUJ4ajRiT0RPNHRQbi9sRy8zUkR1?=
 =?utf-8?B?Szd4bzB6K2Frc3FkOFBtK2VqaGV3NWJlalNUai9WakJneGxVMzVvVUgxR1gr?=
 =?utf-8?Q?smQ1it?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RDBoQVdoc0pmQ1E0RnlteW9qN2JFZWFSVVZOMC9TeE5sT2dUUVpDRWxVUjNB?=
 =?utf-8?B?UXRGazRiYmxTNW0rbUFuRTdyakhCdlZrT0VpM1lCcXZTclJtcm1ZL1B3SmtL?=
 =?utf-8?B?V2RqK280VVY0dkNUM0NmTytQdEdhQWZLUk56UEIxdkVVZTVFTzVzcHB3MFFz?=
 =?utf-8?B?ZUdsK1k0OTAyOEIzYXZKUGdtank0cUNvcHNGbzg4SWhxS3NMWFQ2eHA0OXdZ?=
 =?utf-8?B?Nkw0NXVJUW94MDlLNFFKRm90emNtTmJMT05PbS82a3pTeEM1b1ErNEYrWmx0?=
 =?utf-8?B?bkF1YncxalNVUzhLclBzdHBvNGJMVWYvYjRKN05PUHVTdHFxYlR2Z3BqakZy?=
 =?utf-8?B?dDJRWDZwMnhlNTRRUFVLNDFQYW9PTDFlTVRSbVpnZkhTblBQeXNFWGRGWk56?=
 =?utf-8?B?bmV5TEZoa1hESkI0Z0UwS3FwNWVTVEdOaFp2MWtoU1VaU01qNzhPSTRrQUdw?=
 =?utf-8?B?RjZuN0lhUVpIZ1JWMXYrNFJuc29MdGtLN3ZlOFlHSjFIQkN3SHl0ais0d3No?=
 =?utf-8?B?a09DQXB0YXlKOXF2cEtENjNzSmdpYkhhNjZzS0hhVTNIYUhzVm1GTVdQZEMy?=
 =?utf-8?B?Y0JPUG1OWnVCUDdSY1Qva3poMUZvbkljaXMxVmh4bitrYVB0UUpVZklWT2R3?=
 =?utf-8?B?VFh3T01TbDh3UDZZdzFzaU5pNnBoSTZXdUpkc09VUUtPWExVSFg4NXNhOUpZ?=
 =?utf-8?B?anVJL0kxU1dFbW42V2VVUmVDYmlhQ2dMUCtWSUZnZTlFc0U5dkd2eDdTVU05?=
 =?utf-8?B?c01XNHBod1B0Z1pReWR1R2lVN3dLVjlQdWNtZlQzbktCRE5MbTJTSlNwTm1y?=
 =?utf-8?B?SWRnR1Rxc0I5QVRzbFlYT2ViUXJjTkFCUUEwTERQUXRNOGplUHRoWlpwZWVV?=
 =?utf-8?B?eUk3QWZiajhZZklNb0p1bnlnK2R0QmtDRlAxRTNMZEtqVk5HS0I5RmtFbG5m?=
 =?utf-8?B?ajF2b2FzY05Lbzg0QllscExrVmt1d0hSMHluZ1A1c3NJemZjQmpLMDduWHQ4?=
 =?utf-8?B?ckZmKy8rYjhuRFdidXhVZmJlTDdBTXFOeTVUbnN4N2VUV0ZEcXNuNW82bmYv?=
 =?utf-8?B?dUY4QzA1SmJZaDh2YjZ3M0JTaEJpZGIzVkhwdklkcUtsZXY4ekpaRm1sbzQ2?=
 =?utf-8?B?U0NpcnN0YjJjVkNJRmgwbmFoVERoQ1F1OTlTb1FPUHFmUnhWNkR4dThNUnVi?=
 =?utf-8?B?RmgyNFNmNVZMdnZJNWVOcldDelpLYm1kUXJ0MzFYQTNWNExCTG11M200N2Yz?=
 =?utf-8?B?cmpHMDdtSlY3UkJqSmM2azNsUnE2ckZtQWIwWWdGZDJTaFVhMTZTTC9XS21v?=
 =?utf-8?B?Z0V1Znl1eW9lNXJ4MW9jNDdpWXFnbWpNQXNWbDJmYzlYUmRLRXNiRGM5MUd2?=
 =?utf-8?B?aHF1NkdTSVlRWmw4eVpCdU45UmFad3Z4Qk9uUk12K2s1UDlhUTNTUjY5ejFa?=
 =?utf-8?B?RFZmQ2FZVDViWWdDMDBJR0FPbEJHQWNoQlpDbytuSFBZYnVybnZqcVhQVita?=
 =?utf-8?B?YzdxU2RVSVJ1RmVnamhwdjl3enlndnphMUZ1NEVuSElxempXRS83VjRMQlZH?=
 =?utf-8?B?Y2pHcGx1dzREdXZSVThQZVJBdXFDaGdXTXU1eFpxMlZkRHNVL1Y4Z0hsRCtH?=
 =?utf-8?B?elcyQUthTFp1b0cyQjQzNmhyd1ZQVmZDb0xyU1k4OUYzMWVHM2g5UjRZYTJF?=
 =?utf-8?B?a3RvMnoxWjBqRnNhT2c3eUlyN0oxYXA5blVBUHVFam8rWWk5R2lJYjdweGNu?=
 =?utf-8?B?SVMxa1RuRkVDMlUvN25tOTlMY3pMU2dNZVhaWjRHWk5abldjS0JCbFBocXRC?=
 =?utf-8?B?OU9tTFkxbnBzTm5DWWduejAxUlorZmFIVFdKWU0xUk1tUlJsM2E1dU5ad0la?=
 =?utf-8?B?NEZQQ3p2dzFRV2t5TDZqbjFYMUQ5QWVPSmc5YXFlVU1UeE0veGwwcXRGQlFj?=
 =?utf-8?B?dFlsOGZwYkdaZ2tpanBxZEdMUThubW5TTzlCNHBra2NmY3cyOUtkbzQxSnJo?=
 =?utf-8?B?OVVWWUN0VVBrMHlUdjgremRJK1hvNDlvL2lyMjlzN3J5ZG1FTHJyOFIvZ3RP?=
 =?utf-8?B?dEcxUGRxclhDek5WZVYxcG43U2hLTzRyZ0E2eHJ2aW4xUUk0MHVQTWQvamRR?=
 =?utf-8?B?NTN5SGtkVmZjUUFDb21TeUFMSE5RcUo4YUZPNWliczArNWZCWXRpTzdwb2g3?=
 =?utf-8?B?MWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7F84A9531B81074AAE8FA1B483F07917@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb9f8a8e-730c-41e5-0a6c-08de37685f1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2025 21:17:34.4388 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nrkiFAvfb+j/djYKvyFMAktzy090fSqD/EJaLSByDZ3ICjBxBcDsyPY/ybsSZ8eAM9rgRwB7ipvm/V2/ux7nltNaK1PN8HolP5u2Z5tOfm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF97A7CBDC1
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

T24gTW9uLCAyMDI1LTEyLTA4IGF0IDE5OjIyIC0wODAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOgo+IFZhbGlkYXRlIHVzaW5nIHZpcnR1YWwgZXhlYyBxdWV1ZXMgd2l0aCBtdWx0
aXBsZSBwbGFjZW1lbnRzLgo+IAo+IHYyOiBSdW4gdGVzdCBldmVuIHdpdGggc2luZ2xlIGVuZ2lu
ZSBpbnN0YW5jZQo+IAo+IFNpZ25lZC1vZmYtYnk6IE5pcmFuamFuYSBWaXNod2FuYXRoYXB1cmEK
PiA8bmlyYW5qYW5hLnZpc2h3YW5hdGhhcHVyYUBpbnRlbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFBy
aXlhbmthIERhbmRhbXVkaSA8cHJpeWFua2EuZGFuZGFtdWRpQGludGVsLmNvbT4KClJldmlld2Vk
LWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPgoKPiAtLS0KPiDC
oHRlc3RzL2ludGVsL3hlX2V4ZWNfbXVsdGlfcXVldWUuYyB8IDI4ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysKPiDCoDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspCj4gCj4gZGlm
ZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX2V4ZWNfbXVsdGlfcXVldWUuYwo+IGIvdGVzdHMvaW50
ZWwveGVfZXhlY19tdWx0aV9xdWV1ZS5jCj4gaW5kZXggNmMxYjY2MTZmLi40YWNmNWE0N2YgMTAw
NjQ0Cj4gLS0tIGEvdGVzdHMvaW50ZWwveGVfZXhlY19tdWx0aV9xdWV1ZS5jCj4gKysrIGIvdGVz
dHMvaW50ZWwveGVfZXhlY19tdWx0aV9xdWV1ZS5jCj4gQEAgLTM5Nyw2ICszOTcsMjkgQEAgdGVz
dF9leGVjKGludCBmZCwgc3RydWN0Cj4gZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqZWNp
LCBpbnQgbnVtX3BsYWNlbWVudCwKPiDCoMKgwqDCoMKgwqDCoMKgdGVzdF9sZWdhY3lfbW9kZShm
ZCwgZWNpLCBudW1fcGxhY2VtZW50LCBuX2V4ZWNfcXVldWVzLAo+IG5fZXhlY3MsIGZsYWdzKTsK
PiDCoH0KPiDCoAo+ICsvKioKPiArICogU1VCVEVTVDogdmlydHVhbAo+ICsgKiBEZXNjcmlwdGlv
bjogVmFsaWRhdGUgdmlydHVhbCBxdWV1ZXMgd2l0aCBtdWx0aXBsZSBwbGFjZW1lbnRzCj4gKyAq
IFRlc3QgY2F0ZWdvcnk6IGZ1bmN0aW9uYWxpdHkgdGVzdAo+ICsgKi8KPiArc3RhdGljIHZvaWQK
PiArdGVzdF9leGVjX3ZpcnR1YWwoaW50IGZkLCBpbnQgZ3QsIGludCBjbGFzcykKPiArewo+ICvC
oMKgwqDCoMKgwqDCoHN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlIGVjaVtNQVhf
SU5TVEFOQ0VdOwo+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2lu
c3RhbmNlICpod2U7Cj4gK8KgwqDCoMKgwqDCoMKgaW50IG4gPSAwOwo+ICsKPiArwqDCoMKgwqDC
oMKgwqB4ZV9mb3JfZWFjaF9lbmdpbmUoZmQsIGh3ZSkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBpZiAoaHdlLT5lbmdpbmVfY2xhc3MgIT0gY2xhc3MgfHwgaHdlLT5ndF9pZCAh
PSBndCkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNv
bnRpbnVlOwo+ICsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZWNpW24rK10gPSAq
aHdlOwo+ICvCoMKgwqDCoMKgwqDCoH0KPiArwqDCoMKgwqDCoMKgwqBpZ3RfYXNzZXJ0KG4pOwo+
ICsKPiArwqDCoMKgwqDCoMKgwqB0ZXN0X2V4ZWMoZmQsIGVjaSwgbiwgbiwgbiwgMCk7Cj4gK30K
PiArCj4gwqBpZ3RfbWFpbgo+IMKgewo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZHJtX3hlX2Vu
Z2luZV9jbGFzc19pbnN0YW5jZSAqaHdlOwo+IEBAIC00MjIsNiArNDQ1LDExIEBAIGlndF9tYWlu
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfZm9y
X2VhY2hfbXVsdGlfcXVldWVfZW5naW5lX2NsYXNzKGNsYXNzKQo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB0ZXN0X3Nhbml0
eShmZCwgZ3QsIGNsYXNzKTsKPiDCoAo+ICvCoMKgwqDCoMKgwqDCoGlndF9zdWJ0ZXN0X2YoInZp
cnR1YWwiKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9mb3JfZWFjaF9ndChm
ZCwgZ3QpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4
ZV9mb3JfZWFjaF9tdWx0aV9xdWV1ZV9lbmdpbmVfY2xhc3MoY2xhc3MpCj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdGVzdF9l
eGVjX3ZpcnR1YWwoZmQsIGd0LCBjbGFzcyk7Cj4gKwo+IMKgwqDCoMKgwqDCoMKgwqBmb3IgKGNv
bnN0IHN0cnVjdCBzZWN0aW9uICpzID0gc2VjdGlvbnM7IHMtPm5hbWU7IHMrKykgewo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X3N1YnRlc3RfZigib25lLXF1ZXVlLSVzIiwg
cy0+bmFtZSkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqB4ZV9mb3JfZWFjaF9tdWx0aV9xdWV1ZV9lbmdpbmUoZmQsIGh3ZSkKCg==
