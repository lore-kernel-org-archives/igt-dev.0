Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762F0F364A3
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 16:59:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 135D610E004;
	Thu,  9 Apr 2026 16:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a32tUPdb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C16110E004
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 16:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775753932; x=1807289932;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=C7vh0WpDfWHlYf80SfHaAYKiRlBrUin5UULlQE729HE=;
 b=a32tUPdbIBg5qf+xaVOfvC7HehC1dTjhGeFEgpo3+4OeyEZ12f1YYBoa
 IgHCbixTGL1GLslsBvGuliG8S0FhzecUxR3ANO5MfkB/38nClZWlYt9K9
 EPQON8kSXEI3n+AH770036Yw7XvQUoQEaVPXUxZAF923Sjk0Rz+IoEb6h
 4Dvvfc/LvqVcGvhw3wS9E+motQd7/nOrQDw6Lq78OxfZLbKdD5fIeDqqd
 gdiomgJY7Q+BhQdFD3AL0Smvc7LNLEVPNTS/5vyAFel53Ml4cR5XAdHBv
 f5oa+oVqzrLSh7lnKi38WGpalBNcX5mZeEqbN6AqKOo96OiLOZA8o0ZI/ w==;
X-CSE-ConnectionGUID: lk9GjwP7TG2kignK9AVS2A==
X-CSE-MsgGUID: 8EztR2NJQSuA8DTlc8m/hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="94343300"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="94343300"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 09:58:52 -0700
X-CSE-ConnectionGUID: JZMkl88wRvSZek67q0T1FA==
X-CSE-MsgGUID: m4Ti+pe8SYuFu4VbOCgAbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="251957321"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 09:58:51 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 09:58:51 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 9 Apr 2026 09:58:51 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.62) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 09:58:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UggYVz6Ge/gEYzUZETuB+PVN7MgwolIQYfc7XfxaF7B1vLunOoF6GxkrdauR0f2EwSjbzhCXCHOamsJ4XZmgHLVubp46q+xTBQM/8kmywPv4wzHZkib4KBHRK28V8cdjHTyXxc4V+7Or/mtGV4kHwf7ELjK/Z/YsujcVGWuVX4tTwLu7f5NUEofTT9Pkdabi6Uhvno6t5AOwEDHlXHF0Xkm1JX/vCfBAbgO94pSGVLHUw4Tzb8FYJ+oizCoy7vSbRjUfja9+jI/bUHVPPbSXNVTg62tjF7Ud7rsLLt1+QQNTeutJR8pg9xGyM4FLrsJFc8GgxZH8gOlucYmqDVHY3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C7vh0WpDfWHlYf80SfHaAYKiRlBrUin5UULlQE729HE=;
 b=j+0O9ZIdEc1exokQbiLV08d7QIla86LzCOECKHPT4bPMisTRQ/GtcAk77FoH+CA5xF4BeVA6di2TFZLUNFv6tTacb1FbC9HzQFwc27Z6xhIJHlM6j9cY0fIHWlQeSBGo9CgJNfCSAeaZIfd8u/kuIpAcI7uFtjFUPkx+t9pVNIdye35dIlmzQzQblkf/UVFPibvA5FVo1RV1nnJwwsF1qznuEEEbWd99JE2FD2pHo14CU9IZ1aeJK7JAx30jYXYYdDBdMbmlIZNFQh+HYUH+QgylFE68nIiy24h9uBwOU95jPH990M0PSdzEuEydUWQqWu+hoxiIcNeCTCegDiyWRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by MN2PR11MB4677.namprd11.prod.outlook.com (2603:10b6:208:24e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 9 Apr
 2026 16:58:48 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%4]) with mapi id 15.20.9769.017; Thu, 9 Apr 2026
 16:58:48 +0000
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Purkait, 
 Soham" <soham.purkait@intel.com>
Subject: RE: [PATCH] tools/gputop: Fix zero output when stdout is not a
 terminal
Thread-Topic: [PATCH] tools/gputop: Fix zero output when stdout is not a
 terminal
