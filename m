Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B5A210BA435
	for <igt-dev@archiver.kernel.org>; Fri, 27 Mar 2026 08:11:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF21E10ED04;
	Fri, 27 Mar 2026 08:11:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XcGnw8rr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9D210ECFC
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Mar 2026 08:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774599086; x=1806135086;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ie9fub74g2HTX/PhSlpIGMjaqQQnqQvrf0AHKFcOEwI=;
 b=XcGnw8rrsttAJTWF93fCc/CozpfO7GJvya9IdtaNn8k2ratQIzDfIql+
 6OtXHV0zW/6gzb1PuG4fkSc6JPQ5Ip7m95uBKH7b7DcifpyIrcya0p8ev
 /ujuteKZjIayjWkSN7PvbcZztKXxfxAdEa8TnyCxtnRSo1x7qasQ0FS4d
 udUywXInz12Ps1gOw0pg2Sk0RFkptgH8mXbD8/klPZmIfDjzDmtOFaqZs
 +Oaj6FAwquXE3oDmA4//gXVR0ROkNhljB2wHSur+bdIXi8groYx0LIQsn
 v2KJQYLyEYuiTgC4IIIH1vmzWJbolG/6azOKmAKMl/B3BhtNMW9L+VycG g==;
X-CSE-ConnectionGUID: BtLQadDCRwyBDGfpMu9U9Q==
X-CSE-MsgGUID: NktQodgUSAGyLFXPPxUeiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75783322"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; d="scan'208";a="75783322"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 01:11:25 -0700
X-CSE-ConnectionGUID: V8okAsTJTGmPFiO/WYDjzg==
X-CSE-MsgGUID: 3Td9NgVoQ7qHbbwhMtDnwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; d="scan'208";a="255746649"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 01:11:25 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 01:11:24 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Mar 2026 01:11:24 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.63) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 01:11:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KMqLgzqw0mq+mAUOvjV1A2jON4yAUIQp5XW9Ng/slRhvZWg+J5xSV9DZdogi0xO0eI+Um1UStbjiRLlfXOeXcoYP29cZVE3ubxNxUQoF7nVCMkyXrABrGgbVCHMOcglg6GSRPMSLK+RjtMGyg5CdKrgUg3seSPSS2Nos564kQdQqiDLpnVSWsPYbiL09OEmrxC7q467BxTFaDRJUdrlGsli1I3auS80598Hoj94AOTjTzkgX69y1+wgDi+2FvLeDhZ1l1a+vHffk5mbVyTudtz81vAk8s1vwItTT/Mbr4n4uzSyPZ8DC22ILLSFxC6hCmps9symxPc3dzIV0Zomkew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ie9fub74g2HTX/PhSlpIGMjaqQQnqQvrf0AHKFcOEwI=;
 b=aFy8scAklZIOZzeqw1Znl32kxg/riIrLuDQdF5kLsNjncYEofzfMCRm1rwP8+i38I4uNwgKlPQ+mrlLcL4urzGSJ+macQh1S+vCM39L0mlYTOUKbAEe+1b9hY/+inID61xRDr40zxPnT9ZzcDPwLC8cIbw3Y0azwMeyK/1ur+dGRybbgeiM7b24rVLtJzaOG9FzNSkd0tixTIIOx457KCViRuUGqViezuDqCYy82WG8s+5wXV7DnADt936ST/HwN8xOAe9S4Mh6Q5Z2JptwvR3trXWw1kDhJ4NqZtg8dwOO1OLcjE3XuAVHvSLyeWq8qWAdlQR9pwlNdQI2ZBTU8Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by PH0PR11MB5127.namprd11.prod.outlook.com (2603:10b6:510:3c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.6; Fri, 27 Mar
 2026 08:11:15 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41%5]) with mapi id 15.20.9769.004; Fri, 27 Mar 2026
 08:11:15 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Reddy
 Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t 4/4] tests/intel/kms_fbc_dirty_rect: check the plane
 size before fbc dirty rect tests
