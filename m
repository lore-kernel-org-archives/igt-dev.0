Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997DDC021A0
	for <igt-dev@archiver.kernel.org>; Thu, 13 Feb 2025 22:39:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B0010E07D;
	Thu, 13 Feb 2025 22:39:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ui7KUHto";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F8610E07D
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2025 22:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739486353; x=1771022353;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=D4DPNHBdoyzablhYiKk7caIWZj7RcG0LNqXMObehnrM=;
 b=Ui7KUHtozh+dK+3WQkB+/9z71GZZMyNRwDAe6h75apjuKDVqiDCMX6DG
 D37XiVJ+v2ZJfXF0M/6QF2KQxedl5R1AqRtqlIdquUpxI2Vqx54HxiL/5
 h+6mJCJg7zfGc0d6lQHaj8rhL9TmkpTaEOvV+Cbi+Hqc3lFQnL6JWYhEy
 ngpNsm5nZHEwOKyaLupLmo53C6vzGPNHAs/CEAGl/r5oe+WlaqtEkbuS5
 K6JxTQB5zJrLa7vO+TKYf66aSsr4O9SCeKVmKl6oVeYH9C6e1UsTwfVoM
 74MB3rbEbzRycx3ZuQgd77ZE7cqM+wff4YJmv28kUJHRzdFpn0jeYhRuh g==;
X-CSE-ConnectionGUID: mhA+8nkPRAeWbdtDplgtsA==
X-CSE-MsgGUID: CEiTqcq+SuOD7sYRQkAatA==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="57619788"
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; d="scan'208";a="57619788"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 14:39:12 -0800
X-CSE-ConnectionGUID: rWzSrAALT2G5LykGy/17rw==
X-CSE-MsgGUID: +JXQraslTbysxl38c2z5/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; d="scan'208";a="113930014"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 14:39:11 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 13 Feb 2025 14:39:10 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Feb 2025 14:39:10 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 14:39:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QcLwWGBQITmpmT/7DxEH5RLKbHzIG8YRpyKPOEcPKX0qanSxgM3THNkQCHmXGREhvw5HlKoVHDuowpc7y/4jmZPMh/h9/hb7g9lXEMx4cZGAgUBUC4Cpq6Z9d1HtbkutYzuo80vC0E6QpsMVlZN8l28cuHOa8rqdS5dwi6UM4k5v54SSrS99Rydv0D+9rZ0mcm3c+NBTnPCHjj4ntoFoBDa0SfyLF9pLGkrawxIhPl027n1VKPzugsSI3xlgQdweGaCuG+tM/Cqd+RjSz+n47E7NZv0kRTym9HbPNTp2PvNW/5pvdSDmyePpLZo8n0DJqGJT9gTE8CWoA2n1c7Wadg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4DPNHBdoyzablhYiKk7caIWZj7RcG0LNqXMObehnrM=;
 b=VcJyJqxR6LVhcPxqtmgp48CibnZlB8gi+YUNJVXygHiTmryta8d8BTWHSax6hTej/raAInWr2vr2XuQ4kVx6MSyqHpQPp5i0Fl0qaYV3R/fTsM9n3LZbuM5qJdul7YzwEZ9ocidW7KtILFtN9yQp41AR203R5dF6RhBvn2m49YfjgrJrscOinnKqEU0AIPuVMp7e/BbqS91l8ODQP3qcB43Ge6ti87vsz87YzCQrUZuAYs8O+1JjXPzEBFYD0O5gA727P6Rwwaj/+Pj/c1R9VXDSBW/YyRztaCQhLFFCsaczTxgjvWa+40CaJR5yUNViD2JDpcPogqs85SSxKvWqwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SA3PR11MB7526.namprd11.prod.outlook.com (2603:10b6:806:31c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Thu, 13 Feb
 2025 22:38:52 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%5]) with mapi id 15.20.8445.008; Thu, 13 Feb 2025
 22:38:52 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ceraolo
 Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH i-g-t v3 1/7] drm-uapi/xe: Sync with PXP uapi updates
Thread-Topic: [PATCH i-g-t v3 1/7] drm-uapi/xe: Sync with PXP uapi updates
Thread-Index: AQHbfa/B9x21lr8TFEurZsRMbVDTPbNF1LgA
Date: Thu, 13 Feb 2025 22:38:51 +0000
Message-ID: <1b3bd2ef70186f7c787ec6f8788c4e5eeca9e336.camel@intel.com>
References: <20250213003904.2059770-1-daniele.ceraolospurio@intel.com>
 <20250213003904.2059770-2-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250213003904.2059770-2-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SA3PR11MB7526:EE_
