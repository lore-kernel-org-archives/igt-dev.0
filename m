Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D449DCF649D
	for <igt-dev@archiver.kernel.org>; Mon, 30 Sep 2024 04:51:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87AAC10E0DB;
	Mon, 30 Sep 2024 04:51:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BpEXos5d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C1410E0DB
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Sep 2024 04:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727671895; x=1759207895;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=kXUvYjS81NkAsi74yO0fD8qQVvLRw1NLntTW7kmnyCo=;
 b=BpEXos5dD5El4l7LmM79GelR9fnAqJWBcmxiyN2JXogV/OMIfpaRxMaS
 pGgdTXCIvNra7NkWCl0yqZ7HDTo43FFEXXRx+xwoxt25NF67+2Y9YMZLh
 Io30oJxqVUBgDwqvWSfJ0RfRF3WYsb1wMX5yZR9Ip5VfuhExsAIO98LwH
 1w0zcvdV8MtuvbzbZKrjXRTHaCpWmnvR2mXvAcEDRJO+CpzEVB7McaSFH
 pgsMcwiKfwLEicDlJG1T5R4VfNn26y9arWZLNQR1yMYLCgTLks0bKMsJC
 HEUOYmCpPflaQosnSceuJCQ5O/QjoVHWR+IrQahWL0juthgsZYbsQbdh5 w==;
X-CSE-ConnectionGUID: fV51zwPFTdSQL/GRMLy5zA==
X-CSE-MsgGUID: oP7dR/AvRkmNXRTRUJxjDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="38099295"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="38099295"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2024 21:51:33 -0700
X-CSE-ConnectionGUID: UffulrZkQ5GoOWf+HJwIWw==
X-CSE-MsgGUID: kQHuUdN0Sr+uzMKv6RbWuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="103962249"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2024 21:51:30 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 29 Sep 2024 21:51:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 29 Sep 2024 21:51:27 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 29 Sep 2024 21:51:27 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 29 Sep 2024 21:51:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U5c4V3jdubCaMNtzjoCGpLYeA2sZYspqyahFHT7IyBqsZ5vgMId7dwgu34VCUvLM3rN5wgAA0FLAeKBLophz88C7dcNNaAFhVg4DIWpLoB3JpI/xeKyLCuYSIVZthGBKOLLiN4LvX65xArU6iWAEfsR6AvBy+Qm6dbFF1+pxfwEDmybdaOWXjCKiq37pGKUsPPAnp8vO3UYbiZRJIrNKouZilwGT938SgzoDWFl8lsEceJwb0GCZ3fGEav4q61sL6TkOXGJ0D4q19CdBPZunTDTWMwDDU7Pbze9/E2UloEIUftAjwZpnVNHKc0Ggqd/GSvVze5OdQZ6io6FUnmp/Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kXUvYjS81NkAsi74yO0fD8qQVvLRw1NLntTW7kmnyCo=;
 b=MvazCw7F4dAG5A/b7VTxbeZjJ9FuSDqjKIHlIqlZGOUHsKIAP+3eOm6MIr7Lh0iyVHUrXzks8LVqLFGOwOwQNdaidJ2TzTehphZIuOFnf3LnG0+i+DhlgN47aUcN//aAvxmA1zId8IYP8gXY/nj6rsJ29vsVJvYCbQBTxSDyMz2dd867TYptlPMCmj1e7r9YDv5DpBBSswbIit2WA98DeP02tp67XPotlcMGALDW6h/QeqqKeL9euW92fLnQorB2iorjgKLA+fSzt4r7yUIH64ipz2wMjjp5kla3A0YhJZ224+v/bSJQ8/Z8FkySRBEAzFXUhnz9r4iKd79/jt8FfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by BN9PR11MB5322.namprd11.prod.outlook.com (2603:10b6:408:137::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 04:51:25 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%5]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 04:51:25 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>, "Ch, Sai Gowtham"
 <sai.gowtham.ch@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Das, Nirmoy" <nirmoy.das@intel.com>, "Ch,
 Sai Gowtham" <sai.gowtham.ch@intel.com>
Subject: RE: [PATCH] tests/intel/xe_tlb: Add test to check TLB invalidation
Thread-Topic: [PATCH] tests/intel/xe_tlb: Add test to check TLB invalidation
Thread-Index: AQHbEJWgebA1ZIGeJUSY1YbVqBRTOrJvpzDQgAAf2tA=
Date: Mon, 30 Sep 2024 04:51:25 +0000
Message-ID: <CH3PR11MB8434A98E8717DEBF332EE9328D762@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20240927043544.1782340-1-sai.gowtham.ch@intel.com>
 <CH3PR11MB8434CF8AEE478D5ABA2C47B08D762@CH3PR11MB8434.namprd11.prod.outlook.com>