Thread-Index: AQHcwqewLJGx1IHYZkuGKgamtvxxWLXToqgAgAMgBgCAADvX8A==
Date: Thu, 9 Apr 2026 16:58:48 +0000
Message-ID: <PH7PR11MB8252E90D15AE2B74B4D7133F89582@PH7PR11MB8252.namprd11.prod.outlook.com>
References: <20260402134522.108322-1-vidya.srinivas@intel.com>
 <20260407133940.134931-1-vidya.srinivas@intel.com>
 <20260409132304.pchgqzvvrru2evfg@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260409132304.pchgqzvvrru2evfg@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB8252:EE_|MN2PR11MB4677:EE_
x-ms-office365-filtering-correlation-id: b9f5f741-796e-48e8-95a3-08de965944b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|38070700021|22082099003|56012099003;
x-microsoft-antispam-message-info: nEBLNMtqJ7rfO+7azpViBZFt82pqcdu/VGDn93xPHbPGMQPQTsoEIlgTwt1v5YzylHh0tnF/vjBl134gHVhMB7dafidQ62ZOwvVVilN1oqhYwvcBEB11QzFQRzHRRhH4EI+gl7ACdOqf0D5h9kbtVMMSykC6jvA6JwDtunhKI0uGOjoAk776oPYaWsZ9SZtAXhpgB0kDHoKrhRdOz67EEaJc5I6ZXeU6+94TXA/AcFdsh2sE4p4YFFeE7LRTq8pTD5dAjRdsjdKtCv3zzeWFxT6WQsKQyspmNpDahBcVq8mIcnVeOHYySEoJpb8dY/xnnveKidNkiSXOVQkTxVlzzFHnVt4tXTBC4hMA/KiOU/xlpPkFQkykbuiiC/grm71CSHpWwuj7VWsetgAOYfhft4ruEUCDNeRlAcmZo4ZnKDcfCXTY+NEy7TfQo2+1AGvW/vtZe1u3efNCGcorZxbokHOx85xHKGPiL0uPxPcsQkmmxJHv62n6UeGP7tjFDVh5KjmGnuqVFcWxhDBsnH5qBlHj4zgNQkcvXJsr0S2SR6rjzcb2yJMMDvC1oR6MD1FMryY8R4uK2nK27JXENUwhm5PCwGEa1O/BbEe/4X8IZArdHeQHIEjwzwGOzbZ9vXBweuISIwncrpJRKf+6/3zhMvNXvi6puKDmIvZzDe2tNHTW+ZJwVd1Dc2LmTkROEzQu5wGKfuKFOsmEui/8FuUurrg28HHBZGR7ply9YnmOcBtiy2OD+Kq3/fUAmUNA3JgXIBjPE7ohD5VwVFCADylprgGX01hRTAduKy0+AtBVv0M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(38070700021)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NUFUZGZrSVhSbm94Y29ERDhZTmNic3ltekhUMzZnMUJMdTB0cnduMVRhdmlS?=
 =?utf-8?B?WXVEV1ZQSU1HeklPNTJWN1lkSUxCK0RVMXBtZFplbXBDQXBXQ1dwaUJSVlA3?=
 =?utf-8?B?ZDJlRjJBQ3F1bWZCV0tOSUJoaWZvNkdhdEZXVFp2RmNLNzRCZVI0T2pSNFl5?=
 =?utf-8?B?SCsrdHZwRFhOLzhpMUpUWU95Q3RFYnRRdWNyUzhwOEVjZk9kUDNDdU1aSDJj?=
 =?utf-8?B?RXp6RGlZMnZDVThVbjJmWHVEeWF5blJYS1F4U2MxcWRhejkrbWJzZ2xMaysr?=
 =?utf-8?B?S3lONlpJL0ZXL3lIR2c5bmNtVE5sWE5rZzRMdC9XcEhoV1pOVHBvZzBUWlJx?=
 =?utf-8?B?b3hpU3BJcGIxeC9UWWNuYjlHdlErZ3VZVGdkVDM4NW5ZcUtMaG9ZNmYzSEhS?=
 =?utf-8?B?SXpiVkFzbys3eXh2SnZqZFdFZzRrOGo0V3J2YmJHY3dla295NTBBekhGS3dl?=
 =?utf-8?B?RVFZVGZRUDc2NWoyRUs5NFdyL2dsZHRTRE9kbzhPbUY1blFmREpsYnJ0c1Vu?=
 =?utf-8?B?cHQ1OXNaSmEzZlVyaDVkZ3o0Z0E0K09hZ09HTS9waUxkWmJuMlh1SEJob2RS?=
 =?utf-8?B?czlFUGhocnN3NDljVXBUSVBZMkRJczVyaVB1ajAxY2tqM1FSUE9wblUyMENO?=
 =?utf-8?B?OVNXNzBOcm9xa2ZvekprUCtxWDU1enZ0OUFkeTNyTHJGc2Z0QnR1Ti9MZ2NO?=
 =?utf-8?B?Q1pJdTM2NVJsNStuVzNlZk9jS21CdC9vR0dWcVdBTHUvSkduRnB0NkIzUkxm?=
 =?utf-8?B?R3U1a0R0N0xDcHNrSU5sSW02eWxkVTlZZ3RuOVhuWmR6L3lYam5wYjVnQWFq?=
 =?utf-8?B?TlByY2JmMyswM3hWZjZwR0s0Mis5MHpLajhnUUdTYmtKRGFHak5QWjNyaTZI?=
 =?utf-8?B?d2N5WmRJMXFlNkMrUVR3OTFCalQvL3o2WE9FWkFMakhQWjdhK3dIZnk4bUU0?=
 =?utf-8?B?aG9Da242aTBTWXNwdkE0Qm5QMERTL2JSdzI4NlVDcVR4MThENDNyTEV1dkR0?=
 =?utf-8?B?elRweDZIY1o2VHR2dDBuUnBSa2wweEF5UkZ4NWROTUJRSzNpRkFCRFhwMk5h?=
 =?utf-8?B?MXZRUXFxTCtFMmVJK3A2QVk0OFN6czBJNlI1Y2tDY0dha0dmSWkrYmtUajh3?=
 =?utf-8?B?WWtpWXdSWXkyUDE3NmZyRTczR3F5cjU0bHhGNmRESXdWb3pGUHBMTkZjRjdI?=
 =?utf-8?B?SVREM01MVEkyRjRKbFQzSnljemp2KytXSFVDN2k3N3ludk9JZ3U0eXVTdTAw?=
 =?utf-8?B?YTNmNmlnKzlIMThQMDBTczVZSXBvY2p5bUE0NnlyNW1nK3U5TEZPYnh5eEFJ?=
 =?utf-8?B?QUV0UTJhVkNXVzhhVzlaNk5MWk5KdlI1YnlVM1VvS0tDY1hCSzBsMFF2OHg0?=
 =?utf-8?B?L0pqTmZkVGVJNFZZV1JrS21jVHpkMUtKbVNORWd0OTFReXo2c3NPVVhodlZp?=
 =?utf-8?B?OEhIKzJGSG5JQlNZdkZiT05RbXNhcXk1Rkh0Z2Rka3l6eXRnTW1lU2YyK0pw?=
 =?utf-8?B?dm84TVdWZjZnd2FaVHc0WENqSGRMMjlXS0lmTWxudksvL3MrVnZ0YTQrRGs5?=
 =?utf-8?B?WjVUOFRndmRUUzRvdm1CTk1YZklXMExWVHkrQVJRMVpSWGcyQ2orMWQ5cFp5?=
 =?utf-8?B?RGswZHltYTVqeDJUZEM1YmFYdWJ2YllrSDNrWERIdnViVjh4dU91MC9JSlNV?=
 =?utf-8?B?bXNQdlBWeVV6NW1IQWtMOHFseWJaRnNSVG5OcHNITjcrNVgvYjhsMm43WDZ5?=
 =?utf-8?B?R3FhalhwN2pzamM2cnM0QnNwNHJGbDQxZTF4YUk3Tkk0dVZEZ3JLbTU5Zktx?=
 =?utf-8?B?cVV6alRqSzh3R002TEhhZmpIajllU0tLMm5hWDI3OElBS3EzaDR5NmpQL2VD?=
 =?utf-8?B?QUcxMFB5MFl3Smdld2lrMkRUaUJ3TTdmVU0zTUtTRURWMWZGakN4VitTc1Rm?=
 =?utf-8?B?b052REpCaUhXdHRBbk5HMFU2WlZZYXkwSDdLMUw0TEdKZjRkUEhsMHpJa1do?=
 =?utf-8?B?VDJhaUNWVFhPdUM0TWxYZnBDaG5aWjI4aWhHR1I1ZmJOcnB2NUJLT0NjSE1R?=
 =?utf-8?B?OHIrVU93K25IYmREVnJ4MFpEdjgycXI5Q1R2UFY4SHE2UlZCbEYyODR0UmNy?=
 =?utf-8?B?WXBOQVVQNUNGV2RhbHFmWEs1M3pyenhxakNVMVJIVGwrZWkwRXFlaWRSNlJB?=
 =?utf-8?B?MWpwV2JTWGQ3ZHhDQ1lEaDhYWVNtay8zVDRZaitLU1orOGVZNy9lWEdEVzg3?=
 =?utf-8?B?emdrVGdhcGNicnA0RHRRdjdacVJWekVIaldtazgwRCsvVU1vMTNUaHpVWjJD?=
 =?utf-8?B?ei9rRi9JNHJmcEYxWW1tL0hPY3FYSXQzOVpMR2tNbHp1QmNub1hkdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: vrc2YttZlOLH+4WV03xSz2NX2rUfQVWrbLzwTjiZsgnWSaarW4vtZQrAhC8RSFwEx+5EmTl3ZWJU3jcqURbeKsJRjo0RJBSIiAMzKcAQcMU9Nt0+CnRwZjA71fYDEpKpMFFFA8Otz6lO7DqEfIg5VdlCIYzruKVWQhKutrprozufZXX99hda3z5cWcGfUJydLuqxYljladJeQ6j/ve1pycHEypMyUd81pL/R1atxEy5NsxTvSAm1tftX/GAQ8woJlLxXo+o5EcJobtIgD10X5BubC+NLykHK8TNxZp8V/nzs8MBYBU1CjibNO1USfcs14EYyx+EN2iPUDDpNb4zRGQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9f5f741-796e-48e8-95a3-08de965944b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 16:58:48.1664 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EAJMZs7zCevgCzXDLVwYtnnLukU5HTdsbCV3w6bZJ/b9YECYvdWMe8D5SMuGtRTrkOmUUD0hMYXvPajsVbw2A0knRfYn+uHDRDBLRoeyoJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4677
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2FtaWwgS29uaWVjem55
IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiAwOSBBcHJpbCAyMDI2
IDE4OjUzDQo+IFRvOiBTcmluaXZhcywgVmlkeWEgPHZpZHlhLnNyaW5pdmFzQGludGVsLmNvbT4N
Cj4gQ2M6IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBQdXJrYWl0LCBTb2hhbQ0KPiA8
c29oYW0ucHVya2FpdEBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHRvb2xzL2dw
dXRvcDogRml4IHplcm8gb3V0cHV0IHdoZW4gc3Rkb3V0IGlzIG5vdCBhDQo+IHRlcm1pbmFsDQo+
IA0KPiBIaSBWaWR5YSwNCj4gT24gMjAyNi0wNC0wNyBhdCAxOTowOTo0MCArMDUzMCwgVmlkeWEg
U3Jpbml2YXMgd3JvdGU6DQo+ID4gV2hlbiBncHV0b3Agb3V0cHV0IGlzIHJlZGlyZWN0ZWQgdG8g
YSBmaWxlIG9yIHJ1biB2aWEgYWRiIHNoZWxsDQo+IA0KPiBJIGNoZWNrZWQgYW5kDQo+IA0KPiAu
L2dwdXRvcCAtbjEwIC1kMC4xID4gb3V0DQo+IA0KPiB3b3JrcyBwZXJmZWN0bHkgZmluZS4NCj4g
DQo+ID4gKGUuZy4sIG9uIEFuZHJvaWQpLCB1cGRhdGVfY29uc29sZV9zaXplKCkgY2FsbHMgaW9j
dGwoMCwgVElPQ0dXSU5TWikNCj4gPiBvbiBzdGRpbiB3aGljaCBtYXkgbm90IGJlIGEgdGVybWlu
YWwuIElmIHN0ZGluIGlzIGEgcGlwZSBvcg0KPiA+IHJlZGlyZWN0ZWQsIHRoZSBpb2N0bCByZXR1
cm5zIC0xIGFuZCBjb25fdy9jb25faCByZW1haW4gYXQgdGhlaXINCj4gPiBpbml0aWFsIHZhbHVl
IG9mIC0xLg0KPiANCj4gQWRkaW5nIGZldyBtb3JlIG5pdHMgdG8gd2hhdCBTb2hhbSB3cm90ZSwg
aXQgY291bGQgYmUgc2hvcnRlbmVkIGEgbGl0dGxlIGhlcmUNCj4gdG8gc29tZXRoaW5nIGxpa2U6
DQo+IA0KPiBXaGVuIGdwdXRvcCBpcyBydW4gdmlhIGFkYiBzaGVsbCBvbiBBbmRyb2lkLCBpdCBj
b3VsZCBoYXZlIG5vIHRlcm1pbmFsLCBzbw0KPiBjYWxscyBpb2N0bCgwLCBUSU9DR1dJTlNaKSB3
aWxsIHJldHVybiAtMSBhbmQgZnVuY3Rpb24gdXBkYXRlX2NvbnNvbGVfc2l6ZSgpDQo+IHdpbGwg
bm90IGZpbGwgY29uX3cvY29uX2guDQo+IA0KPiA+DQo+ID4gVGhpcyBjYXVzZXMgdGhlIG1haW4g
ZGlzcGxheSBsb29wIHRvIGltbWVkaWF0ZWx5IGJyZWFrIHNpbmNlIGxpbmVzID49DQo+ID4gY29u
X2ggZXZhbHVhdGVzIHRvIHRydWUgKDAgPj0gLTEpLCByZXN1bHRpbmcgaW4gemVybyBvdXRwdXQg
YmVpbmcNCj4gPiBwcm9kdWNlZC4NCj4gPg0KPiA+IEZpeCB0aGlzIGJ5IGluaXRpYWxpemluZyBj
b25fdyBhbmQgY29uX2ggdG8gZGVmYXVsdCB2YWx1ZXMgb2YNCj4gPiA4MCBhbmQgNTAgcmVzcGVj
dGl2ZWx5LCBzbyB0aGF0IHdoZW4gaW9jdGwgZmFpbHMgdGhlIGRpc3BsYXkgbG9vcA0KPiA+IHN0
aWxsIHByb2R1Y2VzIG91dHB1dCB3aXRoIHNlbnNpYmxlIGRpbWVuc2lvbnMuDQo+ID4NCj4gPiB2
MjogVHJ5IHN0ZG91dCwgc3RkaW4sIGFuZCBzdGRlcnIgZm9yIHRlcm1pbmFsIHNpemUgYmVmb3Jl
IGZhbGxpbmcNCj4gPiAgICAgYmFjayB0byBkZWZhdWx0cyAoU29oYW0gUHVya2FpdCkNCj4gDQo+
IFBsZWFzZSBhZGQgdG8gQ2MgZGV2ZWxvcGVyIHdoaWNoIGRpZCBhIHJldmlldy4NCj4gDQo+ID4N
Cj4gPiB2MzogSW5pdGlhbGl6ZSBkZWZhdWx0cyBpbiBtYWluKCkgaW5zdGVhZCBvZiBhZGRpbmcg
ZmFsbGJhY2sgbG9naWMNCj4gPiAgICAgaW4gdXBkYXRlX2NvbnNvbGVfc2l6ZSgpIChTb2hhbSBQ
dXJrYWl0KQ0KPiA+DQo+IA0KPiBTbyBoZXJlOg0KPiANCj4gQ2M6IFNvaGFtIFB1cmthaXQgPHNv
aGFtLnB1cmthaXRAaW50ZWwuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFZpZHlhIFNyaW5pdmFz
IDx2aWR5YS5zcmluaXZhc0BpbnRlbC5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IEthbWlsIEtvbmll
Y3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBWaWR5YSBTcmluaXZhcyA8dmlkeWEuc3Jpbml2YXNAaW50ZWwuY29tPg0KPiANCj4gWW91IGNv
dWxkIGtlZXAgbXkgci1iLCBzbyB0aGlzIHdpbGwgYmU6DQo+IA0KPiBDYzogU29oYW0gUHVya2Fp
dCA8c29oYW0ucHVya2FpdEBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFZpZHlhIFNyaW5p
dmFzIDx2aWR5YS5zcmluaXZhc0BpbnRlbC5jb20+DQo+IFJldmlld2VkLWJ5OiBLYW1pbCBLb25p
ZWN6bnkgPGthbWlsLmtvbmllY3pueUBsaW51eC5pbnRlbC5jb20+DQo+IA0KPiBQbGVhc2Uga2Vl
cCBvbmx5IG9uZSByLWIsIGFsc28gaW1obyB3aGVuIHlvdSBjaGFuZ2UgeW91ciBjb2RlIGZyb20g
dmVyc2lvbg0KPiAxLCB3aGVuIHlvdSBnb3Qgci1iLCB0byBhbm90aGVyIHZlcnNpb24sIGFuZCB0
aGF0IG5ldyBvbmUgZGlkIG1ham9yIGNoYW5nZXMNCj4gdGhlbiBpbWhvIHlvdSBzaG91bGQgcmVt
b3ZlIHItYiBmcm9tIHlvdXIgcGF0Y2guIEhlcmUgaXQgd2FzIHNtYWxsIGNoYW5nZQ0KPiBhbmQg
cmF0aGVyIHRyaXZpYWwgYnV0IHBsZWFzZSBrZWVwIHRoYXQgaW4gbWluZCBmb3IgZnV0dXJlIGRl
dmVsb3BtZW50Lg0KPiANCj4gSW1obyB5b3UgZG8gbm90IG5lZWQgdG8gc2VuZCBuZXcgdmVyc2lv
biwgcGxlYXNlIGp1c3QgZGlzY3VzcyB3aXRoIFNvaGFtDQo+IGFuZCBhZ3JlZSBvbiBmaW5hbCBk
ZXNjcmlwdGlvbi4NCg0KVGhhbmsgeW91IEthbWlsLiBBcG9sb2dpZXMgZm9yIHRoZSBtaXNzZXMu
DQpXaWxsIHRha2UgY2FyZSBuZXh0IHRpbWUuDQoNClJlZ2FyZHMNClZpZHlhDQo+IA0KPiBSZWdh
cmRzLA0KPiBLYW1pbA0KPiANCj4gPiAtLS0NCj4gPiAgdG9vbHMvZ3B1dG9wLmMgfCAyICstDQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+
ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL2dwdXRvcC5jIGIvdG9vbHMvZ3B1dG9wLmMgaW5kZXgNCj4g
PiA5YjJlOGNiNmYuLjBlZDVhZjQ1NiAxMDA2NDQNCj4gPiAtLS0gYS90b29scy9ncHV0b3AuYw0K
PiA+ICsrKyBiL3Rvb2xzL2dwdXRvcC5jDQo+ID4gQEAgLTYwOSw3ICs2MDksNyBAQCBpbnQgbWFp
bihpbnQgYXJnYywgY2hhciAqKmFyZ3YpDQo+ID4gIAl1bnNpZ25lZCBpbnQgcGVyaW9kX3VzOw0K
PiA+ICAJc3RydWN0IGlndF9wcm9maWxlZF9kZXZpY2UgKnByb2ZpbGVkX2RldmljZXMgPSBOVUxM
Ow0KPiA+ICAJc3RydWN0IGlndF9kcm1fY2xpZW50cyAqY2xpZW50cyA9IE5VTEw7DQo+ID4gLQlp
bnQgY29uX3cgPSAtMSwgY29uX2ggPSAtMTsNCj4gPiArCWludCBjb25fdyA9IDgwLCBjb25faCA9
IDUwOw0KPiA+ICAJaW50IHJldDsNCj4gPiAgCWxvbmcgbjsNCj4gPg0KPiA+IC0tDQo+ID4gMi40
NS4yDQo+ID4NCg==
