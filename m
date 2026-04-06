Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B477CEF4EC2
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 08:07:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50AC010E235;
	Mon,  6 Apr 2026 08:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MCFdcXA6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB84910E235
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 08:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775462857; x=1806998857;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d9FauJFwWF99MlWPe6hPkMqDVoSZOlmbPrqh5Yw054Q=;
 b=MCFdcXA69qzUk8v+ic3yMhzqZgi7ab1BcsOlT0Kj4pUJvrPZLzBMkGkY
 FPoGts4tZkz46QZ7r0fZzC95YujlkKoQfS5BoK0Hdm2BpOUpemZcVs8K+
 zCnMvwJGpGm7EAA5sshwqemVxJmdUyeoX/X9iPCHpe3ArCAKIHctdFO7z
 JIwY1DFqzM7uw55qz+7wBNtUNpZ8aJqQo8iOGsrOhLAQBMLbqwHB9DnsD
 biuhqI/U9sF96dqhqBoawKgt2mpXYmD3xLYveBnJf96w9m5EYWqxtJaRh
 yzpN2rf5P5yP7WMNy++QQSGUKLrB2J7hnyfWN0i0WhbpvhG7YK6E7kvZ3 Q==;
X-CSE-ConnectionGUID: PXXaVkV9SYm3keG8UUpsZw==
X-CSE-MsgGUID: kc/7fFgiRsSDhdCYsfCVww==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="87118698"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="87118698"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 01:07:36 -0700
X-CSE-ConnectionGUID: UtlLDmaXS32dJXJzUl0u9g==
X-CSE-MsgGUID: EE2dVizXTaGK35jE7idEOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="227724677"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 01:07:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 01:07:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 01:07:35 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 01:07:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VnrCmtYsKCuJp4881l6fu/cJJdiPPqMdHVpNRP8dr+pMx/M2SWfzjMTJxqT4WKJuRbjigVGXz2iHTj94d7Aeaqp9GBMXaokMrN7dRw42Th0Rsn5fmQuRFisK0A33d7LnapvC9+llUE9ZKZ34netfpgsvceHz8eKFin/rvFpR5vhOpMLuPDEm7Nc064rv/RusDPLXP6La71DcGHP0H0rP0uXpaY+IAjfrz0PB83z+5sC9/tztnYs7+Hp3TId4J/cPPCIa377IQZU0ufsYq7A33kH3i6aMByHYN0GcSWGfCEGcp6prFWmm67V0F8MCFQncrKExlHIdCVUivysnfbnRGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9FauJFwWF99MlWPe6hPkMqDVoSZOlmbPrqh5Yw054Q=;
 b=B0/EPKeZNr7RKLrdHAF9JiwADy44x/QlcmjjMPm9tPFKKrl2nxFcIt9uPIok4O2KtB6IK6KWMkDWSBkoPZAZ2qGy5GCR/0f02nEcqLORPGQFSaMPRqIERyvwQXYi3dMBYFXvGamInXODjfG2XDH81LY8ZEnNKMzJcXaP0AuuSSSBtAm76k8s5Pz8ypMpsZqQepn4ndBquFBKhtFGQcdtK6JdIX2BsH3vyH4sKfezLtXgttcR0hl02KKoQ9At4oRcGg+33dzW0tUd2xs2/CS1A83jHHfxcUZSsGx3npCJ99Egnm7TD96zwBkbSPMDDoq0JfC2Q7izP0WWYuyE/LiyAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by SJ0PR11MB5038.namprd11.prod.outlook.com (2603:10b6:a03:2d8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Mon, 6 Apr
 2026 08:07:27 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%5]) with mapi id 15.20.9769.015; Mon, 6 Apr 2026
 08:07:27 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "B S,
 Karthik" <karthik.b.s@intel.com>, "Sharma, Swati2" <swati2.sharma@intel.com>, 
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, "Heikkila, Juha-pekka"
 <juha-pekka.heikkila@intel.com>, =?utf-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH i-g-t v1] README: Document skip message format
