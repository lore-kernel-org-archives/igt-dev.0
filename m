Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E17AC25B10
	for <igt-dev@archiver.kernel.org>; Thu,  9 May 2024 16:30:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC3C10E011;
	Thu,  9 May 2024 16:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P+u5mgpx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9643210E011
 for <igt-dev@lists.freedesktop.org>; Thu,  9 May 2024 16:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715272251; x=1746808251;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Liwpd0Fz/YitGIsxue5IQ9NZq6scNE1RXW6W+IMx6UY=;
 b=P+u5mgpxzAhH5BMMdNOvvs80Hh7tpj0T9K0I8A2vMpuww0JOICGUq+fo
 ZWjpUlSVVqGpIm7T1crgtZi8T0uf9Mo4wCAcdli8KDdPcWuoJA9Fwlf5n
 OM/GNM7FQ1d6iIIm02skd9OVFDoPYzCZ8Legd/WjJgk3CcQbOVFqDe4WW
 A6C6TXa2+iSNfIzCtdV9zhmrkn0DM3FJTSb0dFjfn2rP81m29sAdXv10J
 iZeg3X7SEpQorXQwxQcu9uWV4CwkHKG7JK3D/x4+1y0/QZ1Iyed1U0Day
 VU+x/Z5imBCvxyPMfjjsZrASf+ar9Vda1l0SL/TcGyfXcPc/4LeB5jy8j A==;
X-CSE-ConnectionGUID: mBaS2afXQAKjIHVQQ0fNrw==
X-CSE-MsgGUID: T5/PwqfIQe2IAH+mFCtZCA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="36586428"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="36586428"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 09:30:50 -0700
X-CSE-ConnectionGUID: x4so0AYqRfml3bDU3rqldw==
X-CSE-MsgGUID: vFN3/lL+SBy2WmdtNBmBzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="33832442"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 May 2024 09:30:50 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 09:30:49 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 09:30:49 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 09:30:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GjElmCTxj6kF9Rj52TfN4tSvy/AfpPSVgv3XHNhqN+G/77H72hBLx+ZO9LW+Ppepr5IpwInqU3li7xXghRlWVCta5W5aaVa0Hd5hdgpZCzZrjY41wz20y2Apjw0QzjmYq214xtG301nk70m6fV5EkdtDDgTEheWroNH+hUumQPufPl+RIBtqeXZ9dkggeYFFs6bPxK3KPuYPFnuvR7UME03P0FHDQrLrhJR9YJJJFNNpf+jPsej/e6HYw0gr/TuKqtDBi+TpMS1FjFUXipb0ef3s4bwJdWwoOA6U/fLdZlpIP8E0gWOwZWIWptimjJGxF9r/+6B7mnlq4BBBKZ2mOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Liwpd0Fz/YitGIsxue5IQ9NZq6scNE1RXW6W+IMx6UY=;
 b=eu8Qjxa9Sbm9hz5y1MaiwYjxlxmHZHd/+kmXg5mfMyE7m71KvXHg8Gk6tK9e6rDQ/cR+Fi52QMFwYzj9l2sp8Oy7k2cwKnUndi01rNJN5Co3sPalYd9GsZIEsCWokVphvAdA6O3+bwXbrVPHDWab8JS2VuWeBfm+uqS7lDm+K02UGoKVpY63/85rFTrpPKH9q19gfaWfrhrZFkoqIhQCxIzuWK2/jpEr4W0vcK5uxtAILgLKK49EOcfy4AcfZmUCZ4oQbYlfPx6aRYhyqSFysvIU6KeisC+evC7iq+Wf94qC3aeR0gPaY16uxWdkHrTtBcLqIhV6325kwZVykEIpUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY5PR11MB6535.namprd11.prod.outlook.com (2603:10b6:930:41::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.48; Thu, 9 May
 2024 16:30:47 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c%4]) with mapi id 15.20.7544.046; Thu, 9 May 2024
 16:30:46 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Welty, Brian"
 <brian.welty@intel.com>, "Mistat, Tomasz" <tomasz.mistat@intel.com>,
 "Girotra, Himanshu" <himanshu.girotra@intel.com>
