Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1232606A321
	for <igt-dev@archiver.kernel.org>; Fri, 30 Oct 2026 17:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PjuI6YZZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AACCD10E7FA;
	Fri, 30 Oct 2026 17:57:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 033DA10E8BA
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Oct 2026 17:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793383001; x=1824919001;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ntnZ0ueAEiL0erPH6o0i2REYeoPvf+gFI7nIKWKXA2k=;
 b=PjuI6YZZxnJCDq2Cfm2q9dYjm1I0pr/AmGw4FldYA1b4gNoyw+K6T8z2
 I8TAeKJhV3uBH4kjBlc4gdfcslUWB+eedxEIICSJNNJzcQ4kZ6zJkRB/W
 YEBug7+We/cT25duIvMeYJroZ0ikR7uQQNGWzbfK3Atjdof0lsuxV+ubn
 q54Fp8SGYKeo7+duGu8RiitXOdX14Dr4Y1GTvmwD7pc6M/SsFMIX3v+yV
 Cy/wUmVFTYqtLZXIB4IvFCspHRm3VbW3VSW+a+vmFvcl1pQoW7GpH7+Pq
 I6lKF/nztTiyh3xGjAlnza1EQXics0ZQUU7xL+YYPrPcU7QWHOZfoSgJy A==;
X-CSE-ConnectionGUID: qgze2gbpT3OcLtQ/HYIG2w==
X-CSE-MsgGUID: TK+Yt3IZTIOaKEF6DWOaQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2256866"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2256866"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 10:56:41 -0700
X-CSE-ConnectionGUID: ujiIkBRzQlCa1IEzI9ggmg==
X-CSE-MsgGUID: AFRKbCynRJKX2fF+9uad4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5576503"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 10:56:41 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 10:56:40 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 30 Oct 2026 10:56:40 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.0) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 10:56:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uTCYwktt3yLbKB5pfI9rNy93Oj+l9BxnDKbQmkRfM39NuqJLJqadShWqgcYZ2d0ri4Hr1xE3Oe/3YmFs4Gw7RkxawoIeLI0wrxl/LiQgGggq1oYgnLzAZsZHQXwhHDhvMqQroQviO5/HcgbobHD+D5mvTB3DheTkeYQQx1vpg8gQibplNThiaaHgf4WV32cUtnPzJQu+D2PRE/U9jipj8Kt9wyqZuqfHTGw1KwNiqISb2sSCqOrppIuWuEVvzO6oYOC4pS/4MEUaTJ00ejNfNLccL+V/OV+zPhPSNnt5eaoOCiZ1VvOJWsxYcQYsw4C+GXnATlw2ZAiqW0+OoEbEFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+bAa4W2ZJe2t+RvUlk4D1pAg4cRRVbZqI0CFRe7w3BA=;
 b=YG4dDRrggsmrtvAq1AgpSUlmlIaVbV5v+qWSidORmk5yDA50e2XiIBIXEVwi6MNw9dc0KmZvbPj4UsDFnrvCtFtGI8xo9mkvGLi1j2F1NQuNcJOpsH54eXpGrf19vf9NMSWRIjF7grZU+zpGbL8y9trVyJAcXbEMWW4KNFMwiltTRElOS93/g+Lyn343+7fjtFIsWBdW5R7NfG6zeksgwbiO8YDBhbYIgyt0emT0nt1KCczf0Rkh9eUGcC5xYpXhp+qYK/a5+LyjnQGIA9SF9YpKElYqZmPtoZSc7bCUq2qpVVAzH90OrYXxnLr00dugGR8PqsOc1e+r9jKgcEtDcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM3PR11MB8714.namprd11.prod.outlook.com (2603:10b6:0:b::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.22; Fri, 30 Oct 2026 17:56:37 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%6]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 17:56:37 +0000
Date: Fri, 30 Oct 2026 10:56:34 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <harish.chegondi@intel.com>,
 <riana.tauro@intel.com>
Subject: Re: [PATCH] tests/intel/xe_oa: Add unbind/rebind test with an open
 OA stream