Thread-Topic: [PATCH i-g-t 4/4] tests/intel/kms_fbc_dirty_rect: check the
 plane size before fbc dirty rect tests
Thread-Index: AQHcvPH+yAZ4X7/hPU6wMpcFup1IgrXB1MWAgAAz5IA=
Date: Fri, 27 Mar 2026 08:11:15 +0000
Message-ID: <d391a0cc1f238aa4f665e09e0c3782039e53030b.camel@intel.com>
References: <20260326072555.160329-1-vinod.govindapillai@intel.com>
 <20260326072555.160329-5-vinod.govindapillai@intel.com>
 <dffdb94b-fa11-4381-8249-983edfa4d99a@intel.com>
In-Reply-To: <dffdb94b-fa11-4381-8249-983edfa4d99a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|PH0PR11MB5127:EE_
x-ms-office365-filtering-correlation-id: da7e3d80-b273-48c4-f5d0-08de8bd86abf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|10070799003|366016|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: MUnMSjjGNdA3bykOdIpahNio36wT+UCICAL+PHEKWPoJ6tO1BWGCseDqCovDDuWS0MErYTmaTLZdzBHo/jiB4rTrsLmJyNiANeZ4RoNX6CD7Phyy0qrE1x2vWDfrCuQMzSwyQG0ag/XAg2Tzb1qHjbW7q3UepLswED+dePB/uYbDm0OhCLj5o0gSSHWtebbSe0YrpGhHx0lp7xqVN45Mn5IhN5IEcp2rez0cPX9lxqgQASgESYaUdV9x8ztL/f4w/wlJ/PiC8lLO82/SjBWOSVM9jgwsFkSKsur/WzFYFh3YgmVQI+nFMxM6vfh8SRpzckzzG8m3pbwcOi3YBHAqczYFDhwlaw/j7tuHqkQ34xdsASVa464x7BDz0lyGg8APYyptfwrszvUtWUlFN/HcAJBhMDA1Xq/M3h4gl+n7KGl/aE8UTlRskGzLiPdZmsiFARiepwyUAm8kdWhqnczMmVTrQMshwVj1pYf7B9jYgPABbJXM2D0M7YcLj95excxRPy24LzlnzDUWk8STPf2CEpNIygjq7SVfODrl69cP3jDfEeMvEDE+g9sl0/tMb3doPFayCoZRkYxw2Osvn6Jh+Ty30BaBPb+ee7vi2fZBC9YKlh5Ed+8IkEQKf35DCWs0A3loKmy7f1/wiNeZ8wyUp8idPtCaL9wZlpib1kvYzm51AcDiOIKZD51EVXy0EsMtCSYzg5r8tB09OgOLTI8glVFnkEo93x8KkdVQLfxY5IWLcqM4mSWE+SzMyzQCQEv6Ptp9CQM6QsvVllm3OemN61+dwSnsNa+sMdhfmEONnZg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(38070700021)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZGd0eEZhQmpGTEFsSkJXYU1WdmdUWDVhNFluZm5Hc1pzQWFmS3pMamdRTS8x?=
 =?utf-8?B?bU4xWkhlL2x6YzByOE5Ja2h0VXNabFNTNVlPQmFYQ0JtaHVJTDlhZ0lIZ3pR?=
 =?utf-8?B?MDNNalNlWllTZ21CUWFoVDNqZ3ErVE5acmUza2pjSEQrblhSeXo0aVA4TnRP?=
 =?utf-8?B?UHhicFROK1hKQ0krNFNzdUt1am5qOFRzMUJaVEMzOHFJUGdHNm9NWnZOVW9n?=
 =?utf-8?B?RXhkbDVXaGxKWjJoS1lVTHFnYjhYRCt1OXVTTTVsUnhzWVRLVVhyUml6eS9E?=
 =?utf-8?B?RzRKWjRDa1Q2VzB4MEYxcFdNeW5icFQ0OUl4ekMrSDU4TC9SUU5FdVRxRWdJ?=
 =?utf-8?B?dVJaTzRQdnFLZHR1V1c4WmcxSTRWZWdWbmx1RkJnVFdmd2hWdVFpSEwzcC9z?=
 =?utf-8?B?azBxN2VrcmdJMGJLcU9hZWRBMzlEWEo5M0cwUG9TRW5vRjJlQThaL3dZUW5k?=
 =?utf-8?B?b1MwUlZUd29hNmZaZWJlL20zenFpQ0ZlQWFidVpheVoyNTByMDRKSm9BT3Z2?=
 =?utf-8?B?d3RiRmlCSzBoNWFjUW1xZDJFY0E2QXFTbzV4RnZWZlJPeHQzQVNmeDlCaFgx?=
 =?utf-8?B?eE1tUlFyY2x6YktWb0FGdm5iTVdYQU9Ca2kwbmU4QkpTQnd1OHBwTUNNcFN4?=
 =?utf-8?B?STFrQnRsdWd0QUhHUVhsaUFkSjJpeWQzWnF1ZzJxUS9qSGc2WjF2bEpRUjBS?=
 =?utf-8?B?RGZHVmFLeWtFbnpKUWpUWkFVOFJ2VUtkRlE3NXJTUWs0ZEdOdDJVMDBVbE1N?=
 =?utf-8?B?ZFNqajI3MG9HMEVKUi9ZMzdxeGYzUUdMMzZyKzBEQTBOVDhkdEtHL3pKUmtX?=
 =?utf-8?B?MW01eUZiUzB3dkRIVWUvY0QrUWxpeU1DR2hjNXZ4ZkJHY054eG51RmQvcnJ2?=
 =?utf-8?B?N2Q2Q3JkYmJPMG9SSjJqVDZmcEVKTzhBSXNidHdrMlUvOUxkK3haY2ZFazhW?=
 =?utf-8?B?b2JLbW9VYXppbFAwcWFJRzNqSmdqbkRramMrbE5idzU3K3d4OFdnUkVMMEla?=
 =?utf-8?B?ZjhQdExCT1lSM0pNRHNJV1A3cVlBWko3OXgvdTMrMVdqckczNnRXbDduMllp?=
 =?utf-8?B?RStKOHdoRWJWWXByZFVsK1ZLTWt2aXRqY2tORVNEanlsTElqUHhDbm43dlFT?=
 =?utf-8?B?a0x2RjIvVHd0YzdYanZHbnpkUWhRZXpBa1lySXF5OGVJU1dGVENSU2dRUVZV?=
 =?utf-8?B?WnlhcmYxVTd5ZE52SlBGNGlMdUtuVVdJWWNrck1NM0tSR1RNTG1CNTVlSkV1?=
 =?utf-8?B?RHBWTHU3NUpzMDlGaExvTkVNd3JlOFVmN3hwU0p2ZVBCMDZJdHV1T1IvUFRU?=
 =?utf-8?B?MlFxVm13cFFRNlhuTUJheFJwaFF0RTlEbmc0dWxlUSs4bk5DVFhCS3l5ZGxD?=
 =?utf-8?B?S1ErS3hyU24xV0xKK3Z0cmplbUxYejErRVdpdWtYRGw1OXNlR3ZKcDBTYis2?=
 =?utf-8?B?SENsSC9zQTZsNFpBa1NKanBrMzBOVnhvR0M1cCtBOTVFU3kzanVWMDcrQTAr?=
 =?utf-8?B?ZDhicDVrTnFCWFBlYTdsZzkxYVVVdFdIc3hGQVptWVEvQ3hsVzF0bEhQYWZF?=
 =?utf-8?B?WWRyYlRScWpNYlEyNVc4MlhISUVjUWd3bFd3Mklrdi9FNzdlWDhPeU10aTVq?=
 =?utf-8?B?RU53Mm54bm5PbVpIQnNZRThENkp3cnNrYVBFdHc1V2JXZm9QbHJpVUo5S2ph?=
 =?utf-8?B?NUZRRlFGYXJ0YVc1aGVTYlZyTVZtazlMM0tZRzdJcko5Q0RNSXp0UTJBUWxo?=
 =?utf-8?B?WlpvUnhmclFuZHorMGRYSjhnQU5HVHBzUXVoRGsvQW9rSFpUVEJIVHFJNFZ2?=
 =?utf-8?B?UW13QXBtQUl2OVZKenV2UGQrN0dXaUZrYklyZzhFK2JIMURzckNjWFdMNDdZ?=
 =?utf-8?B?M2V5MndWSEhpcGZTRHRLQXl0OWZ4ZkJJa1kvakhJWkJ5Zmx3MStZVnNIWDda?=
 =?utf-8?B?Qm1iNTlZcEVuUkpac2tyOVZ3ZFdEdi9GbUVTVWNZZHNiNGxjeVdaMTd0U2lx?=
 =?utf-8?B?RUJRUFowOVUxSnF5c0M5VWlsY1NQV05FczRYUURYNXNZb1BIVW9YWlFsN0w5?=
 =?utf-8?B?Tk1xSE1ITHU0T2RBSmd6a2xONVFDNVdJVUNDbTk0RW1pdWVVRVg3Qi9LSDNK?=
 =?utf-8?B?OWJlMEoyU2ozMlNycTdKZWNXQXhnWnlEWXlEdFZWRUNreGNlczcvbEtxa0Jw?=
 =?utf-8?B?RWgyMUFrenZJcHk0aDlXaVdBQUh6NDY4cUhnd0E0QitxMU5oUEFEN0FWKzYy?=
 =?utf-8?B?R3Y4NFJoU3l5ZmJ3aHp6OXVKZmxRVDh4eG1XTjJURDkyZXRLU1dZczEvVXQ2?=
 =?utf-8?B?QlM2MGNYT2JreWlTRjJSbHdjeThPRnAxWHZiNFZzSjd4UXhkdmsyNHpsMW1H?=
 =?utf-8?Q?bwjqCoGpGgbiVoo3gMb4FnsL1heD9H3YZVnPVarl/28D7?=