In-Reply-To: <CH3PR11MB8434CF8AEE478D5ABA2C47B08D762@CH3PR11MB8434.namprd11.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|BN9PR11MB5322:EE_
x-ms-office365-filtering-correlation-id: 51813c8f-e256-4d46-dc0d-08dce10b89ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?U3V3Rjh5MWpkOHQyK0VMM1BVYXBSSEMvbmRtWFkyL1lLeEhpU0ZlVUZhYTVy?=
 =?utf-8?B?emFzR3E1QkVJZnpoaHB3VlNoc2sxazVOa0xuajBWb3pORFhhYmlKOHVYWFZJ?=
 =?utf-8?B?aXFyak4xaUtvcmRTTHRsOVRXMktSeUZQZnBzMFVXVnFMODhPaFppa20xR24x?=
 =?utf-8?B?dENaQlpqZExhNXEvWFN2cFEzMTdtK0p3QUNTV0ZNSkxVakVMRWNScnYrRU5Y?=
 =?utf-8?B?QlZrY0VEek1zQmFIaFUweE9VQmZQb2poU2lDUzByR0pVb0xHRkxUK0hEbU52?=
 =?utf-8?B?SWkrZDBkZVFHSU93YndyZXpGeldmbE5oSDdhQXQvWEd0U0E5cnJYREYzTlA1?=
 =?utf-8?B?SGtSYUN3Z0JmQnFLV2dCYm0vbEZhR2s2SG9HSmN3Nk10RDFOSm5VandkWkpy?=
 =?utf-8?B?SDdUa1loSXJBMFE4ZkFqMnkwdktQOC9tbnluV0N4aVFLY1NBTzNFR0REaDFO?=
 =?utf-8?B?S2pCV1pMK1dJdWFhdDNEd3ZaOW5La3ZGMXAwUUlsRzBXSmwxY0trVGh2anJT?=
 =?utf-8?B?cEtSS0ZZMHVBUkZDSWpKMmVVUzlTNUpnME5KTEQzelBLU3lHbmwvRDdRclpR?=
 =?utf-8?B?dUZLaFMwMkMzUTNEbjh5SFFLc3RrWVFZbXZ2UU42QktudU91ekc5ank1eFBu?=
 =?utf-8?B?bFozL2p1RTgvZnlSOU96aEcyN21wOHppRHY2WEp1MHZIMnJqTkdmRmIrM3Fj?=
 =?utf-8?B?NXBQRGkwTHhDQStVSU5GcEVIY2NOWUM0Wk45dmMxd2h2RlVGWlgrSGFKbFBV?=
 =?utf-8?B?OTN0NXFjdUpGVzVpb3hjYWpWOFRsMUJHMmpESWw0bmVObVJ2Y2VKaWt1WGF1?=
 =?utf-8?B?bis1U1dkWTRnVWJOcGFPbUQzcGpPd1c4Z205MmNYb056Y3MxYnJ3Z1BuN1Nt?=
 =?utf-8?B?enZ2YVJmYVNWaHFDdk1QZE9aMmFMVDlsZ051SDRVMndsdWRndkx4cGFNa1JP?=
 =?utf-8?B?dlA2bEUzUVhFa3FWaWJUS0NQbTNjc09FczBjVzZkK3J3T1ZxcTNTWmtWU1px?=
 =?utf-8?B?RGx1Y016amNiZW01UXZlTFZ5ekVSN3UrOGxFc3F4ald5SENvUkMxenZmdUQz?=
 =?utf-8?B?UnRlczE2bGdyZG53NDJGUDZlMVhsbFZjVENUVWF1cWFueDlKSEpnTEtYeDVT?=
 =?utf-8?B?UEE3R2dKSXN2QkRWZ0J1QnpsVFg4eTB1dDJrQm45ekVGUTFlaVJSKzNjL2dk?=
 =?utf-8?B?SVA0SnRRYytnSnczTWkzbzZIa0JPbXZnSVk2NU1ZRmM5ZERmRnV4b1MvWVhp?=
 =?utf-8?B?MzZGSzZTYW9wQzZzcG82WnJoQWlnK1F3OEVTQmRsVHlKYjA0dURnbld3M2xN?=
 =?utf-8?B?eDhyVW9lbHFVbUNuUFQzV2owbTNlYWUwaFg0T2tpMXJsU2ZEYm5DUTZWM2cv?=
 =?utf-8?B?ZFBnc0JHNEZicFVNOWlpa3JmcyszZmJqZ0FKRTBoWDBKdWd2aldUT1RCSFQ5?=
 =?utf-8?B?anZrcGlTWVo3TFBORUJabk9lUnBZZnJHWUhoK1dTdXNvMEo5djFuUitDRWJN?=
 =?utf-8?B?Y3d6U3IxSUh5ejlkcHRqMnA4eFdScmY0eXlQVGtJY0FaQ3UyTkd1R0hzd3VH?=
 =?utf-8?B?cFFSUkJmaFVXVE11MGJXZEtvbXpFMGovcktHS3pGNGE4UEo3aGlLKy8wcFFI?=
 =?utf-8?B?SjJJNDUzT0kzN0kyQUpKREZ0YUdIU0g0NitVWU9kMWhYYVg5T2o2anRmT3Vu?=
 =?utf-8?B?MGZMbjFCSXFudE9adU5oOUtGNlVvSHJ1N0F2eCszdDAyb1BnVUJ4RWYwdVRT?=
 =?utf-8?B?RWRuUDZNbW5yYzk5Z01yclBJb1IxZUVYNmltSFRMaDg4bnBlNzNvRThGcllD?=
 =?utf-8?B?UTRxaVVzeTRqSk41UjZKcFVrTy9xcjQ3TVRoNEEyYy9pVUVSMWRNVEwyOFJ5?=
 =?utf-8?B?Uyt1c29ZcE0wa21QeStpZFJjbkZ4Z3BHNEs5VXhCa1R5K2c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N1dReEJ4bm9XUjZ5b3YrbE1xN1MwRm9IMmZDMEJ2U2tEVW10aGNGK1FhUCtw?=
 =?utf-8?B?azkxWXUzMHJQQ1paMnlCeXRmTXFoWUZ6Y0tVOUF4Q0JRUkVjdlBTdGFXclFV?=
 =?utf-8?B?Z1Q3ODBaZyt3WFp6cTlyNENZU3RLR0hNbjZKWWhaVWRaQks5cVJuZ3JTeEVJ?=
 =?utf-8?B?ZGk2TVNaUFV2M2pGSFpEQkM3M1RIZW5oM04rQkZIUzhQdDFQTGQ0NXVEcitW?=
 =?utf-8?B?MXFBVzRqSTE4SGloZDNPNzBWNEhldmRUMmhzSEUvekZKSzQ1azhrTWRKankx?=
 =?utf-8?B?UTRuRE93RnkrS21weEVzMEVueGU0QjIyZlNIOWNaMGZONGZsa2hIUVRiaHVM?=
 =?utf-8?B?R2VveGdJYmNlV0Q0bTkrYytOYnpDNmtOSUQzOVhncG4wbkJnUE5yZ2ZNTFor?=
 =?utf-8?B?Z1RTak82ZnBxNHcxL2V6R0tTaW91RkRKa2Raamdtc3NydEM2Q3ZBcTNkUUww?=
 =?utf-8?B?V1RsbzJ4cE54MFhiZldUR2d4TmhFd1ZnME4zaUhSRHhvUzVwNWdzZ1A3VjJJ?=
 =?utf-8?B?TW11SWNDeG9kZUxzVVBodExGQU1jRGErR3NXWkRQZG1rY1NNMXFiSjRiRUJE?=
 =?utf-8?B?STZYQk55TUlVRGNQU29mNmwzYjVObDJybWEzQXR1MFc1cFhTRTgzVkdvbUdL?=
 =?utf-8?B?NkpPN0RLYkdGRDFWQ1lPcElYTGpmaHBHZFZRQ1BXQjBDYXRURXNhdTltaDNQ?=
 =?utf-8?B?Njl1ZkoyR3NXdkVYdFlqWkM0MUJkWks0L3pkTEY4L2ZoWUZaVjRkVisyVjVT?=
 =?utf-8?B?bXVGZkFaR2N1a1dCdngyT3VuSjhVOEJ3bDZ5WXI3QzNlS0ZiTE1iZzlIaUp6?=
 =?utf-8?B?bzhqQURsN1JrT1VkQlpjdFdHT1hJcDdyc0k3akFIbHBEUHhOZjd1TFZnYTFK?=
 =?utf-8?B?T1FRendwOWtER2JDYmJBanU0ZnVLbnRaaFU1S0tJWkcxbWhxWGpNTDhiT05W?=
 =?utf-8?B?dURnU0pwYWE2OVV0bGxZKzdEUGh0UStjL0dmZkp2bnFUY1lGYkwxcGJWZW5V?=
 =?utf-8?B?b1NXNGcwV2lXcDZOREZxeGlMM0Jqb3JwSGQwSFl5T3ovVWJzQUZQSC9iZStY?=
 =?utf-8?B?TG03bEZKWHErR2hCNy9qcURZUVphbHF0VHp2NVRmSnJieHViajdmcVdOMVlv?=
 =?utf-8?B?eitpTzBYY3cvWjl0VWRGdC9BU200WkRsdU95eG5hRkhaODRtcDUrSFdab3hZ?=
 =?utf-8?B?WTlVZDd1MFdBVXhueGZ3OXN0V25JVmVpSHc5eGdaQ2ZrMit5Z1ZkR1l3cTY1?=
 =?utf-8?B?VUZEemo4ZWNhVWMvQ0VJVDRvOGdNendxNjBUUWJGYXpSWVZqTkRJb2o1dTJG?=
 =?utf-8?B?ZEkyNEQ4UFJISThiazM5YjdhK3cwWkhCd1Ztb3NnNmNKUERCbHVMYzNPMXVj?=
 =?utf-8?B?LzU5TnZmTFN3KzVmVnpIeFFUMXpBYjdzQnMvVmo1dStSNGFZcWhuUjFRQm9w?=
 =?utf-8?B?bnEyNHJlNGNEdmRZWjV3MHZhY2tQZkJBLy9HWnRjOFZIOWJOMDMvUktNNDZs?=
 =?utf-8?B?Ym5YaUU0OUVxMWJ5SEdCdEZsNzBBMDBGaytONGIyLzd6NldDRHVLTjRqOEVr?=
 =?utf-8?B?K1RQOWRsams5Wks2ZFBPTlhSU2dZdkxrUnlkOEFKallqV2dwMHFqOGphSkE1?=
 =?utf-8?B?MHFMNVo5QkZKb2g4ejRjZkJSVGM0Y0pGK1RXRUlKNEY3dGsrRm4xeEhhYlBt?=
 =?utf-8?B?RkxCbDhnNU41QXdGWS8vUEx4cmtjMXphQkVDcE1xQnlrV3pXRUVPQjhCdU9U?=
 =?utf-8?B?cnhiWGZLS2RCelN3WEIyS3Ird0xGc0RMTUxKZEY3cll2Nm9oY2VaOVRSNlkw?=
 =?utf-8?B?aEEyK0cyUTNSN29kT2xrR3hhbXdRaVVZek5vUmh0dSs5bE5VT1lNelBZN3JB?=
 =?utf-8?B?bXpyNnFoaWNXMXV0cmNlUEZudnBKTG5QK1liTmlNNlI5YlBLZWJZUER5R0Zr?=
 =?utf-8?B?aC9mRGx5UnYyTjBUbllaTDlFRXhieEd2aEFzSWU2WEdYSlpjYWhEZHVsRUFy?=
 =?utf-8?B?a3o3VVhHMk1DWGg1MTJxNS9NM3JUR0lTT04rZ2lTWVJ6SlllRkNWUVIrVGNN?=
 =?utf-8?B?ZHQ0QVZpaUx3ZkR4UU5TbC9wTFRYdlVkQS9qUjEyMzVxZUZjWUFlNDdnV0xU?=
 =?utf-8?B?NGE0ekU2QzJQK2hyK2pvaC9XWEhJOXdzYnRtM0FyOTZoWDBQbEg1M1IzMmhk?=
 =?utf-8?B?UlZPbHFoRW5GaDlxNW1aNHNnKzZHODJuSlJBc3VnaWhGRytaTUhzT25lTk9E?=
 =?utf-8?B?d3B3TStSWlZZallLRDBwS3ppS0VnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51813c8f-e256-4d46-dc0d-08dce10b89ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2024 04:51:25.0297 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yNimYA8HuQ+6wfq8RTyfuChI42FEtH6+rCcCdr3SqFZ1rQwJakBJYHmsaKVTFvwin8OZb76OMVmfEm9jcHUGE7W5AAGCqq1JuH5bt/6+15U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5322
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0LWRl
di1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+IERhbmRhbXVk
aSwgUHJpeWFua2ENCj4gU2VudDogTW9uZGF5LCBTZXB0ZW1iZXIgMzAsIDIwMjQgODoyNiBBTQ0K
PiBUbzogQ2gsIFNhaSBHb3d0aGFtIDxzYWkuZ293dGhhbS5jaEBpbnRlbC5jb20+OyBpZ3QtDQo+
IGRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IERhcywgTmlybW95IDxuaXJtb3kuZGFzQGludGVs
LmNvbT47IENoLCBTYWkNCj4gR293dGhhbSA8c2FpLmdvd3RoYW0uY2hAaW50ZWwuY29tPg0KPiBT
dWJqZWN0OiBSRTogW1BBVENIXSB0ZXN0cy9pbnRlbC94ZV90bGI6IEFkZCB0ZXN0IHRvIGNoZWNr
IFRMQiBpbnZhbGlkYXRpb24NCj4gDQo+IExHVE0NCj4gUmV2aWV3ZWQtYnk6IFByaXlhbmthIERh
bmRhbXVkaSA8UHJpeWFua2EuZGFuZGFtdWRpQGludGVsLmNvbT4NCj4gDQo+ID4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBpZ3QtZGV2IDxpZ3QtZGV2LWJvdW5jZXNAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gPiBzYWkuZ293dGhhbS5jaEBpbnRl
bC5jb20NCj4gPiBTZW50OiBGcmlkYXksIFNlcHRlbWJlciAyNywgMjAyNCAxMDowNiBBTQ0KPiA+
IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgRGFzLCBOaXJtb3kgPG5pcm1veS5k
YXNAaW50ZWwuY29tPjsNCj4gPiBDaCwgU2FpIEdvd3RoYW0gPHNhaS5nb3d0aGFtLmNoQGludGVs
LmNvbT4NCj4gPiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3RzL2ludGVsL3hlX3RsYjogQWRkIHRlc3Qg
dG8gY2hlY2sgVExCDQo+ID4gaW52YWxpZGF0aW9uDQo+ID4NCj4gPiBGcm9tOiBTYWkgR293dGhh
bSBDaCA8c2FpLmdvd3RoYW0uY2hAaW50ZWwuY29tPg0KPiA+DQo+ID4gVGVzdCB2YWxpZGF0ZXMg
VExCIGludmFsaWRhdGlvbiBieSBiaW5kaW5nIGRpZmZlcmVudCBidWZmZXIgb2JqZWN0cw0KPiA+
IHdpdGggdGhlIHNhbWUgdm1hIGFuZCBzdWJtaXR0aW5nIHdvcmtsb2FkIHNpbXVsdGFuZW91c2x5
LCBJZGVhbGx5DQo+ID4gZXhwZWN0aW5nIGdwdSB0byBoYW5kbGUgcGFnZXMgYnkgaW52YWxpZGF0
aW5nIGFuZCBhdm9kaW5nIHBhZ2UgZmF1bHRzLg0KPiA+DQo+ID4gQ2M6IE5pcm1veSBEYXMgPG5p
cm1veS5kYXNAaW50ZWwuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNhaSBHb3d0aGFtIENoIDxz
YWkuZ293dGhhbS5jaEBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIHRlc3RzL2ludGVsL3hlX3Rs
Yi5jIHwgMTU0DQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysN
Cj4gPiAgdGVzdHMvbWVzb24uYnVpbGQgICAgfCAgIDEgKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQs
IDE1NSBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy9pbnRlbC94
ZV90bGIuYw0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX3RsYi5jIGIvdGVz
dHMvaW50ZWwveGVfdGxiLmMgbmV3IGZpbGUgbW9kZQ0KPiA+IDEwMDY0NCBpbmRleCAwMDAwMDAw
MDAuLmVmNDRhMTA2OQ0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi90ZXN0cy9pbnRlbC94
ZV90bGIuYw0KPiA+IEBAIC0wLDAgKzEsMTU0IEBADQo+ID4gKy8qIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBNSVQgKi8NCj4gPiArLyoNCj4gPiArKiBDb3B5cmlnaHQgwqkgMjAyNCBJbnRlbCBD
b3Jwb3JhdGlvbg0KPiA+ICsqDQo+ID4gKyogQXV0aG9yczoNCj4gPiArKiAgICBTYWkgR293dGhh
bSBDaCA8c2FpLmdvd3RoYW0uY2hAaW50ZWwuY29tPg0KPiA+ICsqLw0KPiA+ICsjaW5jbHVkZSAi
aWd0LmgiDQo+ID4gKyNpbmNsdWRlICJsaWIvaWd0X3N5bmNvYmouaCINCj4gPiArI2luY2x1ZGUg
InhlL3hlX2lvY3RsLmgiDQo+ID4gKyNpbmNsdWRlICJ4ZS94ZV9xdWVyeS5oIg0KPiA+ICsjaW5j
bHVkZSAieGVfZHJtLmgiDQo+ID4gKyNpbmNsdWRlICJpZ3RfZGVidWdmcy5oIg0KPiA+ICsNCj4g
PiArLyoqDQo+ID4gKyAqIFRFU1Q6IENoZWNrIFRyYW5zbGF0aW9uIExvb2thc2lkZSBCdWZmZXIg
SW52YWxpZGF0aW9uLg0KPiA+ICsgKiBDYXRlZ29yeTogU29mdHdhcmUgYnVpbGRpbmcgYmxvY2sN
Cj4gPiArICogTWVnYSBmZWF0dXJlOiBHZW5lcmFsIENvcmUgZmVhdHVyZXMNCj4gPiArICogU3Vi
LWNhdGVnb3J5OiBDTUQgc3VibWlzc2lvbg0KPiA+ICsgKiBGdW5jdGlvbmFsaXR5OiBUTEIgaW52
YWxpZGF0ZQ0KPiA+ICsgKiBUZXN0IGNhdGVnb3J5OiBmdW5jdGlvbmFsaXR5IHRlc3QNCj4gPiAr
ICovDQo+ID4gK3N0cnVjdCBkYXRhIHsNCj4gPiArCXVpbnQzMl90IGJhdGNoWzE2XTsNCj4gPiAr
CXVpbnQzMl90IGRhdGE7DQo+ID4gKwl1aW50NjRfdCBhZGRyOw0KPiA+ICt9Ow0KPiA+ICsNCj4g
PiArc3RhdGljIHZvaWQgc3RvcmVfZHdvcmRfYmF0Y2goc3RydWN0IGRhdGEgKmRhdGEsIHVpbnQ2
NF90IGFkZHIsIGludA0KPiA+ICt2YWx1ZSkgew0KPiA+ICsJaW50IGI7DQo+ID4gKwl1aW50NjRf
dCBiYXRjaF9vZmZzZXQgPSAoY2hhciAqKSYoZGF0YS0+YmF0Y2gpIC0gKGNoYXIgKilkYXRhOw0K
PiA+ICsJdWludDY0X3QgYmF0Y2hfYWRkciA9IGFkZHIgKyBiYXRjaF9vZmZzZXQ7DQo+ID4gKwl1
aW50NjRfdCBzZGlfb2Zmc2V0ID0gKGNoYXIgKikmKGRhdGEtPmRhdGEpIC0gKGNoYXIgKilkYXRh
Ow0KPiA+ICsJdWludDY0X3Qgc2RpX2FkZHIgPSBhZGRyICsgc2RpX29mZnNldDsNCj4gPiArDQo+
ID4gKwliID0gMDsNCj4gPiArCWRhdGEtPmJhdGNoW2IrK10gPSBNSV9TVE9SRV9EV09SRF9JTU1f
R0VONDsNCj4gPiArCWRhdGEtPmJhdGNoW2IrK10gPSBzZGlfYWRkcjsNCj4gPiArCWRhdGEtPmJh
dGNoW2IrK10gPSBzZGlfYWRkciA+PiAzMjsNCj4gPiArCWRhdGEtPmJhdGNoW2IrK10gPSB2YWx1
ZTsNCj4gPiArCWRhdGEtPmJhdGNoW2IrK10gPSBNSV9CQVRDSF9CVUZGRVJfRU5EOw0KPiA+ICsJ
aWd0X2Fzc2VydChiIDw9IEFSUkFZX1NJWkUoZGF0YS0+YmF0Y2gpKTsNCj4gPiArDQo+ID4gKwlk
YXRhLT5hZGRyID0gYmF0Y2hfYWRkcjsNCj4gPiArfQ0KPiA+ICsNCj4gPiArLyoqDQo+ID4gKyAq
IFNVQlRFU1Q6IGJhc2ljLXRsYg0KPiA+ICsgKiBEZXNjcmlwdGlvbjogQ2hlY2sgVHJhbnNsYXRp
b24gTG9va2FzaWRlIEJ1ZmZlciBJbnZhbGlkYXRpb24uDQo+ID4gKyAqLw0KPiA+ICtzdGF0aWMg
dm9pZCB0bGJfaW52YWxpZGF0aW9uKGludCBmZCwgc3RydWN0DQo+ID4gK2RybV94ZV9lbmdpbmVf
Y2xhc3NfaW5zdGFuY2UgKmVjaSkgew0KPiA+ICsJc3RydWN0IGRybV94ZV9zeW5jIHN5bmNbMl0g
PSB7DQo+ID4gKwkJeyAudHlwZSA9IERSTV9YRV9TWU5DX1RZUEVfU1lOQ09CSiwgLmZsYWdzID0N
Cj4gPiBEUk1fWEVfU1lOQ19GTEFHX1NJR05BTCwgfSwNCj4gPiArCQl7IC50eXBlID0gRFJNX1hF
X1NZTkNfVFlQRV9TWU5DT0JKLCAuZmxhZ3MgPQ0KPiA+IERSTV9YRV9TWU5DX0ZMQUdfU0lHTkFM
LCB9DQo+ID4gKwl9Ow0KPiA+ICsJc3RydWN0IGRybV94ZV9leGVjIGV4ZWMgPSB7DQo+ID4gKwkJ
Lm51bV9iYXRjaF9idWZmZXIgPSAxLA0KPiA+ICsJCS5udW1fc3luY3MgPSAyLA0KPiA+ICsJCS5z
eW5jcyA9IHRvX3VzZXJfcG9pbnRlcigmc3luYyksDQo+ID4gKwl9Ow0KPiA+ICsJc3RydWN0IGRh
dGEgKmRhdGExOw0KPiA+ICsJc3RydWN0IGRhdGEgKmRhdGEyOw0KPiA+ICsJdWludDMyX3Qgdm07
DQo+ID4gKwl1aW50MzJfdCBleGVjX3F1ZXVlOw0KPiA+ICsJdWludDMyX3QgYmluZF9lbmdpbmU7
DQo+ID4gKwl1aW50MzJfdCBzeW5jb2JqOw0KPiA+ICsJc2l6ZV90IGJvX3NpemU7DQo+ID4gKwlp
bnQgdmFsdWUxID0gMHgxMjM0NTY7DQo+ID4gKwlpbnQgdmFsdWUyID0gMHgxMjM0NjU7DQo+ID4g
Kwl1aW50NjRfdCBhZGRyID0gMHgxMDAwMDA7DQo+ID4gKwl1aW50MzJfdCBibzEsIGJvMjsNCj4g
PiArCWNoYXIgdGxiX3ByZVs0MDk2XSwgdGxiX3Bvc1s0MDk2XTsNCj4gPiArCWNoYXIgcGF0aFsy
NTZdOw0KPiA+ICsNCj4gPiArCXN5bmNvYmogPSBzeW5jb2JqX2NyZWF0ZShmZCwgMCk7DQo+ID4g
KwlzeW5jWzBdLmhhbmRsZSA9IHN5bmNvYmpfY3JlYXRlKGZkLCAwKTsNCj4gPiArCXN5bmNbMV0u
aGFuZGxlID0gc3luY29iajsNCj4gPiArDQo+ID4gKwl2bSA9IHhlX3ZtX2NyZWF0ZShmZCwgMCwg
MCk7DQo+ID4gKwlib19zaXplID0gc2l6ZW9mKCpkYXRhMSk7DQo+ID4gKwlib19zaXplID0geGVf
YmJfc2l6ZShmZCwgYm9fc2l6ZSk7DQo+ID4gKwlibzEgPSB4ZV9ib19jcmVhdGUoZmQsIHZtLCBi
b19zaXplLA0KPiA+ICsJCQkJICAgdnJhbV9pZl9wb3NzaWJsZShmZCwgZWNpLT5ndF9pZCksDQo+
ID4gKw0KPiA+IERSTV9YRV9HRU1fQ1JFQVRFX0ZMQUdfTkVFRFNfVklTSUJMRV9WUkFNKTsNCj4g
PiArCWJvMiA9IHhlX2JvX2NyZWF0ZShmZCwgdm0sIGJvX3NpemUsDQo+ID4gKwkJCQkgICB2cmFt
X2lmX3Bvc3NpYmxlKGZkLCBlY2ktPmd0X2lkKSwNCj4gPiArDQo+ID4gRFJNX1hFX0dFTV9DUkVB
VEVfRkxBR19ORUVEU19WSVNJQkxFX1ZSQU0pOw0KPiA+ICsNCj4gPiArCXNwcmludGYocGF0aCwg
Ii9zeXMva2VybmVsL2RlYnVnL2RyaS8wL2d0JWQvc3RhdHMiLCBlY2ktPmd0X2lkKTsNCj4gPiAr
CWlndF9kZWJ1Z2ZzX2R1bXAoZmQsIHBhdGgpOw0KPiA+ICsJaWd0X2RlYnVnZnNfcmVhZChmZCwg
cGF0aCwgdGxiX3ByZSk7DQo+ID4gKwlpZ3RfaW5mbygidGxiIGludmFsaWRhdGlvbnMgY291bnRz
IGJlZm9yZSBzdWJtaXR0aW5nDQo+ID4gK3dvcmFrbG9hZHNcbiVzXG4iLCB0bGJfcHJlKTsNCj4g
PiArDQo+ID4gKwlleGVjX3F1ZXVlID0geGVfZXhlY19xdWV1ZV9jcmVhdGUoZmQsIHZtLCBlY2ks
IDApOw0KPiA+ICsJYmluZF9lbmdpbmUgPSB4ZV9iaW5kX2V4ZWNfcXVldWVfY3JlYXRlKGZkLCB2
bSwgMCk7DQo+ID4gKwl4ZV92bV9iaW5kX2FzeW5jKGZkLCB2bSwgYmluZF9lbmdpbmUsIGJvMSwg
MCwgYWRkciwgYm9fc2l6ZSwgc3luYywNCj4gPiAxKTsNCj4gPiArCWRhdGExID0geGVfYm9fbWFw
KGZkLCBibzEsIGJvX3NpemUpOw0KPiA+ICsNCj4gPiArCXN0b3JlX2R3b3JkX2JhdGNoKGRhdGEx
LCBhZGRyLCB2YWx1ZTEpOw0KPiA+ICsJZXhlYy5leGVjX3F1ZXVlX2lkID0gZXhlY19xdWV1ZTsN
Cj4gPiArCWV4ZWMuYWRkcmVzcyA9IGRhdGExLT5hZGRyOw0KPiA+ICsJc3luY1swXS5mbGFncyAm
PSB+RFJNX1hFX1NZTkNfRkxBR19TSUdOQUw7DQo+ID4gKwlzeW5jWzFdLmZsYWdzIHw9IERSTV9Y
RV9TWU5DX0ZMQUdfU0lHTkFMOw0KPiA+ICsJeGVfZXhlYyhmZCwgJmV4ZWMpOw0KPiA+ICsJaWd0
X2Fzc2VydChzeW5jb2JqX3dhaXQoZmQsICZzeW5jb2JqLCAxLCBJTlQ2NF9NQVgsIDAsIE5VTEwp
KTsNCj4gPiArCXhlX3ZtX2JpbmRfYXN5bmMoZmQsIHZtLCBiaW5kX2VuZ2luZSwgYm8yLCAwLCBh
ZGRyLCBib19zaXplLCBzeW5jLA0KPiA+IDEpOw0KPiA+ICsJZGF0YTIgPSB4ZV9ib19tYXAoZmQs
IGJvMiwgYm9fc2l6ZSk7DQo+ID4gKw0KPiA+ICsJc3RvcmVfZHdvcmRfYmF0Y2goZGF0YTIsIGFk
ZHIsIHZhbHVlMik7DQo+ID4gKwlleGVjLmV4ZWNfcXVldWVfaWQgPSBleGVjX3F1ZXVlOw0KPiA+
ICsJZXhlYy5hZGRyZXNzID0gZGF0YTItPmFkZHI7DQo+ID4gKwlzeW5jWzBdLmZsYWdzICY9IH5E
Uk1fWEVfU1lOQ19GTEFHX1NJR05BTDsNCj4gPiArCXN5bmNbMV0uZmxhZ3MgfD0gRFJNX1hFX1NZ
TkNfRkxBR19TSUdOQUw7DQo+ID4gKwl4ZV9leGVjKGZkLCAmZXhlYyk7DQo+ID4gKwlpZ3RfYXNz
ZXJ0KHN5bmNvYmpfd2FpdChmZCwgJnN5bmNvYmosIDEsIElOVDY0X01BWCwgMCwgTlVMTCkpOw0K
PiA+ICsNCj4gPiArCWlndF9kZWJ1Z2ZzX2R1bXAoZmQsIHBhdGgpOw0KPiA+ICsJaWd0X2RlYnVn
ZnNfcmVhZChmZCwgcGF0aCwgdGxiX3Bvcyk7DQo+ID4gKwlpZ3RfaW5mbygidGxiIGludmFsaWRh
dGlvbnMgY291bnRzIGFmdGVyIHN1Ym1pdHRpbmcNCj4gPiArd29yYWtsb2Fkc1xuJXNcbiIsIHRs
Yl9wb3MpOw0KPiA+ICsNCj4gPiArCWlndF9hc3NlcnRfZXEoZGF0YTEtPmRhdGEsIHZhbHVlMSk7
DQo+ID4gKwlpZ3RfYXNzZXJ0X2VxKGRhdGEyLT5kYXRhLCB2YWx1ZTIpOw0KPiA+ICsJaWd0X2Fz
c2VydChzdHJjbXAodGxiX3ByZSwgdGxiX3BvcykgIT0gMCk7DQo+ID4gKw0KVGhpcyBjb21wYXJl
cyBlbnRpcmUgc3RyaW5nIGVnOiB0bGJfaW52YWxfY291bnQ6MiB3aXRoIHRsYl9pbnZhbF9jb3Vu
dDo4DQpXaGljaCBpcyBpbmNvcnJlY3QgYWNjb3JkaW5nIHRvIG15IHVuZGVyc3RhbmRpbmcsIGNh
biB5b3UgY29udmVydCB0aGF0IGludG8gaW50ZWdlciBhbmQgY29tcGFyZSB0aGF0Pw0KUGxlYXNl
IHRha2UgdGhlIHJldmlld2VkLWJ5IGFmdGVyIHRoaXMuDQoNCj4gPiArCXN5bmNvYmpfZGVzdHJv
eShmZCwgc3luY1swXS5oYW5kbGUpOw0KPiA+ICsJc3luY29ial9kZXN0cm95KGZkLCBzeW5jb2Jq
KTsNCj4gPiArCW11bm1hcChkYXRhMSwgYm9fc2l6ZSk7DQo+ID4gKwltdW5tYXAoZGF0YTIsIGJv
X3NpemUpOw0KPiA+ICsJZ2VtX2Nsb3NlKGZkLCBibzEpOw0KPiA+ICsJZ2VtX2Nsb3NlKGZkLCBi
bzIpOw0KPiA+ICsJeGVfZXhlY19xdWV1ZV9kZXN0cm95KGZkLCBleGVjX3F1ZXVlKTsNCj4gPiAr
CXhlX3ZtX2Rlc3Ryb3koZmQsIHZtKTsNCj4gPiArfQ0KPiA+ICsNCj4gPiAraWd0X21haW4NCj4g
PiArew0KPiA+ICsJaW50IGZkOw0KPiA+ICsJc3RydWN0IGRybV94ZV9lbmdpbmUgKmVuZ2luZTsN
Cj4gPiArDQo+ID4gKwlpZ3RfZml4dHVyZSB7DQo+ID4gKwkJZmQgPSBkcm1fb3Blbl9kcml2ZXIo
RFJJVkVSX1hFKTsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlpZ3Rfc3VidGVzdCgiYmFzaWMtdGxi
Iikgew0KPiA+ICsJCWVuZ2luZSA9IHhlX2VuZ2luZShmZCwgMCk7DQo+ID4gKwkJdGxiX2ludmFs
aWRhdGlvbihmZCwgJmVuZ2luZS0+aW5zdGFuY2UpOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCWln
dF9maXh0dXJlIHsNCj4gPiArCQlkcm1fY2xvc2VfZHJpdmVyKGZkKTsNCj4gPiArCX0NCj4gPiAr
fQ0KPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9tZXNvbi5idWlsZCBiL3Rlc3RzL21lc29uLmJ1aWxk
IGluZGV4DQo+ID4gZTVkODg1MmYzLi4xN2M4MDhhYjYgMTAwNjQ0DQo+ID4gLS0tIGEvdGVzdHMv
bWVzb24uYnVpbGQNCj4gPiArKysgYi90ZXN0cy9tZXNvbi5idWlsZA0KPiA+IEBAIC0zMTYsNiAr
MzE2LDcgQEAgaW50ZWxfeGVfcHJvZ3MgPSBbDQo+ID4gIAkneGVfc3lzZnNfZGVmYXVsdHMnLA0K
PiA+ICAJJ3hlX3N5c2ZzX3ByZWVtcHRfdGltZW91dCcsDQo+ID4gIAkneGVfc3lzZnNfc2NoZWR1
bGVyJywNCj4gPiArICAgICAgICAneGVfdGxiJywNCj4gPiAgXQ0KPiA+DQo+ID4gIGludGVsX3hl
X2V1ZGVidWdfcHJvZ3MgPSBbDQo+ID4gLS0NCj4gPiAyLjI1LjENCg0K