Thread-Topic: [PATCH i-g-t v1] README: Document skip message format
Thread-Index: AQHcwY27KoF8xfSpZ0iCiOSi+tqFGLXLi5yAgAYohUA=
Date: Mon, 6 Apr 2026 08:07:27 +0000
Message-ID: <PH7PR11MB6796B0EC282C55C5B540BFE8E55DA@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260401043317.890733-1-sowmiya.s@intel.com>
 <20260402095913.4kwtzd2bowukjvev@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260402095913.4kwtzd2bowukjvev@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: kamil.konieczny@linux.intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|SJ0PR11MB5038:EE_
x-ms-office365-filtering-correlation-id: f70b4809-c40a-4b30-5c00-08de93b38b28
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|13003099007|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: nS7DKc01EV4/KWBDy+TVVp8oA/aavZQXi3olTI2eoWJgwqUfsObgxB5Yg+uaOu85xMyjuiU/nNMbdAatFYeZsLbubXLTw6nnIlUDqJD7c6sFBvdNx0+94YxSqGXBXGrqJ1ObPQuV7xpuU3V3mv9bjsCrLlbfFp2Wzyq83UYxbu6J1wd9Fm43606qAxSqfbF/V0MCbbYCjFVhKm9YOKPLZHAui80jpNLBlcEut57gnu32yfmnxMTrTVPwBnjvHscCXfZF+/wimC4dBTTMFaW9nMUcoc5bPQkaec19JdxANBBkvfddjG3AqrwXzjkoGZwdtbLeUc8hmr4MV1nnYDXc95NyFmJTfNTHuSs4XRTP/OE3+hMPIf1VHQTlLoTpYRbmKNnqMnIgyCaIVKMGVfa5If1KO2WSGqJMB+OYnn/ib21zXcWTiriwE/i1iC7LmQ48aPcKgLz+vcTiP8fNwkzc5Om1e+N3i92mIVmCV2XPIjaF4R8h8tRCWmc/Rx1WNBLzRWvh/okEmdXQP19tDEvFzYy2ncbhEXNOxo2kwOKvwcOWqg0E1LGaXyUQLrdT3MnThGfENtOQ/+mhY8RjdYuq7g+m5xACzfC3FUzgFgbwYTivp9KfE5ABVWdNpMiZVpvT3KRKo3SzqXRuybqErzdLPzP9QbJUQa7g1wscg0jGkM6ae9yAEan26U5aafwGCZ2l60N/LbeXKz/DKYC8dUyS6YQbxyZSCwHdeutIqE5oRfZc0EP5i95Kt0PYfAF7VBiA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(13003099007)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SkI3RWVtMEhQL282WUdEcXBkUVBhQWJhaTdJNHdMZFkxUVg5QzhWN295c3hv?=
 =?utf-8?B?RFZvWWgyeEJReUc1dlNpMWlMT3p4OFBJVFJmdmEzOXk5VHhIZkJsVXVKSmp1?=
 =?utf-8?B?N0lhaDNrU2RrZHJzNWJCcHZnU20rWk11MHRqQWxxRGRVRFI2YmRRTWljWTZZ?=
 =?utf-8?B?VG02TnB5NWVJdzFqOERwK2lTOTRTRG80MFJMSFNQQXBJSU9xQm5YVGtqZjlo?=
 =?utf-8?B?NVhoOVlrZ01xRHpSQWYyT2ZxeitPZmRBaUFRNytyb1FWT2JFcXQ4czdRQTdT?=
 =?utf-8?B?eDR3TXlwcmZ6VEpObU5iQW5lVVJRUHpWSUJ5MGNFYWpJSnpKNXpHTG1nZUJw?=
 =?utf-8?B?TFlMaTJDcHJXNlkwUU5wTG1yYnZaa05QSml5SmpUSjVBRWl4WTNFYWJVTDJZ?=
 =?utf-8?B?clRPWWdNbjZsNFJHaXlzczBiejZMdlh5TnZtdjBid2RMbTlBWlk4VmVhanAr?=
 =?utf-8?B?M1g4bXJpTGQ2WkJ4VzVaL244VldhbFBxb0h0NmlIY3dzZjhQN2JVTDB0WWYz?=
 =?utf-8?B?eFh4OGdhRkhCYXZyT0djTHlwenVMQ2xSdHN0b2M1ZEJKK2VQWEJrb3duK1FK?=
 =?utf-8?B?RDY4My9HS1ROTFdpQis1Q2VuUEJuUVBsSFRPL2hBUTY1eFJyMUdLK1YyMktG?=
 =?utf-8?B?YUxCYVkvMTZzamRNWFhRR1BnVXNVcENuYW4wNkg2ejZUUDZneWdYQ0hFWkdR?=
 =?utf-8?B?RFF6cUZkcHBKL1laeGxpaDFlSVhlc3YyR09aTUJac2ZuREJMVENIMm9WSHVI?=
 =?utf-8?B?NURxK1ZzeWFxUnRyZW5rbGhKNUZZV1AwNEU1MHlINGdLZkxpVWtyekh4RUc5?=
 =?utf-8?B?N0pRU2N3RFQ2R1ViN2NpekFnemlzYnFuSWUyNjVLc0k0ajNrZ0R5SmlJSHVq?=
 =?utf-8?B?MWpwMWtpU1E2UnJGTmNJRlNNWGlYSGhzOWtCSTExSTJDSzkzOGl3Yi9rSkd6?=
 =?utf-8?B?MDU3N3RueXVqdjN4MVlQRXNNbzFna1lrM3ZDUTYwY3lQUmFtMHJRdlZ6RDBm?=
 =?utf-8?B?NUZVQmcrbTF2T280dDhDZnFBR3lVNlU0WWtWUUt1VytEUHlKM1hUdjNIZ1ZY?=
 =?utf-8?B?RTVyVVpxZld5WWN1TXdZSE03dE5vaDlhME5iQWhSeXBQUHJPZFg3UEoza09V?=
 =?utf-8?B?ZzR6Mkd5RHIrWldMU000U205MnBoUEhiOUFvNGRQZEF1a01nM1IxUVRWUzR1?=
 =?utf-8?B?WEFoamJkRi84dXQ1bUNoUzhNbndvM0NyQTVyaVIxbzBxcDM5cTFhdHRpRU13?=
 =?utf-8?B?dkhrb3Q0TUN4b0pxazBJWkZ6bWkwZ3EwdEFqWk12KzdpRU0rY1kyRG1QU3RR?=
 =?utf-8?B?TVN5YzZNWTk4V2MrZTlOY0ZQaUFBQkg5VkV4bUlWRHFXK0FnR1pnL0VPM01s?=
 =?utf-8?B?N2VPekRXcmZKNzRGeWwrSGJPS0pjcStSdFNnRkxGS3hJUUlkWTFlSWlZWXl3?=
 =?utf-8?B?YmlPb1FsdENETWF2cG9lbFArLzlXZkRKV3J4bC9PejJ1S0xmYlNxNE5YcHhB?=
 =?utf-8?B?MXA5bWJoakNPdzg1aUJpM0daSXgvdDhudEhsenFLQ0paZElnZjhYcVd2UXlR?=
 =?utf-8?B?Q1dmT2VuMk9hRitLSEV1STlPTW1hcnVrS2JlN25VRFdNb1BLMmdzUGxuTzNn?=
 =?utf-8?B?Y3kwUzFFVnFSTS95NWN4QjZIU0lZVjJKeldya3IrTXphdm1ReGVMRWlUMjRt?=
 =?utf-8?B?VTMxaUdGTWxNaDhyNjJQMEZJeUxOMFFIMGd1N1BoMW4zYTNZeEFWRFBmeXN3?=
 =?utf-8?B?ejZTWHJYVjh5RUdQQktuUHgvQnFmd3FBQXUvL1BIalpMckt2am9mOThvUHhD?=
 =?utf-8?B?VmZOdGx6czNNcDZFdlZxd3RzSllMaXVrSERLRkNZbVpGMzBuSWRXT3VwWWlD?=
 =?utf-8?B?TkM0eVFDeVJBUEN2VDh6ZXZwMDVmUURkM2ExUldodys1NDNZTWQxU0pTeUh0?=
 =?utf-8?B?MTN1dFQxTjBtNGFheUY4VEMweUd6YUNBTXRGS0p4SlM0Sk10VnBuNm9reXpQ?=
 =?utf-8?B?WjVMbDVSdkttL1lhT2VxNzQxSWhBNG9lVnVGN1hDMnJoN2s0NWRUZzdFRldw?=
 =?utf-8?B?V3R3a1F3QlV6LzJWNjdtbDg5TGNlazgrUnNYTTJpb1lFWTJWbnR2dWFoUU9R?=
 =?utf-8?B?U25ac2Z1OEpJME1sbEp2K1lOcnJuekZqb1RIeUpJazhvZStoczA3WWZqbUJQ?=
 =?utf-8?B?MnFSWnVkTDVoVTRqZDlDd1FPTFFoRHBkRUFLbVNjSllJSXdaMHRPOE5WSGJM?=
 =?utf-8?B?ZS9NM0tNekFGQ29NaEJEWFc4ZXpzdHBDb2QxaDNnV0FyYmNCaGFUNzdZcHNK?=
 =?utf-8?Q?kEgqiVq12fBKeXrNpa?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ZPnY549kNNKxylfOAq1zORLp1fMxaf0wx8TXUaK0GPsYBeCmSnDvsrpg+Lyo9ifH8YmYuMJTjY3xYYzNV9SrayDKFU5LnASmt7eB7Gm77sn5RNbkI0bQTwKVDQ7d6aI3mm3XkgC7N3gIFVkmSGfidNpYwEOK05jfYGABifilXApZUZbohGffDcZPbu9UCXcqZisHPs8EkmwW2hbZWDJwcAAbSr2qjFXvoLkiJKllWTMKqtNPCrKmdhXw0eN+gjz95SnyMnYPIbbCvv/3bjfH33drBheBn7ozMf13HH5t6Or7pwYFqgy+T8RIhtqW6+CdclXf1za6fEjwsWqSF/bZ9A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f70b4809-c40a-4b30-5c00-08de93b38b28
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2026 08:07:27.6109 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QRmlz/Fbc78Cgp8+FDexBn+v4dolwb64rAoyt9xI2gLx+qRYqi/yzcrxWxP1oKatcuuWJwQSyUCIYMDTxEi2Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5038
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