x-ms-exchange-antispam-messagedata-1: DFvT7dN2Z/ZDqFGBeQFAKGcNeZc0nEXOUvfUx7VepXsb0kEKr07W3zme
Content-Type: text/plain; charset="utf-8"
Content-ID: <DECF4455B8D6554F86149A980964978F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: k959fJ2SMxexOj3UfoBt9L1+pm8QI222zTrhdF2Jm2pMSNR1jPCEP8rL+iN3+wkvnbYMtYjqOa446pgHtxsPhEe3mYnanek1/5GB/mplPXCeHZUZlALOlecr0UMSMWgJZ++JlVcoPlrqQrQeEWRh0IWxm/e1Ch+rrGTFFeYl00TOlr7GSD9P2k2p/vZ28b0eg9pwUrA/apTuhri2nJhjBWj9QklMkQ3NGqYykEFLQfSV49qR0LytplG3Uni2VZkWRMpRx7mkmpbVohnwovf/Ue17+x0Pt4m0v7zWtC3u4xVTT+uCaAY4EzqjWkC8ZgcisnEEqWx5ASydlEKADtrF8g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da7e3d80-b273-48c4-f5d0-08de8bd86abf
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2026 08:11:15.2901 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4hJwPWrP+n0m2Vrra9HTJjKVvyEC1fT9gZ70tYJuE2T3ZQmR/XfNyv+JW5hb9ErdOT3ktsMdq4mHXDyPCT/rX3Siv8GnI9ZmaAt3pnCPy9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5127
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