Message-ID: <auTaUn1QJSGSBjxQ@soc-5CG1426VCC.clients.intel.com>
References: <20261026233036.1589204-2-umesh.nerlige.ramappa@intel.com>
 <90bc9be0-75bf-4cd7-8095-e6c5c7f97c3a@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90bc9be0-75bf-4cd7-8095-e6c5c7f97c3a@intel.com>
X-ClientProxiedBy: MW4PR03CA0052.namprd03.prod.outlook.com
 (2603:10b6:303:8e::27) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM3PR11MB8714:EE_
X-MS-Office365-Filtering-Correlation-Id: c427ae28-4c76-4621-da8a-08df36af24b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|261026140227099003|18002099003|22082099003|261028144727099003|10067099003|56012099006|11063799006|261022105027099003|261021121427099003|261009223027099003|261022113327099003|261026121527099003|4143699003;
X-Microsoft-Antispam-Message-Info: cPa86hcWUev0zknSS5jxIioIqWrSuyjwNuPb2y5rtMntPGsOJWB00nbAHd36/U81VdwF4yTfeFrj+XMxkXXaomme+SXxNGZF0jqaNg/GxB1qxg5f6kKKdPfO5TvDHb1YCJ0/u/YPVbEPT1TpD1/yqvoLr+/NOcGlT5tNoV1c7yvQKzIEfGIDFZpY81lP/QBifGNLn8eo0kQNtpBU5XPF0WTHE9C+XUzoFdGNhw+oF/PxU4WMuWskt6NtxHpZVxJ4zUVTZ6gcWzA6bPNCF4nrgl3JWXWo6ph5fVPzfJCAX5cpblJftFLLWYJKc4mSDAIMe4C9B0jE5mxyl+B/kWFYrq4Ld1zYkgQPikZ54BSF/AUJeqs5hRQOm0cVAn46WJ4OQTg+P7aQNqZ0DsHVtO8Ne17C1Se3KsL5i/Cgnfbw7AY87mAscDLyJQ0tMs7rDBP5llX3ZJ5EL4zdvHpiH7U8eox6mJcjp13vrPMSvPOuI5ZzFzW1ga15l5sAudGQR3Lkk858wt07HzU2vasn+6orGUQ8zsYQv8m0i/1jTLyeppqeAJt7yFz/t4a/ayXBdf6lCo5AU7nTjXxwjxwCRQ5QGL1ReC5SI7l27ftE9xhdSaphrRfJ/F6tnJlaOEK/GD7s80bx5Nklp/BluCWwhdKY1PY9cR97MDiwKNkrpNIkAiI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(261026140227099003)(18002099003)(22082099003)(261028144727099003)(10067099003)(56012099006)(11063799006)(261022105027099003)(261021121427099003)(261009223027099003)(261022113327099003)(261026121527099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0Q4bWtITHNUZElPekhhUnFvZ0tFblJrQW1WTjE3TU40TWVyRXZuMHN6VFlt?=
 =?utf-8?B?UWVpd0VXSnNkSmViRVdoTHJ4eTZRLytNSm56R2FrZzM5VndnY3ZUMDBTZXJO?=
 =?utf-8?B?ZjFhUGN6TjdLTUN0UWtOOWRwQy9DK1dxL09kNWxmNWtPZFBsUGxjU2FpRzl0?=
 =?utf-8?B?Yyt2SUtlMmowSGVOT1ROK0szVjdWMXRKUG9pMHI2dGttNnFxb0FyWDVaODFF?=
 =?utf-8?B?VzduTElaRFdmeTM5QVRXNXRLNHdtV1NuaVpudDgwWWdaQ09ZMVdXcmZReFR5?=
 =?utf-8?B?VXJKZ0JPaFZvN2tqbEc5aEdaRFZKbng5UFdoQTNYeTF2aldmYm5ueXNYYmt3?=
 =?utf-8?B?TWtYU2VKZ08ySUxldnVXMGthd2cwUS9pb1puY0xTOW1SdVV0TE1za2kyYWpB?=
 =?utf-8?B?aDBQV0E1Y2RwajVuL1V6bFJ6a2VYY0ozeVl2VjRCUVo1VG9yWm9UT3hmU25L?=
 =?utf-8?B?MmQ3NHFUelBWTjVPWFRoZlpUL3R2VzlvcjIvVTJHaTZSZVJNZGJGcnBlSFVC?=
 =?utf-8?B?UVljbXZaNElFSzRHeGNwZTdBbVZPUTFrU0kyUDgweVpZRnFlODV5U0V4MXNO?=
 =?utf-8?B?a1R0VnZyNWlBZ25ZbjdlT0N1M0pJMVV6ZU1CY0xCaHU2M1A3YjBnM0ZVU0Za?=
 =?utf-8?B?akkrdjZRNzM2d201a2xpdXovd1BQdDNZY2gxTGlwWEVtRkd1Q1lDVzB5aStZ?=
 =?utf-8?B?VDRzQzRnbDZ5UmZ3TER1NG1kYlY2cEE0a0RkTnpmM3VXUEpYODBWNUVFdmtR?=
 =?utf-8?B?UVp2bGpqTlAvaEQzWTJ2dkwzUnVLUjhRenVlUTBUUHNDbi9taUFpejJyeUpS?=
 =?utf-8?B?bGtZZDFlMWhyRDdoZ3lpcmlpTTdZQkdUOG8vRjB3d2hsSkJKV1lrT1dWa0pt?=
 =?utf-8?B?SmpxRENjLzA1eGFmUmZULzN2eW81NGR3cnpvaFcrK2Qrb2lxeDBWOHpwRnJH?=
 =?utf-8?B?UHZQNjBNQWl5WVl3eFIySmNRU2J5TVZ1RjRmSUlLU1dObGhIRmxXQUFUSXhv?=
 =?utf-8?B?SFNlUzVaY2R4Uk5RSzVLbjBIU0RKdExHZGlxQ1hHdDFWUkt6NkQyODcxTFBu?=
 =?utf-8?B?SytHdEFkUjM3WEtmR2k2ejl0cFpwRU02ajFVRGwzSUYyR3lyZWxtcGhLMXM2?=
 =?utf-8?B?SVg2dzN4U2hzSDUvRGFwZHFlRnRwb0RENU5DQ0N0TlRWdWZOZzcyOURRdzF0?=
 =?utf-8?B?VXRmS0FEbHd2MjZ4ejBsRXlPU0NsdnNnRzE2aGl3b3NNN0ZTYmlqTENrV0lR?=
 =?utf-8?B?OTNTSG5VV2o0OXo4em1oTHBidzBzRTBkVzdqb3FKVWR4dEg4MEhwa2JIc0Zn?=
 =?utf-8?B?ZWFDejJMemRzZjFqWDBRdkZWV3RQWEY3cmNxRjB1MHNHRFdhQ242bThaWHds?=
 =?utf-8?B?bnVpVDcweHpvbEVUc1ZYam9SalhMZFE2ZnA5anpUZ2N4akxpVzNITGo0V2Fv?=
 =?utf-8?B?bFNOMnlGWW8vVVBOcjdlSFJyazN2SVZRSTBHRjNWTHl3RDIweitmaWJESWJ5?=
 =?utf-8?B?NlJNUzFoNEtVcG44RzQ4UXNBT0lBa3NDL2I5SzJETUs1RmUwc2h4c09NbUFq?=
 =?utf-8?B?LzM1MCt3Lyt1L0NMb1dpV0l6S3dqeEpuaWZOUFFvOUxtdFhQTnZ5QzhkSDI0?=
 =?utf-8?B?V0tweTA4TDVvZytERW5vTFFmT3B5RnRzNVdud25IeU11MHUzZDRnTDZJMnYx?=
 =?utf-8?B?ZUpnNVRIQU0vTWg3M0tndHRmenV0T3duU3NlU0lGRTNxUCtZMTdNNmJ4Tytn?=
 =?utf-8?B?cW1TSE5yMFVUazNsdjc1d1ZSRTdiVHp3emFoeGQwUUhYQnJIcnlWNHladXVl?=
 =?utf-8?B?ekVEeGtLaGNxU213YkRCVUZCVEhWRzVMeG5YY3llRXB6VjVZWmhFUk1BeTR3?=
 =?utf-8?B?czBrUmtwQllkUEVOelNLMkg5UkowM1NIUjh0Zk1GcGZkUkQyWFFUZ3lqaFNR?=
 =?utf-8?B?KzhsaEdCNEViZ1doTzd4eTVGaHExaEx3anhzaEp1dUppQkdjQjFLSHlySlNU?=
 =?utf-8?B?QWY0cDgwVVVuS1Z1TWtxeDVxN2ZMQ2ZibVIyNy9lRURGRG1vNmNhcVBPN20r?=
 =?utf-8?B?NkhycDFnK2N4Ky84WmM0Z3h5VWpGVDdsNTdoa2NJOTNCSHFoRGpKcE5ETWNZ?=
 =?utf-8?B?Ykh3R3czSU4rK0lIN2Z4MUNDY3kwSFY3eWZFMURiNzAzMGQ2dkNScXYrNjlo?=
 =?utf-8?B?UmtGSmF0QmdhQmNIZXBmb0dpVEtzajl0VkJHWURnSVowNlZFVy93RUtWSjBx?=
 =?utf-8?B?Si9aeDlKSlpHRlE1cWhXMGcwcFhtQXoyR0grTVZycGZGbUR1NHh4U3B3a2FN?=
 =?utf-8?B?QU0wSlRiRzMxMWhjZDdiMWNrV1ByeXh0UTBaTDFDYXExZG5qWW9wOGtGdWhj?=
 =?utf-8?Q?PyF9kyerqtHDqLAV0gMBBjVVSis7YKtitVCwO?=
X-Exchange-RoutingPolicyChecked: kC8YDlKV/MgUNpBZ1Jh8niZl2ylR48nVrFzNRQd9wvbNqXuOcAHfJbO8ILohZl0lhogSZgJ1WvRWQ5aWp6oXE0EKT4Z7B0p6kJeU9UAm50OP5m+V9xezXuvwkh1nMqlxWaD0SXaAiCQEpWuDhuN8x1Kgr2DUmrN/wtetIPibBePKdrWxtt4Ii8CjD+mlxNWh7JypnxD9zCfR/sAMwjz0E5939MR8gzooIVQlgR8dg5VmmRg8GMMcX/LBNT65B47K6QPRuFM+lK9n5PqDghcGQAXU3S9Yh6yYAyeOB7S/V0Y0ZqH2fLDgfyLmowQqDm2ZPLQqZHJ9CvH+PgEsWgGYOg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c427ae28-4c76-4621-da8a-08df36af24b5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 17:56:37.4813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NhDGyTXJ6cujCxYkwoffzZKdjGqrqfX+xiBkAAVppcnlWiSqk8+cffBt1+2PG4edyVP8MWmuFiCikcPR6QsLSUAd4yQPI8O/aVZJ/qLWnwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8714
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 01:00:37PM +0530, Shekhar Chauhan wrote:
>
>On 10/27/2026 5:00, Umesh Nerlige Ramappa wrote:
>>Open an OA stream, unbind and rebind the xe device, and log the state
>>of the stream fd (poll/read/ioctls) after removal and after probe.
>>Close stream either before or after the rebind.
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
>The test, in itself seems fine to me but there are certain suggestions:
>    1. After close/rebind of the GPU, we poke/check/probe the IOCTLs 
>from probe_stream_after_removal() but we never defined what the 
>expected behaviour is. I mean, how do we know that this is what is 
>supposed to be the case, at the end of this subtests execution.  Can we 
>have some asserts?  Although, since this is a new test being added, I 
>do not know that the kernel is even addressing something like this or 
>not, like, how should the XeKMD respond when we re-poke/probe a stream 
>after it's device is gone.

It should be ENODEV, I can add an assert for that.

>
>    2. Because we have a random decide between close and open in 
>main(), I feel not everything will be tested everytime CI runs this.  
>Maybe we can have both of them run definitely.

Initially I had 2 tests - one for each case, but I ran into (3) below 
when running the whole test suite. As a quick fix, I used one test at 
the end with random case. As for definitively testing, we rely on 
multiple runs on CI, so it should be fine. It's following other tests in 
this file that only run random cases (like buffer sizes).  The idea is 
that multiple runs in CI will catch issues anyways.

>
>    3. (AI-Suggestion) If we unbind the device, we did not update the 
>primary set-up of the device for this test in igt_main(). Right now, 
>it's the last subtest, so no one uses the GPU after this, but 
>tomorrow, if a new test is added after this test, then that new 
>subtest might fail without cause.

Right, that is not addressed here. For now we keep this as the last test 
so that our local runs don't fail. CI only runs this in shards (only one 
test at a time), so we will not see an issue even if this weren't the 
last test case.