SGkgQEthbWlsIEtvbmllY3pueSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBG
cm9tOiBLYW1pbCBLb25pZWN6bnkgPGthbWlsLmtvbmllY3pueUBsaW51eC5pbnRlbC5jb20+DQo+
IFNlbnQ6IDAyIEFwcmlsIDIwMjYgMTU6MjkNCj4gVG86IFMsIFNvd21peWEgPHNvd21peWEuc0Bp
bnRlbC5jb20+DQo+IENjOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgQiBTLCBLYXJ0
aGlrIDxrYXJ0aGlrLmIuc0BpbnRlbC5jb20+Ow0KPiBTaGFybWEsIFN3YXRpMiA8c3dhdGkyLnNo
YXJtYUBpbnRlbC5jb20+OyBEaXhpdCwgQXNodXRvc2gNCj4gPGFzaHV0b3NoLmRpeGl0QGludGVs
LmNvbT47IEp1aGEtUGVra2EgSGVpa2tpbGENCj4gPGp1aGFwZWtrYS5oZWlra2lsYUBnbWFpbC5j
b20+OyBIZWlra2lsYSwgSnVoYS1wZWtrYSA8anVoYS0NCj4gcGVra2EuaGVpa2tpbGFAaW50ZWwu
Y29tPjsgVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT47IE5p
a3VsYSwNCj4gSmFuaSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIGktZy10IHYxXSBSRUFETUU6IERvY3VtZW50IHNraXAgbWVzc2FnZSBmb3JtYXQNCj4gDQo+
IEhpIFNvd21peWEsDQo+IE9uIDIwMjYtMDQtMDEgYXQgMTA6MDM6MDEgKzA1MzAsIFNvd21peWEg
UyB3cm90ZToNCj4gPiBBZGQgYSBjb25jaXNlIGd1aWRlIGZvciB3cml0aW5nIGNvbnNpc3RlbnQs
IG1hY2hpbmUtZnJpZW5kbHkgc2tpcA0KPiA+IG1lc3NhZ2VzIGluIElHVCB0ZXN0cy4gRGVmaW5l
cyB0aGUgZm9ybWF0Og0KPiA+DQo+ID4gICBTS0lQOiA8cmVhc29uPiBbKDxjb250ZXh0X3R5cGU+
OiA8dmFsdWU+KV0NCj4gDQo+IFNob3VsZCB0aGlzIGFsc28gaW5jbHVkZSBzdWJzeXN0ZW0gbGlr
ZSBkaXNwbGF5PyBGb3IgZXhhbXBsZToNCj4gDQo+ICAgU0tJUDogPHN1YnN5c3RlbT4gPHJlYXNv
bj4gWyg8Y29udGV4dF90eXBlPjogPHZhbHVlPildDQo+IA0KPiBFeGFtcGxlOg0KPiANCj4gICBT
S0lQOiBkaXNwbGF5OiBubyBzdWl0YWJsZSBjb25uZWN0b3IgYXZhaWxhYmxlYA0KPiANCj4gICBT
S0lQOiBjb3JlOiB1bnN1cHBvcnRlZCBvbiBERzJgDQo+IA0KPiArY2MgQXNodXRvc2gsIEotUCwg
SmFuaSBhbmQgVmlsbGUNCj4gDQo+ID4NCj4gPiBhbG9uZyB3aXRoIGNvbW1vbiBjb250ZXh0IHR5
cGVzLCBleGFtcGxlIG1lc3NhZ2VzIGFuZCBhIGNvZGUgc25pcHBldC4NCj4gPg0KPiANCj4gUGxl
YXNlIGdpdmUgYSBsaW5rIGhlcmUgdG8gR2l0TGFiIGlzc3VlIGl0IGlzIHJlbGF0ZWQsIGJ0dyBH
aXRMYWIgY2hhbmdlZCByZWNlbnRseQ0KPiAnaXNzdWVzJyBpbnRvICd3b3JrIGl0ZW1zJzoNCj4g
aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pZ3QtZ3B1LXRvb2xzLy0vd29ya19p
dGVtcy8yNA0KPiANCj4gUmVnYXJkcywNCj4gS2FtaWwNCj4gDQpUaGFua3MgZm9yIHVwZGF0aW5n
IHRoZSBnaXRsYWIgaXNzdWUgaGVyZSwNCmh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9k
cm0vaWd0LWdwdS10b29scy8tL3dvcmtfaXRlbXMvMjQNCg0KVGhhbmtzIGZvciB0aGUgc3VnZ2Vz
dGlvbiBLYW1pbC4gDQpSZWdhcmRzLA0KU293bWl5YSBTLg0KDQo+ID4gU2lnbmVkLW9mZi1ieTog
U293bWl5YSBTIDxzb3dtaXlhLnNAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBSRUFETUUubWQg
fCAzNyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvUkVBRE1FLm1k
IGIvUkVBRE1FLm1kDQo+ID4gaW5kZXggYjRiOWEzN2VhLi5hNjUyY2MwZDEgMTAwNjQ0DQo+ID4g
LS0tIGEvUkVBRE1FLm1kDQo+ID4gKysrIGIvUkVBRE1FLm1kDQo+ID4gQEAgLTE4OCwzICsxODgs
NDAgQEAgSW1wb3J0ZWQgbm9uLURSTSB1YXBpIGhlYWRlcnMgZnJvbSBhaXJsaWVkJ3MgZHJtLQ0K
PiBuZXh0IGJyYW5jaC4NCj4gPg0KPiA+ICBUaGVuLCBjb21taXQgd2l0aCBhIG5vdGUgb2Ygd2hp
Y2ggZXhhY3QgY29tbWl0IGZyb20gYWlybGllZCdzIGJyYW5jaA0KPiA+IHdhcyB1c2VkIHRvIGdl
bmVyYXRlIHRoZW0uDQo+ID4gKw0KPiA+ICtTa2lwIE1lc3NhZ2UgRm9ybWF0DQo+ID4gKy0tLS0t
LS0tLS0tLS0tLS0tLS0NCj4gPiArDQo+ID4gK0tlZXAgc2tpcCBtZXNzYWdlcyBjb25zaXN0ZW50
IGFuZCBtYWNoaW5lLWZyaWVuZGx5LiBVc2UgdGhpcyBjb25jaXNlDQo+ID4gK2Zvcm1hdCBhbmQg
aW5jbHVkZSBhIHNpbmdsZSwgbW9zdC1yZWxldmFudCBjb250ZXh0IHdoZW4gYXZhaWxhYmxlOg0K
PiA+ICsNCj4gPiArLSBGb3JtYXQ6IGBTS0lQOiA8cmVhc29uPiBbKDxjb250ZXh0X3R5cGU+OiA8
dmFsdWU+KV1gIChhbHdheXMgZW5kDQo+ID4gK3dpdGggYFxuYCkNCj4gPiArLSBSdWxlczogc3Rh
cnQgd2l0aCBgU0tJUDpgLCB1c2UgYSBzaG9ydCBsb3dlcmNhc2UgYHJlYXNvbmAsIGluY2x1ZGUg
YXQNCj4gPiArICAgIG1vc3Qgb25lIGBjb250ZXh0YCBpbiBwYXJlbnRoZXNlcywgdXNlIGAweCVs
bHhgIGZvciBtb2RpZmllcnMsIGFuZA0KPiA+ICsgICAgZG8gbm90IGFkZCBhIHRyYWlsaW5nIHBl
cmlvZC4NCj4gPiArDQo+ID4gKyMjIyBgQ29tbW9uIGNvbnRleHQgdHlwZXMgYW5kIGV4YW1wbGVz
OmANCj4gPiArDQo+ID4gKy0gYGNvbm5lY3RvcmA6IGRpc3BsYXkgY29ubmVjdG9yIG5hbWUg4oCU
IGAoY29ubmVjdG9yOiBIRE1JLUEtMSlgDQo+ID4gKy0gYHBsYW5lYDogcGxhbmUgdHlwZSDigJQg
YChwbGFuZTogcHJpbWFyeSlgDQo+ID4gKy0gYGZvcm1hdGA6IGZvdXJjYyBmb3JtYXQg4oCUIGAo
Zm9ybWF0OiBOVjEyKWANCj4gPiArLSBgbW9kaWZpZXJgOiBidWZmZXIgbW9kaWZpZXIgKGhleCkg
4oCUIGAobW9kaWZpZXI6IDB4JWxseClgDQo+ID4gKy0gYHBpcGVgOiBwaXBlIGlkL25hbWUg4oCU
IGAocGlwZTogQSlgDQo+ID4gKy0gYHBsYXRmb3JtYDogR1BVL3BsYXRmb3JtIG5hbWUg4oCUIGAo
cGxhdGZvcm06IGk5MTUpYA0KPiA+ICsNCj4gPiArIyMjIGBDb21tb24gY29uY2lzZSBtZXNzYWdl
czpgDQo+ID4gKw0KPiA+ICstIGBTS0lQOiBubyBzdWl0YWJsZSBjb25uZWN0b3IgYXZhaWxhYmxl
YA0KPiA+ICstIGBTS0lQOiBjb25uZWN0b3IgaXMgZGlzY29ubmVjdGVkIChjb25uZWN0b3I6ICVz
KWANCj4gPiArLSBgU0tJUDogbm8gc3VpdGFibGUgZGlzcGxheSBtb2RlIGF2YWlsYWJsZSAoY29u
bmVjdG9yOiAlcylgDQo+ID4gKy0gYFNLSVA6IGZvcm1hdCBub3Qgc3VwcG9ydGVkIChwbGFuZTog
JXMsIGZvcm1hdDogJXMpYA0KPiA+ICstIGBTS0lQOiBtb2RpZmllciBub3Qgc3VwcG9ydGVkICht
b2RpZmllcjogMHglbGx4KWANCj4gPiArLSBgU0tJUDogcGxhbmUgbm90IGF2YWlsYWJsZSAocGxh
bmU6ICVzKWANCj4gPiArDQo+ID4gKyMjIyBgRXhhbXBsZSB1c2FnZTpgDQo+ID4gKw0KPiA+ICtg
YGBjDQo+ID4gKyAgICAgICAgaWd0X3NraXBfb25fZighZm10X3N1cHBvcnRlZChwbGFuZSwgZm10
KSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICJTS0lQOiBmb3JtYXQgbm90IHN1
cHBvcnRlZCAocGxhbmU6ICVzLCBmb3JtYXQ6ICVzKVxuIiwNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGlndF9wbGFuZV9uYW1lKHBsYW5lKSwNCj4gPiAraWd0X2Zvcm1hdF9zdHIo
Zm10KSk7IGBgYA0KPiA+IC0tDQo+ID4gMi40My4wDQo+ID4NCg==