x-ms-office365-filtering-correlation-id: 7f5b2891-2c47-44d8-4b0e-08dd4c7f30ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Nnp6KzM0NkczQ00xZFVRNUMwOHJGdnNkNzlqa1A4Y25Sb2RzbnNQbkpsVUVE?=
 =?utf-8?B?dzlSQ1pMc1RMNmxOUnZkRFNzaTFueXdWQTc4VlJpQldsSG5lM2dWM1VFdE4w?=
 =?utf-8?B?TVNuMzN2TXlmc1p6ZjRVSEtva0cxQlZSejRDTTQ0aXVCT2U2dE8zbisrMk5u?=
 =?utf-8?B?TEdYZWFGektFb1J5eVdadG9raFFxcTNaRndWMEZoQ0ZrN2pUT2RqNjh4dTFK?=
 =?utf-8?B?blZ2SDE1M2xJMjhnQkltUSs1RW1TMFF0cjl6RnFuTGtnVlFwT1BoRWxOaHdS?=
 =?utf-8?B?Q2tYZ0paMGlOQ2tDaGFWNmxITzNXTlpZRHliak90TzlPNDhKenFWVGh3UlVY?=
 =?utf-8?B?T3gxSlVYSGJWZ2xyaSt1NUUvenJHVnUvN3VTUjVqaUlVaEttTElGNDZUUWFQ?=
 =?utf-8?B?cXhXZXpkcGJwdjZBcjBXSVkvVnBjN0pycHQyRzNiTTRLQU43eWZHM3g3Z1Fp?=
 =?utf-8?B?czk0QnRPOFFBZFpxeWZJaWpUZVo1WGlaNFliNFhxakhYNzBEOGZGS0pnbEJr?=
 =?utf-8?B?alFBZ0ZDRXdMdE9EZk94OUFQUWhGYTErOFd2eXhZdEN1UEhzdUwycktFSnRW?=
 =?utf-8?B?T3JhaTVNUjRiWWJnVmVIRkdoanRYTm9pNzAyT0dJSzFMN0Q0bUVFQWtxZnR5?=
 =?utf-8?B?ODJwUFVsUnA0bWJyNkovbEJtZFdMK1pXaHhXVVNZTlplK2dvaHJpeFFEUFEx?=
 =?utf-8?B?U0RLUXBMRVBzMnE2MzEvM0dBOEFmM0VPWCtaY1NFMGFOSUN3S05xV0xHd3Vr?=
 =?utf-8?B?ZjlRamZTbkJiZHRQNFhhU1lYUm5GTTRtc3JTOVlaUE1GYlZBakhaZGRTV2kx?=
 =?utf-8?B?QUJ4aXE1Rml4Z3N1dEZ0bjZkeUU2ZDhCYnA2MTNlcksrWGpGY29idjhLeldz?=
 =?utf-8?B?MkpBL0xESUZqU1VmcUF0UWhwRmR0Z1NiRjN5UVZwcHBuSVR1cEdCUzEyaEYv?=
 =?utf-8?B?US94MmhRRHhOSHVKbGk3aFBaMWNKbXFrbi8wY01pa2FYRGUzdnVldkZZNTAr?=
 =?utf-8?B?ZWl0RHg0TGxINmRTUWpIbFBpQTc0MFZyV2w2bnhNdUNubWxBQkVLRFlrZmk5?=
 =?utf-8?B?UmVJWTRsYTYyL05VZHp1Y1RGdSt6SmY5MmM3d3Y1Zy9WSWU5clB4SGxiRlRW?=
 =?utf-8?B?TVloYktZTEtRZ2VBUVZiVHJwTGViYVNaaTJHQlp6SE45US9kWTVRVHNybWNQ?=
 =?utf-8?B?TjZtSzNHYVRNZEgyaGZoYkFqT3VrYTJwWlg2VG9mWGx3MDBHOWpXNElkT0JK?=
 =?utf-8?B?UlVUNHdycXlZWTZNU1JxeVBCUFphaHcreG1VNjE0Zk01NzVpSXZ4NVcrOG9L?=
 =?utf-8?B?WUExOXp1SnBlY1ZpS1BJTjl0UXZCb1VITUJCUTJnSWV0dEZrZUhGbTgvY3Na?=
 =?utf-8?B?Vnkwa29DekFML2RMWmExRDJuaEJmVi96WWxxN014L05tRzFzcmFTU3FSZkYx?=
 =?utf-8?B?emRYelBjalNDRllCaEN2WkRZSzUraWtwdlBCZDZXODhSNE5mbndsd0M3dkhQ?=
 =?utf-8?B?aUhZREZVWEtpaGZiemFUbkZUSUdDN2tvUHpyWVpuekszNXh4OXNRWFlMQzNs?=
 =?utf-8?B?b3lWbEFuQVBmZ2UxQXZqTWVRbXFLVDM3M2lncWhCbUFyWG1sRG9UNHF4Ty9L?=
 =?utf-8?B?L1JZNngzRkZyVHVzTXNEM2p6RlF3bUJLbmJBMU9uY09uN2FzZkE2NTVwQ1VR?=
 =?utf-8?B?ZGxjb1dadTJ5dWxRMy9HSVN4WHBiMnlYbm8yMGZaeTZ1UlFUSTFZdDM4c1Rm?=
 =?utf-8?B?TlZ6Y04yOFd4OHY5TVUydlR1K2ZtcHlLVDBPbHZzb1NFalpLa0RxRVE2c2Jv?=
 =?utf-8?B?MnBlcU1nMlpyMGdtWDd6WVNuQkJMOUdWeUlRQ1NmS1FJaVNueGhEWExlVlY0?=
 =?utf-8?B?OGVpdWJKbzlXWGo5NEEzWHBSQkdGZUxrdksxZmJoaXVqVHlVc0tsSUxZa25l?=
 =?utf-8?Q?QdTS9sMtBNN+GbYWHbdFaJTtJps5SF1J?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cXh6NzlpU2N5aDJ5NVNlcG1CRDdNazRpbFJHL0Q2SFovMWhPYlo5SXIvK3ND?=
 =?utf-8?B?Qk1CTXpEazdRTkFMK1BDdkQzRmtHb0hqcE5wdlBCd2ZJd3FDWjF3cjlIcFVu?=
 =?utf-8?B?c3dKbFgwSCtYNitPQU8wZTFSNHh3ZW0rNkZWd3o3OTU0WjkrZytHMXBXUnZC?=
 =?utf-8?B?cWt0Y1MrbzgwLzUxSWdSS2Jwc0N0UjY0amVBTnRtUWk0WWtaL2Z1Yk16SGNj?=
 =?utf-8?B?OHdxc0lObmVvNCtTcXR0amd5N3Q2dm9EMTlBVjYyQUNRSXViWlZBU2MrSkN5?=
 =?utf-8?B?bmNOQk9kNnYxNlBPYlB6M201Z0NTa21SOHVaS0lsdEsvWHMvNXJFSUx2TUxL?=
 =?utf-8?B?d08vRjZ5YWdZTWlMd2xjcGZtZmhaS3VmMVl3ZTVObm5OdDZWdmlTQUxTQnll?=
 =?utf-8?B?dE10RUliYWdBR1g3Z2JaUDJadm9nbXVHQk50R0c2VEd4OTEwVVJtSUxkdWtW?=
 =?utf-8?B?U2MvZEJWakprZURJeW15TmIzNENmWHN6djBzT0c2REtZMGVJZWd6Q3FOcDFz?=
 =?utf-8?B?MGM3NEV5MmpQdHV1YTNwcWNZY1FZRGhHS3dSaEhlODJudUFGTmxLVldHUkt4?=
 =?utf-8?B?YTZPaGxYVW50T2FIYTJXTGExVFF2Q3pyYXF1WW93S0hydGZEd1pLZWFWazdq?=
 =?utf-8?B?K2Ixb0drME10SXM2Y0xrOUhzalpzbi9TSDh4QzRLRU9oQ2dTYmRnYW1VRDdu?=
 =?utf-8?B?b0o2Rjd1ekx5bVhQWWpnT1VDUVY1dG83dldzdWpRSnhJSjU4WXVjdHV3SVVm?=
 =?utf-8?B?c0Z4aGlOOHZhM2J1a081Sk5xYkF6OFpSd3VKZG0wc1RRT3lsZ2RzYitDNnQx?=
 =?utf-8?B?ejRpbXZRZm5MWFhrS1c3U0NtNmgvZDNZWk52alhTY2F5VEdLZUp4NHdZYXl6?=
 =?utf-8?B?b2hBU2RjalZhN2FrMlNmcGhkYUhjWGc1RFI1Vkd5NmlOYjlDQVcydXN4ZDhI?=
 =?utf-8?B?b3UvWDZWdGJFK0laR2NMYnNJeVdnT0ZZaEY2b2E2bDVwUHZYU09DS2tUUWFn?=
 =?utf-8?B?Q0xUbUN2RUo2VU1iY3lWQncvUU92OSthemV3ckZ0eUFjS3dWYnBQLzY3Qmg5?=
 =?utf-8?B?anM1V1EvdWtXNFpxc1dUbkUrR0xsd3dOUUF2d0ZLMk9QSGpKRGVZUGRDNVEz?=
 =?utf-8?B?SnFhK2szOGJpM3RIakRaVjFYVUZwZmR5eUdjWDJmZTRHNVUycndBOFdmUGhr?=
 =?utf-8?B?TngwWE5RNzkvT0pMM1lMZmtMb2VvdE1XaFN0bXhlNnk0R2Exck1FeExKSnRp?=
 =?utf-8?B?VnFBVkJSS21yMjJlWDc5aCtGbk9pcmVDbVplL1llQ0FsUHMvanM0NGtsYm10?=
 =?utf-8?B?VHd0Qy9yV1NWc3UyeGlGVE45WlFvYXNnTis4cWV2ZTVVMVkrem9obXBBNmdq?=
 =?utf-8?B?M0U2WGZNSnl6eVMzVFVrQm1oTUwzSVlHTlRSR0ZuRkxXZ1d6ZUora1VnaXZJ?=
 =?utf-8?B?QWZXRGpiRHBWc2c1bExBdFc3Z1ZNOXFoQUhsNWV2Mmc0YWhxWlU4TFJadmpV?=
 =?utf-8?B?c0w3N0NhYU5OZDhHVThEZDZMNStNbU5zWkpYcitVSHpYczlrdUZRVWRpeTNI?=
 =?utf-8?B?N3ZMbWY4cGpJMkpkUW9lZzdMUTlzNGc2KzN5NmQzc3lWVG5tYkIxTzF2UHYw?=
 =?utf-8?B?Q2xFMzZ0WHJ6bGxzaSs2ejlJcW1HTnBWb3Zzd0ZZZi9LL2orYnUzN2JzYXZK?=
 =?utf-8?B?c2dESmYzb2lBdmI0eGIrcUtjeVZPMFFnMm4zVFlFbkI4TSs5L1RiekJqV0hI?=
 =?utf-8?B?M1FZRWRHMmovcVFEOEE5V28vR1lYUENXQXBBVTJVMm83QnY5cVltdVRhKytQ?=
 =?utf-8?B?SGZYRGtXUXRvNTJxQ0VmSm9QRWY4TDFLalBsdElkYVA2ZDNaRmVDb1M5UXZ0?=
 =?utf-8?B?UXFCMzVMaWFhbFpyKy82Yjd1WWUvVVJ5b0wzcG1EaTMzRENvcjNRMExJMzNk?=
 =?utf-8?B?SERPSWE5RjZWSmZicHl5dXdvNUN5aUZTZVpmcXFsRC9xN25icjZ3QUdtTDI2?=
 =?utf-8?B?bE1hc0NhZVhaQ091QVZtMjkxTFB2YVVHR0lNZW4xZWtMQmdLVVRrd3R1QzFO?=
 =?utf-8?B?VzUwbG56eExWMDQvM2lnazhPWElOZ0F4Z3FWUXZoZlFQQXIwR3hacUtyN2VE?=
 =?utf-8?B?VmFqM0xFS0M4YUkyWkZjOUNJRG5SaGlJSWpzaHpWQjFqZ0pIVjEzeWJZbjV4?=
 =?utf-8?Q?W8aBpO9vs1gj1a91Qic113I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <919A6B22EA4C3243BC367529263A4B8A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f5b2891-2c47-44d8-4b0e-08dd4c7f30ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2025 22:38:51.9412 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kpJeUB6+MNUv61jNStJjoVUXB2n9WbdxlJe21UIaZbI9TVNc1uoMcSGj2NuinLBrZUnhPmbIOB3fLA6l7dqBDSlmshwL1vlxaTSEoCdIVfNw3Qr/dbnhP4HUrfGPBsZZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7526
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