T24gRnJpLCAyMDI2LTAzLTI3IGF0IDEwOjM1ICswNTMwLCBSZWRkeSBHdWRkYXRpLCBTYW50aG9z
aCB3cm90ZToNCj4gSGkgVmlub2QsDQo+IA0KPiBPbiAyNi0wMy0yMDI2IDEyOjU1LCBWaW5vZCBH
b3ZpbmRhcGlsbGFpIHdyb3RlOg0KPiA+IElmIHRoZSBGQkMgY2Fubm90IHN1cHBvcnQgdGhlIHBs
YW4gc2l6ZSwgc2tpcCB0aGUgdGVzdHMNCj4gPiANCj4gJXMvcGxhbi9wbGFuZQ0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFZpbm9kIEdvdmluZGFwaWxsYWkgPHZpbm9kLmdvdmluZGFwaWxsYWlAaW50ZWwu
Y29tPg0KPiA+IC0tLQ0KPiA+IMKgIHRlc3RzL2ludGVsL2ttc19mYmNfZGlydHlfcmVjdC5jIHwg
MTkgKysrKysrKysrKysrKysrKystLQ0KPiA+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRl
bC9rbXNfZmJjX2RpcnR5X3JlY3QuYw0KPiA+IGIvdGVzdHMvaW50ZWwva21zX2ZiY19kaXJ0eV9y
ZWN0LmMNCj4gPiBpbmRleCBlZmJkNDY5ODUuLmVlMTNlOTVkZCAxMDA2NDQNCj4gPiAtLS0gYS90
ZXN0cy9pbnRlbC9rbXNfZmJjX2RpcnR5X3JlY3QuYw0KPiA+ICsrKyBiL3Rlc3RzL2ludGVsL2tt
c19mYmNfZGlydHlfcmVjdC5jDQo+ID4gQEAgLTQwMSw2ICs0MDEsMjIgQEAgc3RhdGljIHZvaWQg
Y2xlYW51cChkYXRhX3QgKmRhdGEpDQo+ID4gwqDCoAlpZ3RfZGlzcGxheV9jb21taXQyKCZkYXRh
LT5kaXNwbGF5LCBDT01NSVRfQVRPTUlDKTsNCj4gPiDCoCB9DQo+ID4gwqAgDQo+ID4gK3N0YXRp
YyBib29sIGNoZWNrX2ZiY19zdXBwb3J0ZWQoZGF0YV90ICpkYXRhKQ0KPiA+ICt7DQo+ID4gKwlp
ZiAoIWludGVsX2ZiY19zdXBwb3J0ZWQoZGF0YS0+Y3J0YykpIHsNCj4gPiArCQlpZ3RfaW5mbygi
RkJDIG5vdCBzdXBwb3J0ZWQgYnkgdGhlIGNoaXBzZXQgb24NCj4gPiBwaXBlXG4iKTsNCj4gPiAr
CQlyZXR1cm4gZmFsc2U7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJaWYgKCFpbnRlbF9mYmNfcGxh
bmVfc2l6ZV9zdXBwb3J0ZWQoJmRhdGEtPmRpc3BsYXksIGRhdGEtDQo+ID4gPm1vZGUtPmhkaXNw
bGF5LA0KPiA+ICsJCQkJCcKgwqDCoCBkYXRhLT5tb2RlLT52ZGlzcGxheSkpDQo+ID4gew0KPiA+
ICsJCWlndF9pbmZvKCJQbGFuZSBzaXplIG5vdCBzdXBwb3J0ZWQgYXMgcGVyIEZCQyBzaXplDQo+
ID4gcmVzdHJpY3Rpb25zXG4iKTsNCj4gPiArCQlyZXR1cm4gZmFsc2U7DQo+ID4gKwl9DQo+ID4g
Kw0KPiA+ICsJcmV0dXJuIHRydWU7DQo+ID4gK30NCj4gPiArDQo+ID4gwqAgc3RhdGljIGJvb2wg
cHJlcGFyZV90ZXN0KGRhdGFfdCAqZGF0YSkNCj4gPiDCoCB7DQo+ID4gwqDCoAlpZ3RfZGlzcGxh
eV9yZXNldCgmZGF0YS0+ZGlzcGxheSk7DQo+ID4gQEAgLTQxMSw4ICs0MjcsNyBAQCBzdGF0aWMg
Ym9vbCBwcmVwYXJlX3Rlc3QoZGF0YV90ICpkYXRhKQ0KPiA+IMKgwqAJZGF0YS0+cGlwZV9jcmMg
PSBpZ3RfY3J0Y19jcmNfbmV3KGRhdGEtPmNydGMsDQo+ID4gwqDCoAkJCQkJwqANCj4gPiBJR1Rf
UElQRV9DUkNfU09VUkNFX0FVVE8pOw0KPiA+IMKgIA0KPiA+IC0JaWd0X3JlcXVpcmVfZihpbnRl
bF9mYmNfc3VwcG9ydGVkKGRhdGEtPmNydGMpLA0KPiA+IC0JCcKgwqDCoMKgwqAgIkZCQyBub3Qg
c3VwcG9ydGVkIGJ5IHRoZSBjaGlwc2V0IG9uDQo+ID4gcGlwZVxuIik7DQo+ID4gKwlpZ3RfcmVx
dWlyZV9mKGNoZWNrX2ZiY19zdXBwb3J0ZWQoZGF0YSksICJGQkMgaXMgbm90DQo+ID4gc3VwcG9y
dGVkIHdpdGggdGhpcyBjb25maWd1cmF0aW9uXG4iKTsNCj4gPiDCoCANCj4gU2luY2UgdGhlIGNo
YW5nZSBpbiBmYmMgZGlydHkgcmVjdGFuZ2xlIGlzIGluZGVwZW5kZW50IG9mIG90aGVyDQo+IGNo
YW5nZXMgDQo+IGluIHRoZSBzZXJpZXMgYW5kIGltaG8gdGhpcyBjYW4gYmUgYSBzcGxpdCBhcyBz
ZXBhcmF0ZSBwYXRjaCBmcm9tIA0KPiBibG9ja2luZyBpdC4NCg0KWWVzLiBObyBkZXBlbmRlbmN5
IHRvIG90aGVyIHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMuIElmIHRoaXMgY2FuIGJlIFJCLQ0KZWQg
d2l0aCB0aGF0IHR5cG8gZml4ZWQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLCBvbmx5IHRoaXMgcGF0
Y2ggY291bGQgYmUNCmNoZXJyeS1waWNrZWQgYW5kIG1lcmdlIGFuZCBmaXggdGhlIHR5cG8gYXQg
dGhlIG1lcmdlIHRpbWU/IEkgZ3Vlc3Mgbm8NCm5lZWQgdG8gcmVzZW5kIG9ubHkgdGhpcyBwYXRj
aCBhZ2FpbiB3aXRoIHR5cG8gZml4ZWQgYW5kIHdhc3RlIENJLiBJDQpkb24ndCBoYXZlIGNvbW1p
dCByaWdodHMuIENvdWxkIHlvdSBwbHMgZG8gdGhhdC4NCg0KdGhhbmtzDQpWaW5vZA0KDQo+IA0K
PiBSZWdhcmRzLA0KPiBTYW50aG9zaA0KPiA+IMKgwqAJaWYgKHBzcl9zaW5rX3N1cHBvcnQoZGF0
YS0+ZHJtX2ZkLCBkYXRhLT5kZWJ1Z2ZzX2ZkLA0KPiA+IFBTUl9NT0RFXzEsIE5VTEwpIHx8DQo+
ID4gwqDCoAnCoMKgwqAgcHNyX3Npbmtfc3VwcG9ydChkYXRhLT5kcm1fZmQsIGRhdGEtPmRlYnVn
ZnNfZmQsDQo+ID4gUFNSX01PREVfMiwgTlVMTCkgfHwNCj4gDQoNCg==