I will take another look to see if we can restore the entire OA setup 
after the test, so that subsequent tests will pass in local runs.  If 
not, then we can do it in a follow up series.

Thanks,
Umesh

>
>-shekhar
>
>>---
>>  tests/intel/xe_oa.c | 127 ++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 127 insertions(+)
>>
>>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>>index b9f62c1154fe..8a56efa43dfd 100644
>>--- a/tests/intel/xe_oa.c
>>+++ b/tests/intel/xe_oa.c
>>@@ -22,6 +22,7 @@
>>  #include "drm.h"
>>  #include "igt.h"
>>  #include "igt_device.h"
>>+#include "igt_pci.h"
>>  #include "igt_syncobj.h"
>>  #include "igt_sysfs.h"
>>  #include "intel_wa.h"
>>@@ -2725,6 +2726,125 @@ test_enable_disable(const struct drm_xe_oa_unit *oau)
>>  	__perf_close(stream_fd);
>>  }
>>+static void probe_stream_after_removal(const char *when)
>>+{
>>+	struct drm_xe_oa_stream_info info = {};
>>+	uint8_t buf[4096];
>>+	struct pollfd pfd = { .fd = stream_fd, .events = POLLIN };
>>+	int ret;
>>+
>>+	ret = poll(&pfd, 1, 1000);
>>+	igt_info("[%s] poll: ret=%d revents=0x%x errno=%s\n", when, ret, pfd.revents,
>>+		 ret < 0 ? strerror(errno) : "-");
>>+
>>+	errno = 0;
>>+	ret = read(stream_fd, buf, sizeof(buf));
>>+	igt_info("[%s] read: ret=%d errno=%s\n", when, ret, ret < 0 ? strerror(errno) : "-");
>>+
>>+	errno = 0;
>>+	ret = igt_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_INFO, &info);
>>+	igt_info("[%s] ioctl INFO: ret=%d errno=%s oa_buf_size=%" PRIu64 "\n", when, ret,
>>+		 ret < 0 ? strerror(errno) : "-", (uint64_t)info.oa_buf_size);
>>+
>>+	errno = 0;
>>+	ret = igt_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
>>+	igt_info("[%s] ioctl DISABLE: ret=%d errno=%s\n", when, ret,
>>+		 ret < 0 ? strerror(errno) : "-");
>>+
>>+	errno = 0;
>>+	ret = igt_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
>>+	igt_info("[%s] ioctl ENABLE: ret=%d errno=%s\n", when, ret,
>>+		 ret < 0 ? strerror(errno) : "-");
>>+}
>>+
>>+/**
>>+ * SUBTEST: unbind-rebind-stream
>>+ * Description: Open an OA stream and test the effects of unbind and rebind
>>+ */
>>+static void
>>+test_unbind_rebind(const struct drm_xe_oa_unit *oau, bool close_before_rebind)
>>+{
>>+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
>>+	uint64_t fmt = test_set->perf_oa_format;
>>+	uint64_t properties[] = {
>>+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
>>+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>>+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
>>+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
>>+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
>>+	};
>>+	struct intel_xe_oa_open_prop param = {
>>+		.num_properties = ARRAY_SIZE(properties) / 2,
>>+		.properties_ptr = to_user_pointer(properties),
>>+	};
>>+	size_t format_size = get_oa_format(fmt).size;
>>+	uint8_t buf[format_size * 4];
>>+	char pci_slot[NAME_MAX];
>>+	int ret;
>>+
>>+	igt_device_get_pci_slot_name(drm_fd, pci_slot);
>>+	igt_info("Device %s\n", pci_slot);
>>+
>>+	stream_fd = __perf_open(drm_fd, &param, false);
>>+	set_fd_flags(stream_fd, O_CLOEXEC | O_NONBLOCK);
>>+	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
>>+
>>+	/* Make sure the stream is live before pulling the device */
>>+	{
>>+		struct pollfd pfd = { .fd = stream_fd, .events = POLLIN };
>>+
>>+		igt_assert_lt(0, poll(&pfd, 1, 2000));
>>+	}
>>+	ret = read(stream_fd, buf, sizeof(buf));
>>+	igt_info("Pre-unbind read: ret=%d\n", ret);
>>+	igt_assert_lt(0, ret);
>>+
>>+	/* Guard against a wedged unbind/bind */
>>+	igt_set_timeout(60, "xe unbind timed out (wedged?)");
>>+	igt_info("Unbinding xe from %s with stream open\n", pci_slot);
>>+	ret = igt_pci_driver_unbind("xe", pci_slot);
>>+	igt_reset_timeout();
>>+	igt_assert_f(ret == 0, "xe unbind failed: %s\n", strerror(-ret));
>>+	igt_info("Unbind complete\n");
>>+
>>+	probe_stream_after_removal("after-unbind");
>>+
>>+	if (close_before_rebind) {
>>+		igt_info("Closing stream fd while device is unbound\n");
>>+		igt_set_timeout(60, "stream close timed out (wedged?)");
>>+		__perf_close(stream_fd);
>>+		igt_reset_timeout();
>>+		igt_info("Stream close complete\n");
>>+	}
>>+
>>+	/* The drm fd also refers to the removed device */
>>+	xe_device_put(drm_fd);
>>+	drm_close_driver(drm_fd);
>>+	drm_fd = -1;
>>+
>>+	igt_set_timeout(60, "xe bind timed out (wedged?)");
>>+	igt_info("Rebinding xe to %s\n", pci_slot);
>>+	ret = igt_pci_driver_bind("xe", pci_slot);
>>+	igt_reset_timeout();
>>+	igt_assert_f(ret == 0, "xe bind failed: %s\n", strerror(-ret));
>>+	igt_info("Bind complete\n");
>>+
>>+	if (!close_before_rebind) {
>>+		probe_stream_after_removal("after-rebind");
>>+
>>+		igt_info("Closing stream fd after rebind\n");
>>+		igt_set_timeout(60, "stream close timed out (wedged?)");
>>+		__perf_close(stream_fd);
>>+		igt_reset_timeout();
>>+		igt_info("Stream close complete\n");
>>+	}
>>+
>>+	/* Restore state for the remaining subtests/fixtures */
>>+	drm_fd = drm_open_driver(DRIVER_XE);
>>+	xe_device_get(drm_fd);
>>+	igt_info("Reopened xe device after rebind\n");
>>+}
>>+
>>  /**
>>   * SUBTEST: short-reads
>>   * Description: Test behavior for short reads
>>@@ -5221,6 +5341,13 @@ int igt_main_args("b:td", long_options, help_str, opt_handler, NULL)
>>  		}
>>  	}
>>+	igt_subtest_with_dynamic("unbind-rebind-stream") {
>>+		bool close_before_rebind = random() & 0x1;
>>+
>>+		igt_dynamic_f("%s", close_before_rebind ? "close" : "open")
>>+			test_unbind_rebind(oau0, close_before_rebind);
>>+	}
>>+
>>  	igt_fixture() {
>>  		/* leave sysctl options in their default state... */
>>  		write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
>
>-- 
>Shekhar Chauhan
>Linux Graphics Software Engineer
>Intel Corporation
>