bm90IHN1cmUgaWYgYW4gUkIgaXMgcmVxdWlyZWQgZm9yIFVBUEkgc3luY2luZyBzaW5jZSBpdHMg
YWxyZWFkeSBpbiBrZXJuZWwgbm93IC0gYnV0IGhlcmUgaXQgaXM6DQpSZXZpZXdlZC1ieTogQWxh
biBQcmV2aW4gPGFsYW4ucHJldmluLnRlcmVzLmFsZXhpc0BpbnRlbC5jb20+DQoNCk9uIFdlZCwg
MjAyNS0wMi0xMiBhdCAxNjozOCAtMDgwMCwgRGFuaWVsZSBDZXJhb2xvIFNwdXJpbyB3cm90ZToN
Cj4gQWxpZ24gd2l0aCBrZXJuZWwgY29tbWl0IDQxYTk3YzRhMTI5NCAoImRybS94ZS9weHAvdWFw
aTogQWRkIEFQSSB0bw0KPiBtYXJrIGEgQk8gYXMgdXNpbmcgUFhQIikNCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IERhbmllbGUgQ2VyYW9sbyBTcHVyaW8gPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRl
bC5jb20+DQo+IC0tLQ0KPiDCoGluY2x1ZGUvZHJtLXVhcGkveGVfZHJtLmggfCAxMjMgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgMTIx
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9kcm0tdWFwaS94ZV9kcm0uaCBiL2luY2x1ZGUvZHJtLXVhcGkveGVfZHJtLmgNCmFsYW46c25p
cA0K
