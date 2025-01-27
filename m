Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0DCC02188
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 18:43:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D50110E311;
	Mon, 27 Jan 2025 18:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ViXxpyrL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7998710E5B1
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 18:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738003436; x=1769539436;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BAAozZZEyBPyd8oc2xg50Mj26GpChiKib2PTfq3eeeA=;
 b=ViXxpyrLp55vhoyiuwsQSQ0a8eIPFIWHclW1vbQO5ozsTUDpH7l9QZXe
 juQV3J1YAcwT+lRBFlfqEGnQCFhhqA4O7+igjfw4rcpIeWmuY4lZMA4Fk
 v7dya0KOOZQQCkJuMgilCmjt7mhP+g1Hidk8oMp7OznXoC6fmrM206nwI
 bqsiPC/yFEYcbU9UnCF8m+ZlLKFWynvlT3PONiX27DBRR5QX1XCffPGd4
 nSxo4b8V2Jwd5z3woRTHxAjjNjKo0P0w5j19vGGct7H2rWrvJBnCz/Eg0
 xcj1YwPeQoU3jSQIPtbywOAeoeqe2al1YBCOxGucXjke7eq4+EH34t+wf w==;
X-CSE-ConnectionGUID: r+nXGuu+RU+1zQv63g7HCw==
X-CSE-MsgGUID: pJcppJy7Rc2bTDcDyhT/Kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="56017305"
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; d="scan'208";a="56017305"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 10:43:55 -0800
X-CSE-ConnectionGUID: BjhtcjjoS8ypuWpRPYPkoA==
X-CSE-MsgGUID: Hi3UHbTMSRKExUNzmmMEpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; d="scan'208";a="113553197"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jan 2025 10:43:54 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 10:43:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 10:43:54 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 10:43:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OgOuTFMnjT03eUgdcU0aunSuXdxOMhd9waJOLb9kCPmlIOf0lfUnu+Na+lAZ7mKQqfjlstlJGAhWHrT+OgcipIt4iu8xz3jpNbY3eBPsM0ykqqBDlfHBp+322pw2+MvMH/BivtBzIcDyGj+B800Ox30MWcIWBDBjGS9JNTmt3WJE3jxE+2U/p6xLVa5RprC/hBeLPpeCQx0+VtYC30AHYiDluLJKgFOT31TVz9lT8QZzY0HqFZx7P5hNpvww2fJ/GTAuDzNSYnqo9WTl4gbCP/sW1e11WAaRHL2rxX8JvanA7wGb4ZChcr5UNo2jr+PL3Mc/AOF5hFGWkFl/kSpjqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BAAozZZEyBPyd8oc2xg50Mj26GpChiKib2PTfq3eeeA=;
 b=Tf7zrSJNxJy97xyGUVVyCDMfjucJc6RB0jJx/Hu79QK2dic0MGS4RRMbSN1yV5JoRchBspsm2Z/I22MXpvRvvZIedVXhEoslfOe5A/scY+iw+OqGAg5gZkYXMcoi6oUTEakvsBlhksvwh2q+67ldhW6Vbwioslp9NxsH044VO5sUInbcK1P6vClROM1vpsggajhffutWIWor8LXQSH8oKz8nDozXKZvTFIKIlanoeXgZfXVi3YAM70WIjokH7nSPizCLtoriZt/vF0R4lepX/liVyGNIDHET1gW01od6f8ZgHhcPFVDdZZL1uaeX8xgzaEf61rCjKsY5w2SpQ5deLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CH3PR11MB8495.namprd11.prod.outlook.com (2603:10b6:610:1bd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 18:43:47 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 18:43:47 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Rodrigo.Siqueira@amd.com" <Rodrigo.Siqueira@amd.com>, "Gandi, Ramadevi"
 <ramadevi.gandi@intel.com>, "Knop, Ryszard" <ryszard.knop@intel.com>,
 "Lattannavar, Sameer" <sameer.lattannavar@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Saarinen, Jani" <jani.saarinen@intel.com>,
 "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Taylor, Clinton A"
 <clinton.a.taylor@intel.com>, "Yu, Jianshui" <jianshui.yu@intel.com>,
 "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t v3 1/2] lib/igt_kmemleak: library to interact with
 kmemleak
Thread-Topic: [PATCH i-g-t v3 1/2] lib/igt_kmemleak: library to interact with
 kmemleak
Thread-Index: AQHbcNGf/MqtXVY3uUyo+RWQOrC3m7Mqz98AgAAKPwCAABrB8A==
Date: Mon, 27 Jan 2025 18:43:46 +0000
Message-ID: <CH0PR11MB544434A758CB7B4B4C077274E5EC2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250121112944.115491-1-peter.senna@linux.intel.com>
 <20250127152813.293529-1-peter.senna@linux.intel.com>
 <20250127152813.293529-2-peter.senna@linux.intel.com>
 <CH0PR11MB5444D075498A1D44B88C7230E5EC2@CH0PR11MB5444.namprd11.prod.outlook.com>
 <a01835c3-346c-4718-beeb-3b819897c827@linux.intel.com>
In-Reply-To: <a01835c3-346c-4718-beeb-3b819897c827@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CH3PR11MB8495:EE_
x-ms-office365-filtering-correlation-id: 1d288e3d-ec99-4f42-1577-08dd3f028887
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YXNLQUFxek1BWnROZm8vMzN2MDlyeDJQakpPalkyUVlGMEJ3M1BVNVN0QnNt?=
 =?utf-8?B?TFNNSVJjTDloTzcyWlpiQnpnT0pkbEFtTWZkQ1c3clBqRHJyQ213RTNjV3li?=
 =?utf-8?B?c05vSURBMnpqdmdvOUFmUVUwelVUa0pTVXUwcE5UV0VCbzBnMExON1JUbzNI?=
 =?utf-8?B?ZjFwMkNMV2thaDI3T1FCY2FLd3lZbURvSG9JWG1NZnF3MGVyVzE0UG9PY1ND?=
 =?utf-8?B?R0hqdGFGOXBRVm1hMzY1RlJiVXJONEx1azNGMDZoTnEyUERNZWlSNXhlayto?=
 =?utf-8?B?UVR6K2plTDJBNWxTcUVqVXlVb2tZVGUvTFgwZG9oeE05RVN3MDJSNW9XM1hR?=
 =?utf-8?B?UmlWOVVVQUhrcHhwTDBUd2E5cFpTamRVR1FldjFkOStVWlorOWVhR3NMUWVp?=
 =?utf-8?B?bGtpb05mNGRPcmMxNkVTeCtCNEMvVWx3YVlnYktJUkFmNkwwYU5iVDZhT3lM?=
 =?utf-8?B?MWZxdVZqeEVRTmdKdXdMTnYyL3MzdklGTmZjbHZIbmo3ZnNJNXFFb0szUC9t?=
 =?utf-8?B?azcrSDEwQXNzRFpGczRCL2RRWTJTM3FkL2h3WjJYYXQyZHZxa1gvUy9WckhH?=
 =?utf-8?B?eDYrdFVHT0JjM3FSbXM0TXpPS201cEU0M09jS1dkajRZclhXQ1JDQmJmam4w?=
 =?utf-8?B?dFd6bCtOQVFtTnVqdWVnV1RDb3VtNkxmQm8vTFpxcjFWTkx1NmVmaTJZQ2dn?=
 =?utf-8?B?NEIwREN5ZzlGeUFHQ0tnaWhWMndSQm56RFg0d0FUWlU1RENNVTdMZ1c1ajV2?=
 =?utf-8?B?N0gxbHF1dVlnU3VZQ1dhWUdsS3NTY1RRRjBCaVJXVmh6T0ZjNy9IaFFrM1pF?=
 =?utf-8?B?ZjlOc0xybW1Ya01iNUh6VDYrVHQ5Z3BIMzNNM2U2aW5KbUJmVzZPb3RqTWdm?=
 =?utf-8?B?L1hiV1B4cmtndEh2TWN0UVYrelNMZjkxeTBTVXRWMjd3K3Nud3gzK2gyYytt?=
 =?utf-8?B?OVFNK2s4NzJkcWdpWnR1SXUyWUNET1NkekZXb2JuRkp6eU5mK1J4V3QwVHUy?=
 =?utf-8?B?Rm5FeHQ2Vlc2RWp0djVndStnNDJNUjVNT3NvRlF5WFlvU2dQeExlSVlYWmIr?=
 =?utf-8?B?emtnYkdTb0E0aFo3d0cvQnM5US9vMWxxS3hSWSs0L3BDSThUNGZYMGdxbXdD?=
 =?utf-8?B?V3RuVEdpaE5nOFRTTEJVd3h4MWdzbHBPTENleExQT29DRmN5bldCZlZrYW5n?=
 =?utf-8?B?NkM4S3NuYTFHcHAzdytocTRJalRGRTdnWXFTdlpIajNTN0hIQ2Nuc3VFbDkw?=
 =?utf-8?B?MEdqWm5vSkpLM1VYRzZmUUkzS1hzL1RRSEhOTFRSMys1NmIvaVZiVC9wSlA1?=
 =?utf-8?B?Mi95VjRnQTBzTjA3dkhxeXh4ajQ4TFJNVzE1RDZuUEpHd2ZydWNBUFNnZHVG?=
 =?utf-8?B?ZjBiejM2bnNqcWxoWFAzemZPajlhZUQrVnJ6UCt3aVRiOHBKOHd1aU8xOG5j?=
 =?utf-8?B?MWdHU2Rqc2ZEeldtdkl6b1VDNGNhRUZtOEVJVFpIOUsxNUl1QlVCallRUzZt?=
 =?utf-8?B?UmFmQU5hM21oMno4WHlIK3MyMlRMaHRXakMvRm1YdmZFM05WWXdHaVFabis2?=
 =?utf-8?B?UDhIU2h1TitSNGFQallmKzFoNmxvcjJvN2c3Z0NEVmhySVNRcmg3SitIZDNt?=
 =?utf-8?B?Ni9ZUG1HeUtJZnl4d3gvRkdxWHpSM1dCVEw4RXBJWnpObXZmOVZsY1kyVkhE?=
 =?utf-8?B?eXQ4QmkxcjExR0xJUlZvUW5aY0l0K0wveit1c0RVY2pBU1NyREowWnFuc2Zn?=
 =?utf-8?B?Ry9kR2RGUnNFN2dXY3hTYlBldUp1RUlJN0JBZ01zandpOU1tc3VQQUhNK29U?=
 =?utf-8?B?Q0IyVTk4Sm5VSXp6VjFJU3BPYnZHMG9SUFQyU3pQajdFTmROVTFvRXVCUzhn?=
 =?utf-8?B?MFk4M0pKMmpBYkJheENiTFF3WUtCbEFPRWM0SEJJOGUyU1h5dExWY2thZGJz?=
 =?utf-8?Q?ZYf5+GW7SzrGTL/HpmY37C76IQ4rgslN?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YWsvY3NteGtqOG9kbDV2NngyV3BrNUZNYnM4VW5yblRXRldQR3lWck15ZVhZ?=
 =?utf-8?B?Qlg1a01UV2k2Y2FmQW1xbnhUajBpRnk4THVhcmc4SUdIaGYwb00xYmtOOTdB?=
 =?utf-8?B?U3FQK2p4MlJOZlNqdkY0NFB3ei80Ymh1ZzlTMFFKWTZrWHQyNVFZK3Y4Z1l4?=
 =?utf-8?B?akxPdlhPVXg5N3R3YlRMalM5TnB6amtXeTcyWlRKNVhtVHpuVWZCam02MlNN?=
 =?utf-8?B?c1N6dFZmSTZGaHpyZGlGNmc0eDZMT3JaUDE3Q1IzcG03cUVMSWJWOXNQQ1JY?=
 =?utf-8?B?cUROVnk4azgvdTF0LzRMNWhNZ2FXdUFyOXluUVZ6c0t2UGFvb0VRZWM1Q2VC?=
 =?utf-8?B?cFBkYkE5aVlkZjdDc0ZBaS95eitGTyszYnRSSzVrMWozYzlJSXN4ZUc5NlRv?=
 =?utf-8?B?UGVwT3VSQkYzWDJ5NHdaU1pSdEo5b2VQUWFZME5ibjNoOGFYVXdQN2tGVTQv?=
 =?utf-8?B?bzZDOHZjbmczdE41cGliREpZRUVORWR1OHY1VmRodFhrVEVmdnppQ2ljc2xB?=
 =?utf-8?B?ZXA2YkovZGFCYTBPb1JLWkJEZjNqWnd3TTNwdXdWTnZiall5dFNVancyZG5U?=
 =?utf-8?B?L1F2T1pxSnpKck1OUkowdmhOcWZqUHRqZ3VDbk85d0ZCbEpaeEYvZ0hkM3By?=
 =?utf-8?B?ejVkL1FFcThnazFlZTI3ZS8yaXQ2c01ldWZ1UHdUOFQ4ZGI3T1FtZ2psa3A1?=
 =?utf-8?B?R3JLWjR3TFJLZHRMNS90T1lraXZxamhMOVpmaG5DQTZRQ2dldHE3Wld6TWxs?=
 =?utf-8?B?ZzBlU3I0UmVUR1phSnFJRTA3ck91TjNSbTZTYWpWSmpSMWVHTzJ0SmRRc250?=
 =?utf-8?B?Z0d1QTlDS0Y0LzZuYUZ6MVRFS244QmlaV0hHLys1bzlVYnBsSFdlTnZuT25K?=
 =?utf-8?B?Z3ZqcU1jcVI0RHVKeUdUUis4OWxpMW5raTJwWTlxU0FSdUIzTDZRaVQ1aHdQ?=
 =?utf-8?B?WThMYUdoaVd3OGhWTGwvcS84aXprZm1oMDhpamlCNEJOR0FsZGVybUdRbmZw?=
 =?utf-8?B?YUNXQlpPNGRmb0l1VENLb0dZZXZVaHlUMWVnSnlLL1FmWHBISWZOSjFpcU4r?=
 =?utf-8?B?NklHd2dvTWlZRStuNEpVaVhSN21zMVU2Q2lpZGhuZk1NcTRjcGhMT2EybzFD?=
 =?utf-8?B?NXV5L0Y1YkwxQjNMdGxjVVIvaVJja21UUnZEbGorU1hja2dJTFhTdVU5RHB5?=
 =?utf-8?B?Q0pHM1ovZk9aRlRnb2RpNHJCWWV4YkxPaGcrN2Y2Vktsb282dzVkaU5TcCtl?=
 =?utf-8?B?Vko5aXhkYklCelV6UlhQQWNxeXVOeXl2V3p5UzNIQTAvUGlQUlZYdnV4UWhC?=
 =?utf-8?B?TmVRcWZIc2ZEOHhSTXI2akVBSG90Y0lqSTAzazdwOXBBV3pLQ3JuKzBMdTN5?=
 =?utf-8?B?OUtYQU9kYkpmeHFpcEdWakhNMzNvK240cGhVK0xRa083MVZ5V0kwb0JQVnh5?=
 =?utf-8?B?dWpySmE4R0FBemVQOEZvSnBUVitRa2tGVjZSVVRtdm40NDhhUzYzZWhGYzNO?=
 =?utf-8?B?NDlTTWdQYWF5cENsTURTZGJKa1NOaGloZEh5NGJjajRSMXlUS0hYcVI1OU9C?=
 =?utf-8?B?OGhkaHAxOVZTQkQ0a1BTN1kyVkNmTVRrL1FEWnFyMWVaVVNhU1dIRnc1aDFi?=
 =?utf-8?B?eGx6TXNiWVF0OTVZWFAwS2RDcC9VQWtXMkYyQ3Q3c254RUdoVUh2V2lhUUg0?=
 =?utf-8?B?ZjdsY0dDWGRTUWpHdHFsZjlET2FNQ1Q4cmNNazlpTVlEc3pNOEpPcE55cWhh?=
 =?utf-8?B?UGsrbVpWMVlqclFLdi9iQWo2T21Kc09Ya3R1aTJYRDhxVHhsMzF0TDA4VnVQ?=
 =?utf-8?B?MDArNTNUazNJTXluaG9BQjNzd3M1RVNEOW1GM2k1SkF5aVUzd0JtU0xhdXNX?=
 =?utf-8?B?bDZSUFdNQmtTNnE2TjZ1cjBoMmF0YTNvYzhmQXg0RWs1T1AyRG11WThSRERQ?=
 =?utf-8?B?MjJiaHpHYlFsY2gyM2NyaHhxL1B2Z1MvVVppeitEakM4WTk5UHp3Z1F2dCt4?=
 =?utf-8?B?Q3lCd1J1KzB0TGhpVzZsNFYvbWJYbGdQalRySVVxWlFvT3kxK0RycEx4eVJM?=
 =?utf-8?B?T3NpV3FpdTF1SFdQcFZkQkZmUGVLbFBYYVJWOWdrYzl6R29jUjdhbW5MUkN4?=
 =?utf-8?Q?8uW/OHPxN0Tlhu8fpcIjCFc2d?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d288e3d-ec99-4f42-1577-08dd3f028887
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2025 18:43:46.9367 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FEp6+/A1X8q+EVjuhatrM/KUb/1/deLWBH5UpxYv36e+CAuWv6e5gGPlMwZJGJM7dWODpaOZzX4wrGhoQ3wFQM/aOszNvXa6A/B4Qpt0nl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8495
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFBldGVyIFNlbm5hIFRzY2h1ZGluIDxw
ZXRlci5zZW5uYUBsaW51eC5pbnRlbC5jb20+IA0KU2VudDogTW9uZGF5LCBKYW51YXJ5IDI3LCAy
MDI1IDk6MDcgQU0NClRvOiBDYXZpdHQsIEpvbmF0aGFuIDxqb25hdGhhbi5jYXZpdHRAaW50ZWwu
Y29tPjsgaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBSb2RyaWdvLlNpcXVlaXJh
QGFtZC5jb207IEdhbmRpLCBSYW1hZGV2aSA8cmFtYWRldmkuZ2FuZGlAaW50ZWwuY29tPjsgS25v
cCwgUnlzemFyZCA8cnlzemFyZC5rbm9wQGludGVsLmNvbT47IExhdHRhbm5hdmFyLCBTYW1lZXIg
PHNhbWVlci5sYXR0YW5uYXZhckBpbnRlbC5jb20+OyBEZSBNYXJjaGksIEx1Y2FzIDxsdWNhcy5k
ZW1hcmNoaUBpbnRlbC5jb20+OyBTYWFyaW5lbiwgSmFuaSA8amFuaS5zYWFyaW5lbkBpbnRlbC5j
b20+OyBQaWVjaWVsc2thLCBLYXRhcnp5bmEgPGthdGFyenluYS5waWVjaWVsc2thQGludGVsLmNv
bT47IFJvcGVyLCBNYXR0aGV3IEQgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+OyBUYXlsb3Is
IENsaW50b24gQSA8Y2xpbnRvbi5hLnRheWxvckBpbnRlbC5jb20+OyBZdSwgSmlhbnNodWkgPGpp
YW5zaHVpLnl1QGludGVsLmNvbT47IFZpdmVrYW5hbmRhbiwgQmFsYXN1YnJhbWFuaSA8YmFsYXN1
YnJhbWFuaS52aXZla2FuYW5kYW5AaW50ZWwuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSCBpLWct
dCB2MyAxLzJdIGxpYi9pZ3Rfa21lbWxlYWs6IGxpYnJhcnkgdG8gaW50ZXJhY3Qgd2l0aCBrbWVt
bGVhaw0KPiBPbiAyNy4wMS4yMDI1IDE3OjM4LCBDYXZpdHQsIEpvbmF0aGFuIHdyb3RlOg0KPiA+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogUGV0ZXIgU2VubmEgVHNjaHVk
aW4gPHBldGVyLnNlbm5hQGxpbnV4LmludGVsLmNvbT4gDQo+ID4gU2VudDogTW9uZGF5LCBKYW51
YXJ5IDI3LCAyMDI1IDc6MjggQU0NCj4gPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCj4gPiBDYzogUGV0ZXIgU2VubmEgVHNjaHVkaW4gPHBldGVyLnNlbm5hQGxpbnV4LmludGVs
LmNvbT47IFJvZHJpZ28uU2lxdWVpcmFAYW1kLmNvbTsgR2FuZGksIFJhbWFkZXZpIDxyYW1hZGV2
aS5nYW5kaUBpbnRlbC5jb20+OyBLbm9wLCBSeXN6YXJkIDxyeXN6YXJkLmtub3BAaW50ZWwuY29t
PjsgTGF0dGFubmF2YXIsIFNhbWVlciA8c2FtZWVyLmxhdHRhbm5hdmFyQGludGVsLmNvbT47IERl
IE1hcmNoaSwgTHVjYXMgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT47IFNhYXJpbmVuLCBKYW5p
IDxqYW5pLnNhYXJpbmVuQGludGVsLmNvbT47IFBpZWNpZWxza2EsIEthdGFyenluYSA8a2F0YXJ6
eW5hLnBpZWNpZWxza2FAaW50ZWwuY29tPjsgUm9wZXIsIE1hdHRoZXcgRCA8bWF0dGhldy5kLnJv
cGVyQGludGVsLmNvbT47IFRheWxvciwgQ2xpbnRvbiBBIDxjbGludG9uLmEudGF5bG9yQGludGVs
LmNvbT47IFl1LCBKaWFuc2h1aSA8amlhbnNodWkueXVAaW50ZWwuY29tPjsgVml2ZWthbmFuZGFu
LCBCYWxhc3VicmFtYW5pIDxiYWxhc3VicmFtYW5pLnZpdmVrYW5hbmRhbkBpbnRlbC5jb20+OyBD
YXZpdHQsIEpvbmF0aGFuIDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPg0KPiA+IFN1YmplY3Q6
IFtQQVRDSCBpLWctdCB2MyAxLzJdIGxpYi9pZ3Rfa21lbWxlYWs6IGxpYnJhcnkgdG8gaW50ZXJh
Y3Qgd2l0aCBrbWVtbGVhaw0KPiA+Pg0KPiA+PiBBZGRzIGEgc2ltcGxlIGxpYnJhcnkgZm9yIGlu
dGVyYWN0aW5nIHdpdGgga21lbWxlYWsgYW5kIGFkZA0KPiA+PiB1bml0IHRlc3RpbmcgZm9yIHRo
ZSBsaWJyYXJ5LiBUaGVyZSBhcmUgdHdvIG1vZGVzIGludGVuZGVkIHRvDQo+ID4+IGludGVncmF0
ZSB3aXRoIGlndF9ydW5uZXI6DQo+ID4+IC0gb25jZTogY29sbGVjdCBrbWVtbGVha3MgYWZ0ZXIg
YWxsIHRlc3QgY29tcGxldGVkDQo+ID4+IC0gZWFjaDogY29sbGVjdCBrbWVtbGVha3MgYWZ0ZXIg
ZWFjaGIgdGVzdCBjb21wbGV0ZXMNCj4gPj4NCj4gPj4gVG8gdXNlIHRoZSBsaWJyYXJ5IGluY2x1
ZGUgImlndF9rbWVtbGVhay5oIiwgY2FsbA0KPiA+PiBpZ3Rfa21lbWxlYWtfaW5pdChOVUxMKSB0
byBjaGVjayBpZiBrbWVtbGVhayBpcyBlbmFibGVkIGFuZCBmaW5hbGx5DQo+ID4+IGNhbGwgaWd0
X2ttZW1sZWFrKCkgdG8gY29sbGVjdCBrbWVtbGVha3MuIGlndF9rbWVtbGVhaygpIGV4cGVjdCB0
aGUNCj4gPj4gZm9sbG93aW5nIGFyZ3VtZW50czoNCj4gPj4gICAtIGNvbnN0IGNoYXIgKmxhc3Rf
dGVzdDogTmFtZSBvZiB0aGUgbGFzdCBsZXN0IG9yIE5VTEwNCj4gPj4gICAtIGludCByZXNkaXJm
ZDogZmlsZSBkZXNjcmlwdG9yIG9mIHRoZSByZXN1bHRzIGRpcmVjdG9yeQ0KPiA+PiAgIC0gYm9v
bCBrbWVtbGVha19lYWNoOiBBcmUgd2Ugc2Nhbm5pbmcgb25jZSBvciBzY2FubmluZyBhZnRlcg0K
PiA+PiAgICAgZWFjaCB0ZXN0Pw0KPiA+PiAgIC0gYm9vbCBzeW5jOiBzeW5jIGFmdGVyIGVhY2gg
d3JpdGU/DQo+ID4+DQo+ID4+IENDOiBSb2RyaWdvLlNpcXVlaXJhQGFtZC5jb20NCj4gPj4gQ0M6
IHJhbWFkZXZpLmdhbmRpQGludGVsLmNvbQ0KPiA+PiBDQzogcnlzemFyZC5rbm9wQGludGVsLmNv
bQ0KPiA+PiBDQzogc2FtZWVyLmxhdHRhbm5hdmFyQGludGVsLmNvbQ0KPiA+PiBDQzogbHVjYXMu
ZGVtYXJjaGlAaW50ZWwuY29tDQo+ID4+IENDOiBqYW5pLnNhYXJpbmVuQGludGVsLmNvbQ0KPiA+
PiBDQzoga2F0YXJ6eW5hLnBpZWNpZWxza2FAaW50ZWwuY29tDQo+ID4+IENDOiBtYXR0aGV3LmQu
cm9wZXJAaW50ZWwuY29tDQo+ID4+IENDOiBjbGludG9uLmEudGF5bG9yQGludGVsLmNvbQ0KPiA+
PiBDQzogamlhbnNodWkueXVAaW50ZWwuY29tDQo+ID4+IENDOiBiYWxhc3VicmFtYW5pLnZpdmVr
YW5hbmRhbkBpbnRlbC5jb20NCj4gPj4NCj4gPj4gUmV2aWV3ZWQtYnk6IGpvbmF0aGFuLmNhdml0
dEBpbnRlbC5jb20NCj4gPiANCj4gPiBNeSByZXZpZXdlZC1ieSBzdGlsbCBzdGFuZHMsIHRob3Vn
aCBJIGhhdmUgYSBOSVQvY29uY2VybiBiZWxvdzoNCj4gPiANCj4gPj4gU2lnbmVkLW9mZi1ieTog
UGV0ZXIgU2VubmEgVHNjaHVkaW4gPHBldGVyLnNlbm5hQGxpbnV4LmludGVsLmNvbT4NCj4gPj4g
LS0tDQo+ID4+ICBsaWIvaWd0X2ttZW1sZWFrLmMgICAgICAgfCAyNzQgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4+ICBsaWIvaWd0X2ttZW1sZWFrLmggICAgICAg
fCAgMTYgKysrDQo+ID4+ICBsaWIvbWVzb24uYnVpbGQgICAgICAgICAgfCAgIDEgKw0KPiA+PiAg
bGliL3Rlc3RzL2lndF9rbWVtbGVhay5jIHwgMjY3ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrDQo+ID4+ICBsaWIvdGVzdHMvbWVzb24uYnVpbGQgICAgfCAgIDEgKw0KPiA+
PiAgNSBmaWxlcyBjaGFuZ2VkLCA1NTkgaW5zZXJ0aW9ucygrKQ0KPiA+PiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGxpYi9pZ3Rfa21lbWxlYWsuYw0KPiA+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGxpYi9p
Z3Rfa21lbWxlYWsuaA0KPiA+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGxpYi90ZXN0cy9pZ3Rfa21l
bWxlYWsuYw0KPiA+Pg0KPiA+IA0KPiA+IFsuLi5dDQo+ID4gDQo+ID4+ICsNCj4gPj4gKwlpZ3Rf
c3VidGVzdF9ncm91cCB7DQo+ID4+ICsJCWlndF9zdWJ0ZXN0KCJ0ZXN0X2lndF9rbWVtbGVha19v
bmNlIikNCj4gPj4gKwkJCWlndF9hc3NlcnQoaWd0X2ttZW1sZWFrKE5VTEwsIHJlc2RpcmZkLCBm
YWxzZSwgZmFsc2UpKTsNCj4gPj4gKw0KPiA+PiArCQlpZ3Rfc3VidGVzdCgidGVzdF9pZ3Rfa21l
bWxlYWtfZWFjaCIpIHsNCj4gPj4gKwkJCWlndF9hc3NlcnQoaWd0X2ttZW1sZWFrKCJ0ZXN0X25h
bWVfMSIsIHJlc2RpcmZkLA0KPiA+PiArCQkJCQkJdHJ1ZSwgZmFsc2UpKTsNCj4gPj4gKwkJCWln
dF9hc3NlcnQoaWd0X2ttZW1sZWFrKCJ0ZXN0X25hbWVfMiIsIHJlc2RpcmZkLA0KPiA+PiArCQkJ
CQkJdHJ1ZSwgZmFsc2UpKTsNCj4gPj4gKwkJCWlndF9hc3NlcnQoaWd0X2ttZW1sZWFrKCJ0ZXN0
X25hbWVfMyIsIHJlc2RpcmZkLA0KPiA+PiArCQkJCQkJdHJ1ZSwgZmFsc2UpKTsNCj4gPiANCj4g
PiBOSVQ6DQo+ID4gSUlSQywgaW4gdGhlIGZpcnN0IHJldmlzaW9uIG9mIHRoZXNlIHRlc3RzLCB3
aGVuIGlndF9rbWVtbGVha19pbml0IHdhcyBpbiBjaGFyZ2Ugb2YgdGhlIHN5bmMNCj4gPiB2YWx1
ZSwgd2Ugd2VyZSBwYXNzaW5nIGEgdmFsdWUgb2YgInRydWUiIGZvciBzeW5jLiAgV2FzIHRoYXQg
aW1wb3J0YW50IHRvIHByZXNlcnZlLCBvciBpcyBpdA0KPiA+IGFjY2VwdGFibGUgdG8gcGFzcyBm
YWxzZSBoZXJlIGFzIHdlIGRvIGN1cnJlbnRseT8NCj4gDQo+IEkgYW0gaG9uZXN0bHkgbm90IHN1
cmUuIFVuaXQgdGVzdGluZyB1c2VzIGZpbGVzIHRoYXQgYXJlIGxpa2VseSB0byBleGlzdHMgb25s
eSBpbiBtZW1vcnkNCj4gdGhhbmtzIHRvIHRtcGZzLiBTbyBjYWxscyB0byBzeW5jIGFyZSB1bmxp
a2VseSB0byBtYWtlIGFueSBwcmFjdGljYWwgZGlmZmVyZW5jZS4gVGhlIGRvd25zaWRlDQo+IHNl
ZW1zIHRvIGJlIHRoYXQgdGhlcmUgYXJlIGJsb2NrcyBvZiBkZWFkIGNvZGUgdGhhdCB3aWxsIG5l
dmVyIGJlIHRlc3RlZCBiZWNhdXNlIG9mIHRob3NlDQo+ICdmYWxzZScgZmxhZ3MuDQo+IA0KPiBJ
dCBkb2VzIG5vdCBzZWVtIHRvIGJlIGEgYmlnIGRlYWwgZm9yIHRoZSBjb2RlIGFzIGlzIG5vdywg
YnV0IGRvZXMgbm90IGZlZWwgcmlnaHQgbG9va2luZw0KPiBmb3J3YXJkLiBJIGhhdmUgZW5vdWdo
IGZvciBhIG5ldyByZXZpc2lvbjoNCj4gLSBJIG1hZGUgYSByb3lhbCBtZXNzIHRvZGF5IHRyeWlu
ZyB0byBjYXRjaCBQYXRjaHdvcmsncyBhdHRlbnRpb246IGxhc3QgcGF0Y2ggb2YgdjMgc3RpbGwN
Cj4gICBzYXlzIHYyIHJlc2VuZC4NCj4gLSBJIHdpbGwgdXNlIHRoZSBwcm9wZXIgUmV2aWV3ZWQt
YnkgdGFnIHdpdGggbmFtZSBhbmQgZW1haWwNCj4gLSBJIHdpbGwgYWRkIHRoZSBjb21tYSBiYWNr
IGFmdGVyICJyZXN1bHRzLXBhdGgiDQo+IC0gSSB3aWxsIGNoYW5nZSB1bml0IHRlc3RpbmcgdG8g
dXNlIGJvdGggdHJ1ZSAqYW5kKiBmYWxzZSBmb3Igc3luYw0KPiANCj4gTGV0IG1lIGtub3cgaWYg
eW91IHdhbnQgYW55IG90aGVyIGNoYW5nZS4gSSB3aWxsIGdpdmUgdGltZSBmb3Igb3RoZXJzIHRv
IHJldmlldyBhcyB3ZWxsIGJlZm9yZQ0KPiBzZW5kaW5nIHY0Li4uDQoNClRoYXQncyBzdWZmaWNp
ZW50IGZyb20gbXkgZW5kLCBidXQgaWYgSSBjYXRjaCBvciB0aGluayBvZiBhbnl0aGluZyBpbiB0
aGUgaW50ZXJpbSwgSSdsbCBsZXQgeW91IGtub3cuDQpUaGFuayB5b3UgZm9yIHlvdXIgZWZmb3J0
cy4NCi1Kb25hdGhhbiBDYXZpdHQNCg0KPiANCj4gPiAtSm9uYXRoYW4gQ2F2aXR0DQo+ID4gDQo+
ID4+ICsJCX0NCj4gPj4gKwkJaWd0X2ZpeHR1cmUgew0KPiA+PiArCQkJY2xvc2UocmVzZGlyZmQp
Ow0KPiA+PiArCQl9DQo+ID4+ICsJfQ0KPiA+PiArCWlndF9maXh0dXJlDQo+ID4+ICsJCXVubGlu
a2F0KHJlc2RpcmZkLCBLTUVNTEVBS1JFU0ZJTEVOQU1FLCAwKTsNCj4gPj4gK30NCj4gPj4gZGlm
ZiAtLWdpdCBhL2xpYi90ZXN0cy9tZXNvbi5idWlsZCBiL2xpYi90ZXN0cy9tZXNvbi5idWlsZA0K
PiA+PiBpbmRleCAxY2UxOWY2M2MuLjVjNDI0MDhkNSAxMDA2NDQNCj4gPj4gLS0tIGEvbGliL3Rl
c3RzL21lc29uLmJ1aWxkDQo+ID4+ICsrKyBiL2xpYi90ZXN0cy9tZXNvbi5idWlsZA0KPiA+PiBA
QCAtMTYsNiArMTYsNyBAQCBsaWJfdGVzdHMgPSBbDQo+ID4+ICAgICAgICAgICdpZ3Rfa3RhcF9w
YXJzZXInLA0KPiA+PiAgCSdpZ3RfbGlzdF9vbmx5JywNCj4gPj4gIAknaWd0X2ludmFsaWRfc3Vi
dGVzdF9uYW1lJywNCj4gPj4gKwknaWd0X2ttZW1sZWFrJywNCj4gPj4gIAknaWd0X25lc3Rpbmcn
LA0KPiA+PiAgCSdpZ3Rfbm9fZXhpdCcsDQo+ID4+ICAJJ2lndF9ydW5uZXJjb21tc19wYWNrZXRz
JywNCj4gPj4gLS0gDQo+ID4+IDIuMzQuMQ0KPiA+Pg0KPiA+Pg0KPiANCj4gDQo=
