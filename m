Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00361CA0EE4
	for <igt-dev@archiver.kernel.org>; Fri, 15 Aug 2025 16:30:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C91410E277;
	Fri, 15 Aug 2025 16:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cCMtikQT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B9A10E267
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Aug 2025 16:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755275409; x=1786811409;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TK1bOMjUcXUs35qtFZxv5P0d5Uf+rSel/2E2WGAnqPE=;
 b=cCMtikQTr5gm3MxVH45wp1K9eF/ZVVvgQLs7vPSgCUN0RZDE4Pqe/aRh
 GVbqiBfiM1PCkjefMxhjNYWpuwGZg3fekYQRfpT7YBaJQGpHUlx+rVViq
 /WjpVqp6UsWWhP/7XXLtohF8XXyi6VoDZ47daGtClaHPaOUfIyVncpv4G
 /h3UviGZAW+Z1H1PRm6RQFGg9MZCXOdQnpGmBj0zfwvwL5XBqa4D7fLcQ
 il6qzyXEqTaDKz7NX/2fYzEPr8nINF9birvUxa1XlLo57d2LCBPw32vNg
 MBacOvME/GjkkXrXGdzYMUDITi8u42OmyC1NsVJ0mbOvAkQ2emzhudw1g A==;
X-CSE-ConnectionGUID: ZCIGUETJSayLe3RaQiTf9Q==
X-CSE-MsgGUID: MTgtBLvrT9mzLq7zkvMcSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="57311399"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="57311399"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 09:30:09 -0700
X-CSE-ConnectionGUID: FDMPgilhSMOdf3TDomkriw==
X-CSE-MsgGUID: 3y7JWeZ3SPCx+DFTD7lP2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="167426372"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 09:30:08 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 09:30:08 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 15 Aug 2025 09:30:08 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.49)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 09:30:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FtDKQqDCxLOWFeNUh0P9BFHg2w9qqoQVy1bmaORNiF4gxkU+Uh5SrpJ3p/P18DMR9M1Imhewou39hs1gFzw9U4nY5kavBfJgWYD+z9zuzBGBLN0vKQgV1wOMdknpPkLHj8MMDu9rajpEBU5/qDCKjOq7J2dVB04hRK/mxytJUMMCWy13M+vR0hkSTZxZkzzB3dJMnTNsl91EgR2BvzkSUqpo8LAWHF28EOzk8ZX7HxKCfzwyorde+MSgZn2o7nnXlXFDCj+7RMlLL/INCwXOT44mP0hr/AIYnjNk6yspei/Og8k4GMDkUduwDn1eiWJYoeM0FLGlmCU5mP0f8gQoIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TK1bOMjUcXUs35qtFZxv5P0d5Uf+rSel/2E2WGAnqPE=;
 b=TMOke2sT3ZVhyg99X0wFwj/hm7HvU/F61xFC7m5eq3VWAUSN0KuecIqnaG6BYyy+KWgU56afDfrhas5HUF7JjB5ZYSUU4TPQi0ZcC7N0tSIK9gHKtNvoq5nbBxVzWaQkvoEL+k7vlbcFZfKI+wih1txTrtvJM/asL9n2uOs6v7B02WzelTzx5XwSK5pulBx102WQ5j0asa/Bq33cCReKrnWrBsQfJn3xLP1sExhUmz5kMErzT/DGnPeUTAbUVOj/F8mzObx1ZxBu0rDgbrN8Yjq1m2YUkD4E6JzvAgt7Cnl1dQM/pOP+cXxrSHBchXuW8sHRnlnuitj1dwxUuQGHQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS0PR11MB8113.namprd11.prod.outlook.com (2603:10b6:8:127::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 16:30:04 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 16:30:04 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Vishwanathapura,
 Niranjana" <niranjana.vishwanathapura@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] lib/xe/xe_spin: Add additional MI_ARB_CHECK to
 preemptable spin init
Thread-Topic: [PATCH] lib/xe/xe_spin: Add additional MI_ARB_CHECK to
 preemptable spin init
Thread-Index: AQHcDUxS8k/xk7we/E2ZAKCRd3s/BLRigh0AgAAA5sCAAARqgIAAAvRQgAAMTYCAAVFKkA==
Date: Fri, 15 Aug 2025 16:30:04 +0000
Message-ID: <CH0PR11MB54444C01B1B7F158E68C274FE534A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250814185009.52614-2-jonathan.cavitt@intel.com>
 <aJ4zZki709mmqtbV@lstrano-desk.jf.intel.com>
 <CH0PR11MB544476B570A9C0B2BB2CECA4E535A@CH0PR11MB5444.namprd11.prod.outlook.com>
 <aJ432wBs0B9fhINb@lstrano-desk.jf.intel.com>
 <CH0PR11MB54440D656813901A670CCE7CE535A@CH0PR11MB5444.namprd11.prod.outlook.com>
 <aJ5Epw7QohBibGI1@lstrano-desk.jf.intel.com>
In-Reply-To: <aJ5Epw7QohBibGI1@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS0PR11MB8113:EE_
x-ms-office365-filtering-correlation-id: 51bd7299-cb7d-4dbf-2807-08dddc18fd76
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?TWRFeGV6WjA5WFNxTUdSRXN4dUYzazFpZENEbDQxaUgyR1orc2VRKzRpL0M2?=
 =?utf-8?B?QnVXamxuM0h1STdybUp4Z2ZJTWk3UTFpWTA1b0hXR3Ezay8rcXZXdmdXemdV?=
 =?utf-8?B?OTZhd29wSUN2YnJBL0YxZ2xPQ1gxbTFLa3dvYzhUK0FJMEF3aGw2VEcvRDBB?=
 =?utf-8?B?THFURTVKY0RBVWZLKzl2NDZrQTAyN05OWlNXSkJicW1QeHB0M1QyTlpiR0pa?=
 =?utf-8?B?TTBvc2FpRDR1RTFIRWViVXp4SC82L1JsWURIR1ZYZXp4eWtYbkd3OHNOOUdu?=
 =?utf-8?B?Ykxaazl6bE9VTmJpUGo5QVZqYWZrOHlNemtoYU00aUtqZkFma1R2T3d1ZVd4?=
 =?utf-8?B?Yk9mYWJZSW9pK0g1eHBVMTZWOS9YWkp3WVpUYStUZkI4Y1RqejUzMnB2U3A5?=
 =?utf-8?B?cU9ZUGcvYlpqN2pLaWtNYzlwb2Y1OVJzNzNBNTk5M1p1cjlWcXozb3ZSMG1X?=
 =?utf-8?B?Y0ZHUkJPUFZxalNFSUMxSUFqQUhjVVluNkR6b0w5ZXBNVUNRMktZSGVyWGNW?=
 =?utf-8?B?NW16cVpMQ3N3d3VmZXIyS2NLT1lENXo0V0M0U3RMTDMvZnZMa3doaG4zOWRY?=
 =?utf-8?B?QzExN3BUZDBVUnRlNWl0U0dyOEJVT3cyWVYwbjc5MzBEY1hFU2oyaS9KWnJh?=
 =?utf-8?B?UFVIU3pLaTM2MjRSTEh3TUJuR3h3aHJGeW1GNWs0bUp6WitpeWVMZ2pZaEQr?=
 =?utf-8?B?QjBkTUFsbUQyMkdxOEpIOTJSWFBvb1h3TkQrV0hDZ2lVMkZ3MEs5cUM5NVdV?=
 =?utf-8?B?ZmpwdTEvT0lDTlJvWkJmSTBpZTZQVkNRV1BWZUhSc3NNS2NkbzV2YU1MbnlI?=
 =?utf-8?B?RHNRR1VpS1BaTC96czM1SmQ5SytFVWp2UWttdnNDNEJhWXBCL1BWWW5SS2xp?=
 =?utf-8?B?cmVUUWdRTVJIdXYzOTBwMWpiaGFJckJqRUcyYkUvZ0RwcGRtWU8xa1hnT3FJ?=
 =?utf-8?B?NzBRVnJMVzgxeGU0TDVqaFYydnRoVEcxSHo0Tmx3SFF5OC9waGFrV2pyTi9H?=
 =?utf-8?B?SDJ4YjBidlJ3UkQxaXd4R3Z0SVJ1TmxLZmFDN0NhSTQ1cStaamR2K3VybWNW?=
 =?utf-8?B?bHlvaWsvNkMyS2wycHNxd3h4UlczYkdERE91YjRsTXkrU3ptYVc2MUFDc3Fl?=
 =?utf-8?B?SHk3M0tsN3VGSlZWcmNZazBFQWsrL2V2UWNFczJwclZzRjQzSFR5dnhqVjgw?=
 =?utf-8?B?YVRoZE5RLzFobWc5WmpmN2VrdlpSSWo1KzhXZi90TEc4WVZ1cndHRzlIcEtL?=
 =?utf-8?B?MGJjYU8vTU9vSHJpTkJiODAvZ2FSR0V1c0dnNHYyNnEwZVFTVHVIb1ZqaTFJ?=
 =?utf-8?B?eUpSWkZsdlRIVlpQbk96UWd5Sll3NDFHcHJhbnJabktvK0NTSUNXOHZRNHpo?=
 =?utf-8?B?b3UxVDdhMFNzd1lWRTRRRFlTMXUzY3NycURCQVhvNHlxd0tJOVpJSDk0OUJX?=
 =?utf-8?B?U2dQNE5UcUhIa1NRM01GL0hPT1l6Nzg2N3VVNkNUVEd2T3Fuck9PaGJBWWtH?=
 =?utf-8?B?OXRsWmQyRGlRWkQydmw0QTd0TmJvQTVRNkJUYThBQzRJNGtEaTFSdGY5Tk1j?=
 =?utf-8?B?UTBvSEp2TW1NUlZYN0Zsc00xLzRaK3EzS0tiWTlLenVwcXNjaitIckd4eWIw?=
 =?utf-8?B?MkZFb3Nkc2NtWi9jYStUaHg1c2tZbGR4L0h3d3ZoQXprazdZN1FOcFIyZjh0?=
 =?utf-8?B?VFoweWMxQmtBY3dRb1BGSFRiajhUcHo4VytrbnBGQVlod0VUeFN2RmwyUHhO?=
 =?utf-8?B?aEVtUVFGYjBUMjBoYnZ4NDc3MklPZG9OSW1YUWlZL1dTb1JOR2N0ZU5oYU9B?=
 =?utf-8?B?UVBoMU0vZzRPTFVjMndzZGM3WFBuRHpraTdmK1dOeXM2Y01yVGxaNWpTNjRj?=
 =?utf-8?B?OGc5dG01Yi9Ma253RkNlTDc1YURXSWQwdEs0Rm14NVBkYVZlU1ErWk5GMEVn?=
 =?utf-8?Q?rUeixnq8uwo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bkd5MDlaYkpYQUxJRXVZL2UvS3F3TnRiL2NzS09kVm1GczI3T0VOZ3FUd3Bh?=
 =?utf-8?B?NXlPS1VoZlRDalYybk0xTSt4MlFHckJjVWk5MXprakc1VnVhdmJGVDhpckFq?=
 =?utf-8?B?bnVBMVE3NWtZMnZEMS9PR2ZjQ3J0MWJkaVJLNUNMVDNCcG83QzdwL0d6ek9D?=
 =?utf-8?B?eC9QLzkrS3VuRzRaWXArOWxsT1U2ODRjNEhBQ0owaG9NeCtqeWhUeTk1THBE?=
 =?utf-8?B?eVpveDhrYk1UYkxjMXdtb3U5dHlNYWk0NVIwMFJoa1c0MkJ2WE9TVUNtZGlv?=
 =?utf-8?B?MFRYNndNM1lqWnhSTXYyQVB5am9DRFRSOHYrcUpnTDc1K3Q2WTJ0QXQrREt5?=
 =?utf-8?B?THpZQitEL3N5cFVoUE96Mzg0a2s5bjlwZmZRbjg0YUY5cDVselZxaEkxbzVu?=
 =?utf-8?B?cEx6V2hUZUFvdjdpbWpJQkhSdnk5dFdYSFRBTTE3Rko3S3MraStPNU1jald4?=
 =?utf-8?B?WERNYmVtK2JnazY5RmM0MGk5Q3ZIUWZKV3hmdzFxZlVGR2xNaE1KSEo2bkYr?=
 =?utf-8?B?ODlzbnhRMWsrMng0NkNEaGNNQlJXR3cxdC8rM01oR2tyeXl2Q2h3eGhJQ3NC?=
 =?utf-8?B?d0hQTzRSdWRkcGdnU05uc1I1b2k2VjZkcjFMMWRUUVo5REx1MDZiMXpPKzI2?=
 =?utf-8?B?Mm9vbmdSQ1MrbzBxMGhEemxZUzNOTVhTOWVIV3o3b0ozbExpRW8rb2ZiUnJz?=
 =?utf-8?B?Rm5KTGdHeENCd1BYYlpuYndTRkxqeE9KeVF6dVh1LzFsaTFTb3pOMGs1Z3d3?=
 =?utf-8?B?dHZlTW5EZXpsNU5Ic1R3QWF6UWZDQkFuM3d1S1gvQm5IUjk2S29OOE9kR3g3?=
 =?utf-8?B?MEd2bERlbVdpSGZ0OVpmQTJ3OXR5aWFhakUxaHlENWNZcEpJNVZlcGUrZzZa?=
 =?utf-8?B?b1d4cUtQb2U1MEdRUEpMcUZhZU9HYWtLU0lrT1hHcWxaVC95NnNIZ0VWWUly?=
 =?utf-8?B?WVB6UkQxTjNlZEVWSVhOSWdmVkY5VFpRVlhkRGpIalRhYUVyZ0prUW9mT2dp?=
 =?utf-8?B?V0lzZ0JLbXNOUTF6TmZlSzVBZURwSU5GazhlYTNhS3hmTFVzYnc2QVdvenRS?=
 =?utf-8?B?TXdjeTZlaTRYMzJFKzlyTG5pa1BXNkUxTUdYeGlSdWJ5TTVDdkRvcktzZ2Y0?=
 =?utf-8?B?UVBlcEgrb29MUU5BekFOaE9mRGF6VlFZYzZLMjBJYXlzTStINXZJRFU5azRo?=
 =?utf-8?B?VkRBZy9MdWlhYnlITkhtS0xNSUZYY3B6OURyeDhRVk4raU5ycGlkZzdqUVhx?=
 =?utf-8?B?bGpQM0E0di81M3JEb2FEZEVRSGMxc1h5Qmd3djgvUnBrYzl4NWxqcWl5UCtT?=
 =?utf-8?B?bWlSKys2ZStiOVZWYVZQZWhxczhWbnpqOE1xYjZRTWJrc1oyZnlGNXp4KzVj?=
 =?utf-8?B?Y0doQ0ZCUEx0RTQ3bU93NmkyaWdUMEVIcWlGa2d6SnAzMmZjdXc3S1dMMFRG?=
 =?utf-8?B?UG9uczdsSnZRWHR1bVVnYW5yQmVCSnhJcGpNVGRSQjZIRXNBdE5aN3BSdUxv?=
 =?utf-8?B?b1NiOURBb2xtNVVVNnFLZnpFS0pVUXFRblNrVnNPK2FFMFVnV05kSlRQdjRt?=
 =?utf-8?B?WmZ1VVEwL3NsckRKbEQ3dzlGdE9QVHNQdUEvS3pCTmFEZXFsOG1XTWhQc25o?=
 =?utf-8?B?WEkwTmt0dEQ0Q1huSkZYU1BWTHo1WjhYZWwrRitmWXVVa0piQ2d2ZUh6UDFT?=
 =?utf-8?B?YithVzRBV0xSNkRKYjNGbGk3b0VTL2VtSHUrRk5wQmZvblUwQ3BNS3NXU1Bp?=
 =?utf-8?B?UmNuM3N0M2E0ZVJTMktYRDhOMEJ6d0hHbkdzZCt0Y1h2MmhuM1ZpS2g5N1Rx?=
 =?utf-8?B?RVFaUjUxL3U2U3JyV09kdHJ3T0tVVDM1aHlBejhkcjdZYTR4UXV6QzJQa0Ju?=
 =?utf-8?B?UThmWmhuSGJCVGhKS3JxMHJLbEMwLzNia2JmMVU5V1d0b20zc2REdTNLbmtn?=
 =?utf-8?B?a0dXRS81N0VrZUtyQ0hTUHBtNzcwQkFlZnNXaGxjaTVhZzZzMW9XeDBua0Ja?=
 =?utf-8?B?VDZMdTlEN2pxN2FRWTVIUUhIUXM5MWN6UmZEVnRCRlNVdmdOZ3RVODZ2Vjgv?=
 =?utf-8?B?YzhDWTFoRjhka0xPMHpzTW51VEo5SU1FYXR6OFo0aVUycnJ0L3J5eUtma04z?=
 =?utf-8?Q?XAgGVm2YtTDTq0BulZGv9QE+i?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51bd7299-cb7d-4dbf-2807-08dddc18fd76
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 16:30:04.5447 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L6fy9B51C/Y/7thAEcTAzeYIZMK+q2/uM9mi5v49eJWzaweqGyb8gaCfFfJElJzHDnvENAC692P/I8tusxT7uNoD4iiXwcrXTOkoSVSE0rg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8113
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEJyb3N0LCBNYXR0aGV3IDxtYXR0aGV3
LmJyb3N0QGludGVsLmNvbT4gDQpTZW50OiBUaHVyc2RheSwgQXVndXN0IDE0LCAyMDI1IDE6MTkg
UE0NClRvOiBDYXZpdHQsIEpvbmF0aGFuIDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPg0KQ2M6
IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBHdXB0YSwgc2F1cmFiaGcgPHNhdXJhYmhn
Lmd1cHRhQGludGVsLmNvbT47IFp1bywgQWxleCA8YWxleC56dW9AaW50ZWwuY29tPjsgS2VtcGN6
eW5za2ksIFpiaWduaWV3IDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+OyBWaXNod2Fu
YXRoYXB1cmEsIE5pcmFuamFuYSA8bmlyYW5qYW5hLnZpc2h3YW5hdGhhcHVyYUBpbnRlbC5jb20+
DQpTdWJqZWN0OiBSZTogW1BBVENIXSBsaWIveGUveGVfc3BpbjogQWRkIGFkZGl0aW9uYWwgTUlf
QVJCX0NIRUNLIHRvIHByZWVtcHRhYmxlIHNwaW4gaW5pdA0KPiANCj4gT24gVGh1LCBBdWcgMTQs
IDIwMjUgYXQgMDE6NDM6MDFQTSAtMDYwMCwgQ2F2aXR0LCBKb25hdGhhbiB3cm90ZToNCj4gPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IEJyb3N0LCBNYXR0aGV3IDxtYXR0
aGV3LmJyb3N0QGludGVsLmNvbT4gDQo+ID4gU2VudDogVGh1cnNkYXksIEF1Z3VzdCAxNCwgMjAy
NSAxMjoyNCBQTQ0KPiA+IFRvOiBDYXZpdHQsIEpvbmF0aGFuIDxqb25hdGhhbi5jYXZpdHRAaW50
ZWwuY29tPg0KPiA+IENjOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgR3VwdGEsIHNh
dXJhYmhnIDxzYXVyYWJoZy5ndXB0YUBpbnRlbC5jb20+OyBadW8sIEFsZXggPGFsZXguenVvQGlu
dGVsLmNvbT47IEtlbXBjenluc2tpLCBaYmlnbmlldyA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50
ZWwuY29tPjsgVmlzaHdhbmF0aGFwdXJhLCBOaXJhbmphbmEgPG5pcmFuamFuYS52aXNod2FuYXRo
YXB1cmFAaW50ZWwuY29tPg0KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGxpYi94ZS94ZV9zcGlu
OiBBZGQgYWRkaXRpb25hbCBNSV9BUkJfQ0hFQ0sgdG8gcHJlZW1wdGFibGUgc3BpbiBpbml0DQo+
ID4gPiANCj4gPiA+IE9uIFRodSwgQXVnIDE0LCAyMDI1IGF0IDAxOjExOjM5UE0gLTA2MDAsIENh
dml0dCwgSm9uYXRoYW4gd3JvdGU6DQo+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+ID4gPiA+IEZyb206IEJyb3N0LCBNYXR0aGV3IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4g
DQo+ID4gPiA+IFNlbnQ6IFRodXJzZGF5LCBBdWd1c3QgMTQsIDIwMjUgMTI6MDUgUE0NCj4gPiA+
ID4gVG86IENhdml0dCwgSm9uYXRoYW4gPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+DQo+ID4g
PiA+IENjOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgR3VwdGEsIHNhdXJhYmhnIDxz
YXVyYWJoZy5ndXB0YUBpbnRlbC5jb20+OyBadW8sIEFsZXggPGFsZXguenVvQGludGVsLmNvbT47
IEtlbXBjenluc2tpLCBaYmlnbmlldyA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPjsg
VmlzaHdhbmF0aGFwdXJhLCBOaXJhbmphbmEgPG5pcmFuamFuYS52aXNod2FuYXRoYXB1cmFAaW50
ZWwuY29tPg0KPiA+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIXSBsaWIveGUveGVfc3BpbjogQWRk
IGFkZGl0aW9uYWwgTUlfQVJCX0NIRUNLIHRvIHByZWVtcHRhYmxlIHNwaW4gaW5pdA0KPiA+ID4g
PiA+IA0KPiA+ID4gPiA+IE9uIFRodSwgQXVnIDE0LCAyMDI1IGF0IDA2OjUwOjEwUE0gKzAwMDAs
IEpvbmF0aGFuIENhdml0dCB3cm90ZToNCj4gPiA+ID4gPiA+IEFkZCBhbiBhZGRpdGlvbmFsIE1J
X0FSQl9DSEVDSyB0byB0aGUgc3BpbiBpbml0aWFsaXphdGlvbiBmdW5jdGlvbiwNCj4gPiA+ID4g
PiA+IGp1c3QgYmVmb3JlIHRoZSBjb25kaXRpb25hbCBiYXRjaCBidWZmZXIgZW5kLCB3aGVuIHBy
ZWVtcHRpb24gaXMNCj4gPiA+ID4gPiA+IGVuYWJsZWQuICBUaGUgTUlfQVJCX0NIRUNLIGZvcmNl
cyBhIHByZWVtcHRpb24gaW4gdGhpcyBjYXNlLCB3aGljaCBjYW4NCj4gPiA+ID4gPiA+IGFsbG93
IGFkZGl0aW9uYWxseSBzY2hlZHVsZWQgZXhlYyBxdWV1ZXMgdG8gbWFrZSBpbmRlcGVuZGVudCBw
cm9ncmVzcw0KPiA+ID4gPiA+ID4gZWFybGllciB0aGFuIGlmIHdlIHJlbGllZCBvbiB0aGUgYXV0
b21hdGljIHRpbWVvdXQgb2YgdGhlIGV4ZWMgcXVldWUuDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4g
PiA+IENsb3NlczogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS94ZS9rZXJuZWwv
LS9pc3N1ZXMvNTc4Mw0KPiA+ID4gPiA+ID4gU3VnZ2VzdGVkLWJ5OiBaYmlnbmlldyBLZW1wY3p5
xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4NCj4gPiA+ID4gPiA+IFNpZ25l
ZC1vZmYtYnk6IEpvbmF0aGFuIENhdml0dCA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT4NCj4g
PiA+ID4gPiA+IENjOiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4NCj4g
PiA+ID4gPiA+IENjOiBOaXJhbmphbmEgVmlzaHdhbmF0aGFwdXJhIDxuaXJhbmphbmEudmlzaHdh
bmF0aGFwdXJhQGludGVsLmNvbT4NCj4gPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+ID4gIGxpYi94
ZS94ZV9zcGluLmMgfCA0ICsrKy0NCj4gPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IGRpZmYg
LS1naXQgYS9saWIveGUveGVfc3Bpbi5jIGIvbGliL3hlL3hlX3NwaW4uYw0KPiA+ID4gPiA+ID4g
aW5kZXggMjVmNzU1NWUyNy4uYjNhOTM3ZmU4MCAxMDA2NDQNCj4gPiA+ID4gPiA+IC0tLSBhL2xp
Yi94ZS94ZV9zcGluLmMNCj4gPiA+ID4gPiA+ICsrKyBiL2xpYi94ZS94ZV9zcGluLmMNCj4gPiA+
ID4gPiA+IEBAIC0zMCw3ICszMCw2IEBADQo+ID4gPiA+ID4gPiAgDQo+ID4gPiA+ID4gPiAgZW51
bSB7IFNUQVJUX1RTLCBOT1dfVFMgfTsNCj4gPiA+ID4gPiA+ICANCj4gPiA+ID4gPiA+IC0NCj4g
PiA+ID4gPiA+ICB1aW50MzJfdCB4ZV9zcGluX25zZWNfdG9fdGlja3MoaW50IGZkLCBpbnQgZ3Rf
aWQsIHVpbnQ2NF90IG5zZWMpDQo+ID4gPiA+ID4gPiAgew0KPiA+ID4gPiA+ID4gIAl1aW50MzJf
dCB0aWNrcyA9IHhlX25zZWNfdG9fdGlja3MoZmQsIGd0X2lkLCBuc2VjKTsNCj4gPiA+ID4gPiA+
IEBAIC0xNjcsNiArMTY2LDkgQEAgdm9pZCB4ZV9zcGluX2luaXQoc3RydWN0IHhlX3NwaW4gKnNw
aW4sIHN0cnVjdCB4ZV9zcGluX29wdHMgKm9wdHMpDQo+ID4gPiA+ID4gPiAgCQkJCSAgIG9wdHMt
Pm1lbV9jb3B5LT5kc3QtPm1vY3NfaW5kZXg7DQo+ID4gPiA+ID4gPiAgCX0NCj4gPiA+ID4gPiA+
ICANCj4gPiA+ID4gPiA+ICsJaWYgKG9wdHMtPnByZWVtcHQpDQo+ID4gPiA+ID4gPiArCQlzcGlu
LT5iYXRjaFtiKytdID0gTUlfQVJCX0NIRUNLOw0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IEJ1dCB3
ZSBhbHJlYWR5IGhhdmUgb25lIHRoZXNlIGF0IHRoZSB0b3Agb2YgdGhlIGxvb3A6DQo+ID4gPiA+
ID4gDQo+ID4gPiA+ID4gIDcyICAgICAgICAgbG9vcF9hZGRyID0gb3B0cy0+YWRkciArIGIgKiBz
aXplb2YodWludDMyX3QpOw0KPiA+ID4gPiA+ICA3Mw0KPiA+ID4gPiA+ICA3NCAgICAgICAgIHNw
aW4tPmJhdGNoW2IrK10gPSBNSV9TVE9SRV9EV09SRF9JTU1fR0VONDsNCj4gPiA+ID4gPiAgNzUg
ICAgICAgICBzcGluLT5iYXRjaFtiKytdID0gc3RhcnRfYWRkcjsNCj4gPiA+ID4gPiAgNzYgICAg
ICAgICBzcGluLT5iYXRjaFtiKytdID0gc3RhcnRfYWRkciA+PiAzMjsNCj4gPiA+ID4gPiAgNzcg
ICAgICAgICBzcGluLT5iYXRjaFtiKytdID0gMHhjMGZmZWU7DQo+ID4gPiA+ID4gIDc4DQo+ID4g
PiA+ID4gIDc5ICAgICAgICAgaWYgKG9wdHMtPnByZWVtcHQpDQo+ID4gPiA+ID4gIDgwICAgICAg
ICAgICAgICAgICBzcGluLT5iYXRjaFtiKytdID0gTUlfQVJCX0NIRUNLOw0KDQpJIHBlcmZvcm1l
ZCB0aGUgZXhwZXJpbWVudCB0aGF0IHlvdSByZXF1ZXN0ZWQsIGFuZCBpdCBzZWVtcyBhZGRpbmcg
YW4gTUlfTk9PUA0KYWZ0ZXIgdGhpcyBNSV9BUkJfQ0hFQ0sgaXMgc3VmZmljaWVudCB0byBwcmV2
ZW50IHRoZSBvYnNlcnZlZCBpc3N1ZS4gIEFueSB0aG91Z2h0cw0Kb24gd2h5IHRoaXMgbWlnaHQg
YmUgdGhlIGNhc2U/DQotSm9uYXRoYW4gQ2F2aXR0DQoNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBM
aW5lIDc0IGlzIGhlcmUgdGhlIHJpbmcgbG9vcCByZXN0YXJ0cy4NCj4gPiA+ID4gDQo+ID4gPiA+
IEkgdHJpZWQgcmVtb3ZpbmcgdGhlIHRvcCBNSV9BUkJfQ0hFQ0ssIGJ1dCB0aGF0IGNhdXNlZCB0
aGUgdGVzdCB0byBzdGFydA0KPiA+ID4gPiBmYWlsaW5nIGFnYWluLCBzbyBpdCBsb29rcyBsaWtl
IGJvdGggTUlfQVJCX0NIRUNLIGNhbGxzIGFyZSBuZWNlc3NhcnkuDQo+ID4gPiA+IC1Kb25hdGhh
biBDYXZpdHQNCj4gPiA+IA0KPiA+ID4gSXQgc2hvdWxkbuKAmXQgYmUsIHRob3VnaC4gQSBjb3Vw
bGUgb2YgaW5zdHJ1Y3Rpb25zIGxhdGVyIHdlIHNob3VsZCBqdW1wDQo+ID4gPiB0byBsb29wX2Fk
ZHIgKHRoYXQgaXMgbGluZSA3MyByaW5nIGluc3RydWN0aW9uKSBhbmQgdGhlbiBleGVjdXRlIHRo
ZQ0KPiA+ID4gTUlfQVJCX0NIRUNLIHByb2dyYW1tZWQgaW4gdGhlIHJpbmcgYXQgbGluZSA4MC4N
Cj4gPiA+IA0KPiA+ID4gSeKAmW0gYWxsIGZvciBmaXhpbmcgdGhlIHRlc3RzLCBidXQgSSB3YW50
IHRvIHVuZGVyc3RhbmQgd2hhdOKAmXMgZ29pbmcgb24NCj4gPiA+IGhlcmUuDQo+ID4gPiANCj4g
PiA+IENhbiB5b3UgcmVsaWFibHkgcmVwcm9kdWNlIHRoaXMgaXNzdWUgYW5kIGNvbmZpcm0gdGhh
dCBpdCBmYWlscyBiZWZvcmUNCj4gPiA+IHRoaXMgY2hhbmdlIGFuZCB3b3JrcyBhZnRlcj8NCj4g
PiANCj4gPiBZZXMuDQo+ID4gDQo+ID4gQmVmb3JlIHRoZSBjaGFuZ2UsIHRoZSBpc3N1ZSBvY2N1
cnMgd2l0aCBtaXhlZCBmcmVxdWVuY3kgKGFib3V0IDEwJSksIGFuZCBtYW55DQo+ID4gcnVucyB0
YWtlIGFyb3VuZCBhIGhhbGYtc2Vjb25kIHRvIGNvbXBsZXRlLiAgQWZ0ZXIgdGhlIGNoYW5nZSwg
dGhlIHRlc3QgY29uc2lzdGVudGx5DQo+ID4gcGFzc2VzIGFuZCB0YWtlcyBhcm91bmQgMTAgbXMg
dG8gY29tcGxldGUuDQo+ID4gDQo+ID4gVGhlIHByaW1hcnkgY2F1c2Ugb2YgdGhlIGlzc3VlIHNl
ZW1zIHRvIGJlIGFuIGVuZ2luZSByZXNldCB0aGF0IG9jY3VycyBkdWUgdG8NCj4gPiBhbiBleGVj
LXF1ZXVlIGhhbmcuICBUaGUgYWRkaXRpb25hbCBNSV9BUkJfQ0hFQ0sgc2VlbXMgdG8gZm9yY2Ug
dGhlIHNlY29uZA0KPiANCj4gQW4gZW5naW5lIHJlc2V0IG9jY3VycyBpZiB0aGUgR3VDIGlzc3Vl
cyBhIHByZWVtcHRpb24gYW5kIHRoZSBlbmdpbmUNCj4gZG9lc27igJl0IHJlc3BvbmQgd2l0aGlu
IH4wLjYgc2Vjb25kcyAodGhlIGRlZmF1bHQgcHJlZW1wdGlvbiB0aW1lb3V0KS4NCj4gDQo+ID4g
c2NoZWR1bGVkIGV4ZWMtcXVldWUgdG8gbWFrZSBmb3J3YXJkIHByb2dyZXNzLCB3aGljaCB1bmJs
b2NrcyB0aGUgZmlyc3QgYW5kDQo+ID4gcHJldmVudHMgdGhlIGhhbmcuDQo+ID4gDQo+ID4gUGVy
aGFwcyB0aGUgInJlYWwiIGlzc3VlIHRoYXQgdGhlIE1JX0JBVENIX0JVRkZFUl9TVEFSVCBsb29w
YmFjayBjYXVzZXMgdGhlDQo+ID4gZXhlY3V0aW9uIGNhbGwgc3RhY2sgdG8gZmlsbCB1cCwgcmVz
dWx0aW5nIGluIHRoZSBzeXN0ZW0gaGF2aW5nIHRvIGNsZWFyIHVwIG11bHRpcGxlDQo+ID4gbGF5
ZXJzIG9mIGV4ZWN1dGlvbiBvbmNlIHRoZSBzZWNvbmQgZXhlYyBxdWV1ZSBjb21wbGV0ZXM/ICBJ
IGRvbid0IHRoaW5rIHRoYXQncw0KPiA+IHBhcnRpY3VsYXJseSBzb2x2YWJsZSwgdGhvdWdoLg0K
PiANCj4gSSBkb27igJl0IHRoaW5rIHRoYXTigJlzIHRoZSBjYXVzZS4gVG8gbWUsIHRoaXMgcG9p
bnRzIHRvIGEgUFRMIGhhcmR3YXJlDQo+IGlzc3Vl4oCUdGhpcyBzaG91bGRu4oCZdCBiZSBuZWNl
c3NhcnksIGFzIEnigJl2ZSBub3RlZCBhbmQgd29ya3Mgb24gYWxsDQo+IHBsYXRmb3JtcyBBRkFJ
Sy4gDQo+IA0KPiBNYXliZSB0cnkgc29tZSBvdGhlciBleHBlcmltZW50cyB0b2/igJRmb3IgZXhh
bXBsZSwgbW92ZSB0aGUgc2luZ2xlDQo+IHByZWVtcHRpb24gcG9pbnQgdG8gdmFyaW91cyBwbGFj
ZXMgaW4gdGhlIHJpbmcsIG9yIGluc2VydCBzb21lIE5PUHMgaW50bw0KPiB0aGUgcmluZyAoaW4g
Y2FzZSB0aGVyZeKAmXMgYW4gYWxpZ25tZW50IGlzc3VlIHdpdGggaW5zdHJ1Y3Rpb24NCj4gcHJv
Z3JhbW1pbmcsIGV0Yy4pLg0KPiANCj4gV2Ugc2hvdWxkIGJyaW5nIGluIFNWIHRvIHJvb3QtY2F1
c2UgYW55IGhhcmR3YXJlIHByb2JsZW1zIGlmIGJlbGlldmUNCj4gdGhpcyB0aGUgaXNzdWUuDQo+
IA0KPiBNYXR0DQo+IA0KPiA+IC1Kb25hdGhhbiBDYXZpdHQNCj4gPiANCj4gPiA+IA0KPiA+ID4g
TWF0dA0KPiA+ID4gDQo+ID4gPiA+IA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IE1hdHQNCj4gPiA+
ID4gPiANCj4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ICAJc3Bpbi0+YmF0Y2hbYisrXSA9IE1J
X0NPTkRfQkFUQ0hfQlVGRkVSX0VORCB8IE1JX0RPX0NPTVBBUkUgfCAyOw0KPiA+ID4gPiA+ID4g
IAlzcGluLT5iYXRjaFtiKytdID0gMDsNCj4gPiA+ID4gPiA+ICAJc3Bpbi0+YmF0Y2hbYisrXSA9
IGVuZF9hZGRyOw0KPiA+ID4gPiA+ID4gLS0gDQo+ID4gPiA+ID4gPiAyLjQzLjANCj4gPiA+ID4g
PiA+IA0KPiA+ID4gPiA+IA0KPiA+ID4gDQo+IA0K