Subject: RE: [PATCH i-g-t 1/1] lib/xe/xe_query: Wait for xe_supports_faults
Thread-Topic: [PATCH i-g-t 1/1] lib/xe/xe_query: Wait for xe_supports_faults
Thread-Index: AQHaoYESGghttWbDKEG6IfVs9SLdPrGPFqUAgAAAmBA=
Date: Thu, 9 May 2024 16:30:46 +0000
Message-ID: <CH0PR11MB54444239130C8918DA7D8037E5E62@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240508193545.2735209-1-jonathan.cavitt@intel.com>
 <20240508193545.2735209-2-jonathan.cavitt@intel.com>
 <20240509162038.czrttaz6eosznh2c@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20240509162038.czrttaz6eosznh2c@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY5PR11MB6535:EE_
x-ms-office365-filtering-correlation-id: f1f478d7-8255-483b-ca1a-08dc7045615d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?Qm83eURZMG8yNjhDYU1nbkN2ZGs0VkNVU3NhMmhKWnBXN2tkcG9Nby9KcGM3?=
 =?utf-8?B?YW1mSitMYVhKL2xJeG01SEVDaktKSFNuWnpYVGoyL0N2N29vK3EwRjV5MlJu?=
 =?utf-8?B?aUNDc09ueWUwWFgrZEU4b2ZlbGViaC9lak8xOWIxaWs2elpENHVHVk9LK09a?=
 =?utf-8?B?Vlh4ZVR0OTVhLzljTmZZRy9uRnlrYjlsQ2w3NmcyVnFXNWtlb3R3cmx4NVZH?=
 =?utf-8?B?MWJzZUhNcGlmOWVNT0h4MlFtaklsakxGaHoyNFM3eTVsQjlNTmZBR1o3bHJV?=
 =?utf-8?B?cmdsSHp0eVN3OFZ4Z3JGelh1OWlGNkhROHN5N0VpQU16SnZUMzlmS2RlbEhS?=
 =?utf-8?B?WXl6K094YTA1Z3Z6bGJuby9ENXphcGhRSVNlMUVpdmxjVmNHblMrWHNUK2JY?=
 =?utf-8?B?SmtkTlVjSVgwMWZGMWFwNjNCUHRodnl0QktxNmwxcG00NzRpZWJyVG55dURi?=
 =?utf-8?B?T3BGdE1waGJvV1hRTWVLaEJ6dzhmOEVkeVZpSmVCR2lrL1JiVzFhQ1VLczd4?=
 =?utf-8?B?enFpeWxCQXJ1N3UvVWtNZDBoV3FKRkE2U21zU1hQVllsZzI5NFdtWFIveW9L?=
 =?utf-8?B?amRMb3AreEw2dXd2dUY2RDBJa3dpTlNqdXlZZFhaTDlOS0ZMNkVldmluUXFi?=
 =?utf-8?B?cTdEcFU2UXZ4RzlrZjA0bGpQei9hekZWOGhnV2hKLzBRelhST1JaTHZ0M1lv?=
 =?utf-8?B?LzZYQzlEV1R5cFdZcVp1T2R0L3ZxaXJ2dEdrUXM4bW1vV29vdzkxQ0htcjBI?=
 =?utf-8?B?QXFlK2hFWWkrSnVLRGZETkoweXFNaXlxZzd3S01Lc0FqbDNCV2g0UG1WNDNt?=
 =?utf-8?B?Zmd4TVpORkNlQmt1UFRUbFUzUjlmRjUramc3SnBSb2xVdnNBQkhnUmpQdnYy?=
 =?utf-8?B?UmxQRW94ak1Ya2xlcldBL01tbkdITkhEM0tKUHM4RHcxRTJvYkdIdXdqenEv?=
 =?utf-8?B?NXhWNmtBUjc5WTRLcXJvQjVJcStXT0puYnN3ZklYTXhINHZxT04reEcyMmQ1?=
 =?utf-8?B?Z2RiUU9GYTQydFczMllySHhiTUQ1alI5eEtia29sUzRYSkVMQ3lGU0VLK2Jp?=
 =?utf-8?B?ZElxTXg4VVZGeTZIVERkempBbUdSb2tRVFhpK1E0RFlGbDVpa0k3TjZtVnVn?=
 =?utf-8?B?QU52TU1lQmd6T3dCWFN6M1dzamUwc0xUM0lVeTMxejNSdWtKdUV0Q0xvRXlX?=
 =?utf-8?B?U0J0YnYwd2J5UDRxbDVRMVpZOGI4NEZRSDdhVURyUmZsQ00wRlI3RW94ZzIz?=
 =?utf-8?B?ckJWTzRwYXU5MFNJUHBNV0dranQxRHFUMWZpaWNTUlFHTGN0eDErRDg1bldk?=
 =?utf-8?B?NTBGWGUwL0I0VTVnUGpSUjh2QURZSWx3WGJwQUYyK3R4eEk5bVpQWlArYVZW?=
 =?utf-8?B?U0piY2NTN0paWXpONWcwb2dabjdIYVJUWmxoNTdSY3RncG1pWUIyRVlwTzNh?=
 =?utf-8?B?MzZoaElWdXVSTzZ2UkRmYlh6TGdpNHBLbTQ0WmpGRGVCb1Z6QndCYThlbk9T?=
 =?utf-8?B?TCtzTWluWFlvOVVaaVVhTTVWRUpTb2h0cExSaWpYR1RDSzJGVWVLQkVDUC9Y?=
 =?utf-8?B?azFYZzhZWklkenQ4NklDQ085b0NER3ZXVnNPMWtoalBwV0R0dUY3ZXVGbTNL?=
 =?utf-8?B?V1o4TjZzQXpzMHBqMFlOUko2R3N4OTNRQmpnZGVBbFB2UU43cFRFY051cG1z?=
 =?utf-8?B?SEdBOHpwcUgrRmNLZURTUVZmUWdIN2NHc3BLak9jSDJadnBrK3I4dkdGeWNw?=
 =?utf-8?B?WTBWZGpUUURwZ0o1ZUgzTEZLbWliUm5CcUhVMGFHbkFxWDZqNWpIRHh2MGky?=
 =?utf-8?B?dWxwQ0pWWnNqMVdDZ2RCQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bW45QzlTdEh0UDBHVXhaeW9Ic1pwUEFFYlpMUGcya3o0YzhBSXZSSmN1aWYv?=
 =?utf-8?B?VVBSL0tST1h4RnRDZWp4OCs5L1VKNG1DNk96ZVVQNjJUTW4rTXVNQXlzeUZ5?=
 =?utf-8?B?aVp3QlhwNnl2OTdKdnBCR2tFSlEyR0hxV1hpaDlyd2l2UmdWZWIyRUQ3aTZP?=
 =?utf-8?B?MSs5eHc5NXkxbGo1RTNZazZzbzh5dUhlYmtNek9XRktWS1pwaUxUUGlIVFhE?=
 =?utf-8?B?NzRvcnpCT2RDSENCS0plNjVtM0oyWnRRSlQ2S2RXVE1YQ3FrQ3hCSkhITklB?=
 =?utf-8?B?bnVBWkhqNCsvczR0RWNRdDhHRmRVS2JyVTU5ZjBWeFVzWnIySVJXQ0pQelJn?=
 =?utf-8?B?aFZsanJHZnhobVRQeEVmb2xacnlMRmhMbnUyWUVxdUVPVktnK3h5YUVvYXRV?=
 =?utf-8?B?cVhjc0VSZHd1YnhXMjN0MlZHd0Z6NStyUERJSThGcUhvNFQrbjlPaXpoakpj?=
 =?utf-8?B?L3VmTTlUM1k4UTRMRm52Z0NKUlRlQ3pPR2FGbld5Z0ZXazhLQzBhRHNISndO?=
 =?utf-8?B?a2swakx0ZW5VVzA3MTc0ck5oazE5SzhqVjR1OFJBYllWcXFsZ1hwVjFHUGZ1?=
 =?utf-8?B?QmtmR2M0azhTelFoNnhpS3ZFb29uY3ZFNndnVlZlVHIxdE5kaHZIV2drNDdM?=
 =?utf-8?B?NWoyNlhiNUlsNFNiZWxPeVZ5dkgzb1BKaGt3REdhVGJmTW15bE5mWGVxaHBp?=
 =?utf-8?B?U3N1ait4VkdOR1dzbGdZWHBxTUZlbGNubkRXUk5Bc3ZWRUlLbTdnUDV5TDZT?=
 =?utf-8?B?aHdqdFcyOWdYdENlWlh0ZXArdXc0bDQ2cnVBQTFFVzlObU40b1p2N25RSG9D?=
 =?utf-8?B?L1M5bGJONGRjTHVaU0x2RnM3WE9iUnUxNG1kb3hWQ0NFdGM0dEF6TVNvL3g3?=
 =?utf-8?B?VDhlOHZaTmV0bFhkTXBNcDR3dm5MVnYwdFFxMnVWVGJqckREQ2ZZdEIrZEk3?=
 =?utf-8?B?aHR5MDdaNjYrY3BodEs2SUpkMGwrUWRqQzQxbTB5VXVDS0UrNXNoYytFS3pL?=
 =?utf-8?B?RE16b2xOQUFzbVphdkl1eEtCN2ZTUlA0MTZzYm1TejRrQ21qcklsOHlHM3Zr?=
 =?utf-8?B?TUFhYjk1WXd4SXdUamtaVmR6QTZxWk03R3ZLa2RGU0JjRjRHWjkxck10Q2VX?=
 =?utf-8?B?cFVRakZzWTVINHFJS3QvNi9iTjQ4aE5ROW94Z3Y0OTlJRzZOdXcyL1JwOVEx?=
 =?utf-8?B?V2pjVm55eWFJK0RoVDVQR0dmUFlzd1pCSEY4eWt0MzlVWlZoL0FjbXNzN0Jo?=
 =?utf-8?B?V3JRSUwraXY4OXF4V3hUK0lhNEh1aFB6U3NlV0l4dVF6czlKdCtQWHAzbzVZ?=
 =?utf-8?B?bExhajViaTltVjd4VjdnSFo5OCt2U1BNTnB0WXNsaHcyN3loOXNKOVptM0g3?=
 =?utf-8?B?ckZuZHBCSEdzaWg5V3ZMdWtkWTdtQXB0TmtqSUJUK3JZOVpXdmNpc2FaSzNy?=
 =?utf-8?B?VFV3b1ZjRmR1QkNpeSs2NXZObmhBYmlnOEo0ZmVuMUpLVFNocnozcXpPeGR2?=
 =?utf-8?B?S1BLNGE2MTVPR09MK2tpY2JPbFlWZTdpRUwwRFYvdWVLNWw4SjI0eG54M1J3?=
 =?utf-8?B?bGFxbWllWjdGT3VhQ3lxS2RXb3VZVDdFS25OTUk1N1RrL1Rlc3RNU1JoNC8x?=
 =?utf-8?B?bzF6bG5WektHMXNxcmgya1pZY1ZmWjMvblRzTVArekszYXZVMlRlUEdZT0tE?=
 =?utf-8?B?anl1ZllQcWVDdDZZVjZrU0d1a1g2SFJ3TW14bytUZms5cmQ3ckZQTmRpc1Iz?=
 =?utf-8?B?Wkp3UnFuWVY2WnMxUXdaelNOUU05MmtVZmhwV3Jjc3BiTU5rK1Y2QXgxOTlw?=
 =?utf-8?B?SW1rL3ZDTGFkT2pHbnNJdnNPallzZG1kS1VTdzRlVThkY001cC9MUjhtc3BV?=
 =?utf-8?B?ZHdEYWdUYlp5bFdiNTNKRENmMHRVOC9HK0dsTkdRS2d0SjlTRjRBLysxbDY2?=
 =?utf-8?B?UXBGVlB5V3Ewdk1YRWI4ajc2eVNaS3hTWHdSKy9rUmlYYWhZL1ZPMFFQWkZG?=
 =?utf-8?B?YTBaSExiaVRkV0lZN2ZrQWFHbldpRm56YXZJbHVXMTlSM3dKYjBmSnV0azdl?=
 =?utf-8?B?VncyMURmZ3J6NFlrSHp6ZGtVa1YyajlnMXQzanpudVVNbzdoQ3pJbEhlMjM3?=
 =?utf-8?B?TDZScVM3VUhxRWZvSlpDQmU3VXY2dTRUQnVyc1FNRHBPT2QvOVdiMmFJWUZS?=
 =?utf-8?B?OEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f478d7-8255-483b-ca1a-08dc7045615d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2024 16:30:46.8102 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +jJHF3f3+ZVal/zBLQ0XZoSnfLDhfaR6PUbGMQYD6yrfOqEEu8TFH9ndOhVq1gPJHqFDYN1bNJdDBR10s02FwOh6TgCW3Nx8MxrkmPdGxAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6535
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEthbWlsIEtvbmllY3pueSA8a2FtaWwu
a29uaWVjem55QGxpbnV4LmludGVsLmNvbT4gDQpTZW50OiBUaHVyc2RheSwgTWF5IDksIDIwMjQg
OToyMSBBTQ0KVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogQ2F2aXR0LCBK
b25hdGhhbiA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT47IEd1cHRhLCBzYXVyYWJoZyA8c2F1
cmFiaGcuZ3VwdGFAaW50ZWwuY29tPjsgV2VsdHksIEJyaWFuIDxicmlhbi53ZWx0eUBpbnRlbC5j
b20+OyBNaXN0YXQsIFRvbWFzeiA8dG9tYXN6Lm1pc3RhdEBpbnRlbC5jb20+OyBHaXJvdHJhLCBI
aW1hbnNodSA8aGltYW5zaHUuZ2lyb3RyYUBpbnRlbC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENI
IGktZy10IDEvMV0gbGliL3hlL3hlX3F1ZXJ5OiBXYWl0IGZvciB4ZV9zdXBwb3J0c19mYXVsdHMN
Cj4gDQo+IEhpIEpvbmF0aGFuLA0KPiBPbiAyMDI0LTA1LTA4IGF0IDEyOjM1OjQ1IC0wNzAwLCBK
b25hdGhhbiBDYXZpdHQgd3JvdGU6DQo+IA0KPiBjb3VsZCB5b3UgdXBkYXRlIHN1YmplY3Qgb2Yg
dGhlIHBhdGNoPyBPciBzcGxpdCBpdCBpbnRvIHR3bw0KPiBwYXRjaGVzLg0KDQpIb3cgZG9lcyAi
eGU6IENoZWNrIHhlX3N1cHBvcnRzX2ZhdWx0cyBmb3IgRUJVU1kiIHNvdW5kPw0KDQo+IA0KPiA+
IEl0J3MgcG9zc2libGUgZm9yIHhlX3N1cHBvcnRzX2ZhdWx0cyB0byByZXR1cm4gZmFsc2UgaWYg
dGhlIHN5c3RlbSBpcw0KPiA+IGJ1c3kgd2l0aCBtdWx0aXBsZSBydW5uaW5nIHRlc3RzLiAgVGhp
cyBpcyBiZWNhdXNlIHRoZSBjaGVjayBsb29rcyBmb3INCj4gPiBhbGwgYWN0aXZlIFZNcyBhbmQg
c2VhcmNoZXMgZm9yIFZNcyB0aGF0IGRvIG5vdCBoYXZlIGZhdWx0cyBlbmFibGVkLA0KPiA+IHJl
dHVybmluZyBmYWxzZSBpZiBhbnkgZXhpc3QuICBSZWNlbnRseSwgdGhpcyBjaGVjayBoYXMgYmVl
biBjaGFuZ2VkIHRvDQo+ID4gcmV0dXJuIEVCVVNZIHdoZW4gdGhlIGNoZWNrIGZhaWxzIGluIHRo
aXMgd2F5LCBzbyB3YWl0IGZvciB1cCB0byB0ZW4NCj4gPiBzZWNvbmRzIGZvciBhbGwgdGhlIGFj
dGl2ZSBWTXMgdG8gZmx1c2ggb3V0IGJlZm9yZSBwcm9jZWVkaW5nLg0KPiA+IA0KPiA+IFN1Z2dl
c3RlZC1ieTogQnJpYW4gV2VsdHkgPGJyaWFuLndlbHR5QGludGVsLmNvbT4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBKb25hdGhhbiBDYXZpdHQgPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+DQo+ID4g
LS0tDQo+ID4gIGxpYi94ZS94ZV9xdWVyeS5jICAgICAgICAgICAgICAgIHwgMTUgKysrKysrKyst
LS0tLS0tDQo+ID4gIGxpYi94ZS94ZV9xdWVyeS5oICAgICAgICAgICAgICAgIHwgIDIgKy0NCj4g
PiAgdGVzdHMvaW50ZWwveGVfZXhlY19mYXVsdF9tb2RlLmMgfCAgOSArKysrKysrKy0NCj4gPiAg
MyBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPiA+IA0K
PiA+IGRpZmYgLS1naXQgYS9saWIveGUveGVfcXVlcnkuYyBiL2xpYi94ZS94ZV9xdWVyeS5jDQo+
ID4gaW5kZXggNmRmOGY0MjY0OS4uMTQ1ZGVlODE0MiAxMDA2NDQNCj4gPiAtLS0gYS9saWIveGUv
eGVfcXVlcnkuYw0KPiA+ICsrKyBiL2xpYi94ZS94ZV9xdWVyeS5jDQo+ID4gQEAgLTMwMCwyNyAr
MzAwLDI4IEBAIHZvaWQgeGVfZGV2aWNlX3B1dChpbnQgZmQpDQo+ID4gICAqIHhlX3N1cHBvcnRz
X2ZhdWx0czoNCj4gPiAgICogQGZkOiB4ZSBkZXZpY2UgZmQNCj4gPiAgICoNCj4gPiAtICogUmV0
dXJucyB0cnVlIGlmIHhlIGRldmljZSBAZmQgYWxsb3dzIGNyZWF0aW5nIHZtIGluIGZhdWx0IG1v
ZGUgb3RoZXJ3aXNlDQo+ID4gLSAqIGZhbHNlLg0KPiA+ICsgKiBSZXR1cm5zIHRoZSByZXR1cm4g
dmFsdWUgb2YgdGhlIGlvY3RsLiAgVGhpcyBjYW4gZWl0aGVyIGJlIDAgaWYgdGhlDQo+ID4gKyAq
IHhlIGRldmljZSBAZmQgYWxsb3dzIGNyZWF0aW5nIGEgdm0gaW4gZmF1bHQgbW9kZSwgb3IgYW4g
ZXJyb3IgdmFsdWUNCj4gPiArICogaWYgaXQgZG9lcyBub3QuDQo+IA0KPiBJdCBpcyBub3QgY29u
c2lzdGVudCB3aXRoIHlvdXIgZGVzY3JpcHRpb24gYWJvdmUsIGFzIHlvdSBjYW4gZ2V0DQo+IG5v
bi16ZXJvIHJldHVybiAtRUJVU1kgYW5kIGFmdGVyIGEgd2FpdCBpdCB3aWxsIHJldHVybiAwLg0K
PiANCj4gPiAgICoNCj4gPiAgICogTk9URTogVGhpcyBmdW5jdGlvbiB0ZW1wb3JhcmlseSBjcmVh
dGVzIGEgVk0gaW4gZmF1bHQgbW9kZS4gSGVuY2UsIHdoaWxlDQo+ID4gICAqIHRoaXMgZnVuY3Rp
b24gaXMgZXhlY3V0aW5nLCBubyBub24tZmF1bHQgbW9kZSBWTXMgY2FuIGJlIGNyZWF0ZWQuDQo+
ID4gICAqLw0KPiA+IC1ib29sIHhlX3N1cHBvcnRzX2ZhdWx0cyhpbnQgZmQpDQo+ID4gK2ludCB4
ZV9zdXBwb3J0c19mYXVsdHMoaW50IGZkKQ0KPiA+ICB7DQo+ID4gLQlib29sIHN1cHBvcnRzX2Zh
dWx0czsNCj4gPiArCWludCByZXQ7DQo+ID4gIA0KPiA+ICAJc3RydWN0IGRybV94ZV92bV9jcmVh
dGUgY3JlYXRlID0gew0KPiA+ICAJCS5mbGFncyA9IERSTV9YRV9WTV9DUkVBVEVfRkxBR19MUl9N
T0RFIHwNCj4gPiAgCQkJIERSTV9YRV9WTV9DUkVBVEVfRkxBR19GQVVMVF9NT0RFLA0KPiA+ICAJ
fTsNCj4gPiAgDQo+ID4gLQlzdXBwb3J0c19mYXVsdHMgPSAhaWd0X2lvY3RsKGZkLCBEUk1fSU9D
VExfWEVfVk1fQ1JFQVRFLCAmY3JlYXRlKTsNCj4gPiArCXJldCA9IGlndF9pb2N0bChmZCwgRFJN
X0lPQ1RMX1hFX1ZNX0NSRUFURSwgJmNyZWF0ZSk7DQo+ID4gIA0KPiA+IC0JaWYgKHN1cHBvcnRz
X2ZhdWx0cykNCj4gPiArCWlmICghcmV0KQ0KPiA+ICAJCXhlX3ZtX2Rlc3Ryb3koZmQsIGNyZWF0
ZS52bV9pZCk7DQo+ID4gIA0KPiA+IC0JcmV0dXJuIHN1cHBvcnRzX2ZhdWx0czsNCj4gPiArCXJl
dHVybiByZXQ7DQo+ID4gIH0NCj4gDQo+IEFib3ZlIHBhcnQgbG9va3Mgb2suDQo+IA0KPiA+ICAN
Cj4gPiAgc3RhdGljIHZvaWQgeGVfZGV2aWNlX2Rlc3Ryb3lfY2FjaGUodm9pZCkNCj4gPiBkaWZm
IC0tZ2l0IGEvbGliL3hlL3hlX3F1ZXJ5LmggYi9saWIveGUveGVfcXVlcnkuaA0KPiA+IGluZGV4
IGY5MWQxNmJkZjUuLjU0MTE1ZjhmN2MgMTAwNjQ0DQo+ID4gLS0tIGEvbGliL3hlL3hlX3F1ZXJ5
LmgNCj4gPiArKysgYi9saWIveGUveGVfcXVlcnkuaA0KPiA+IEBAIC05NCw3ICs5NCw3IEBAIHVp
bnQ2NF90IHhlX3Zpc2libGVfYXZhaWxhYmxlX3ZyYW1fc2l6ZShpbnQgZmQsIGludCBndCk7DQo+
ID4gIHVpbnQzMl90IHhlX2dldF9kZWZhdWx0X2FsaWdubWVudChpbnQgZmQpOw0KPiA+ICB1aW50
MzJfdCB4ZV92YV9iaXRzKGludCBmZCk7DQo+ID4gIHVpbnQxNl90IHhlX2Rldl9pZChpbnQgZmQp
Ow0KPiA+IC1ib29sIHhlX3N1cHBvcnRzX2ZhdWx0cyhpbnQgZmQpOw0KPiA+ICtpbnQgeGVfc3Vw
cG9ydHNfZmF1bHRzKGludCBmZCk7DQo+ID4gIGNvbnN0IGNoYXIgKnhlX2VuZ2luZV9jbGFzc19z
dHJpbmcodWludDMyX3QgZW5naW5lX2NsYXNzKTsNCj4gPiAgYm9vbCB4ZV9oYXNfZW5naW5lX2Ns
YXNzKGludCBmZCwgdWludDE2X3QgZW5naW5lX2NsYXNzKTsNCj4gPiAgYm9vbCB4ZV9oYXNfbWVk
aWFfZ3QoaW50IGZkKTsNCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfZXhlY19mYXVs
dF9tb2RlLmMgYi90ZXN0cy9pbnRlbC94ZV9leGVjX2ZhdWx0X21vZGUuYw0KPiA+IGluZGV4IDBi
M2Y0Y2I4ZGUuLmMxNDAyODg5ZDkgMTAwNjQ0DQo+ID4gLS0tIGEvdGVzdHMvaW50ZWwveGVfZXhl
Y19mYXVsdF9tb2RlLmMNCj4gPiArKysgYi90ZXN0cy9pbnRlbC94ZV9leGVjX2ZhdWx0X21vZGUu
Yw0KPiA+IEBAIC00MDYsOCArNDA2LDE1IEBAIGlndF9tYWluDQo+ID4gIAlpbnQgZmQ7DQo+ID4g
IA0KPiA+ICAJaWd0X2ZpeHR1cmUgew0KPiA+ICsJCXN0cnVjdCB0aW1lc3BlYyB0diA9IHt9Ow0K
PiA+ICsJCWJvb2wgc3VwcG9ydHNfZmF1bHRzOw0KPiA+ICsJCWludCByZXQ7DQo+IA0KPiBBZGQg
bmV3bGluZS4NCj4gDQo+ID4gIAkJZmQgPSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX1hFKTsNCj4g
PiAtCQlpZ3RfcmVxdWlyZSh4ZV9zdXBwb3J0c19mYXVsdHMoZmQpKTsNCj4gPiArCQlkbyB7DQo+
ID4gKwkJCXJldCA9IHhlX3N1cHBvcnRzX2ZhdWx0cyhmZCk7DQo+ID4gKwkJfSB3aGlsZSAocmV0
ID09IC1FQlVTWSAmJiBpZ3Rfc2Vjb25kc19lbGFwc2VkKCZ0dikgPCAxMCk7DQo+IA0KPiBBZGQg
bmV3bGluZS4gQnR3IDEwIHNlY29uZHMgc2VlbXMgYSBsb3QsIGNvdWxkIHlvdSBtYWtlIGl0DQo+
IGxvd2VyICgyIHNlY29uZHM/KSBvciBtYWtlIGl0IGRlcGVuZCBvbiBzaW11bGF0aW9uPw0KDQpJ
IHdhcyB1bmRlciB0aGUgaW1wcmVzc2lvbiB0aGF0IGlndF9ydW5faW5fc2ltdWxhdGlvbiB3YXMg
bm90IGF2YWlsYWJsZQ0KdXBzdHJlYW0uICBJIGp1c3QgY2hlY2tlZCBhbmQgdGhpcyBpcyBhcHBh
cmVudGx5IGZhbHNlLiAgTXkgYmFkLiAgSSdsbCB0cnkgdG8NCnJlbWVtYmVyIHRoaXMgZm9yIHRo
ZSBuZXh0IHJldmlzaW9uLg0KDQo+IA0KPiA+ICsJCXN1cHBvcnRzX2ZhdWx0cyA9ICFyZXQ7DQo+
ID4gKwkJaWd0X3JlcXVpcmUoc3VwcG9ydHNfZmF1bHRzKTsNCj4gDQo+IFRoaXMgaXMgYWxzbyBh
Y2NlcHRhYmxlLCBJIHdvdWxkIHByZWZlciB0byBmYWlsIGluIGNhc2UNCj4gaGFyZHdhcmUgc3Vw
cG9ydHMgZmF1bHRzIGJ1dCB0ZXN0IGNhbm5vdCBwcm9jZWVkIGR1ZSB0bw0KPiBzb21lIGJhY2tn
cm91bmQgVk0gYWN0aXZpdHkuDQo+IA0KPiBSZWdhcmRzLA0KPiBLYW1pbA0KDQpUaGFuayB5b3Ug
Zm9yIHRoZSByZXZpc2lvbiBub3Rlcy4gIEknbGwgZ2V0IHRvIHdvcmsgb24gdGhlbSBzb29uLCBi
dXQgSSdtIGN1cnJlbnRseQ0Kd2FpdGluZyBvbiBhIHJlcGx5IHRvIHNvbWUgb3RoZXIgcmV2aXNp
b24gbm90ZXMgYmVmb3JlIEkgcHJvY2VlZCB0byBtYWtlIGFueSBtYWpvcg0KY2hhbmdlcy4gIEkg
d2FudCB0byBtYWtlIHN1cmUgZXZlcnlvbmUgaXMgb2theSB3aXRoIHRoZSBjaGFuZ2VzIGJlZm9y
ZSBJIHByb2NlZWQuDQotSm9uYXRoYW4gQ2F2aXR0DQoNCj4gDQo+ID4gIAl9DQo+ID4gIA0KPiA+
ICAJZm9yIChjb25zdCBzdHJ1Y3Qgc2VjdGlvbiAqcyA9IHNlY3Rpb25zOyBzLT5uYW1lOyBzKysp
IHsNCj4gPiAtLSANCj4gPiAyLjI1LjENCj4gPiANCj4gDQo=
