Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2647F99344
	for <igt-dev@archiver.kernel.org>; Thu, 23 Apr 2026 09:15:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D86110E2FE;
	Thu, 23 Apr 2026 09:15:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bT7DXoLw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E21A310E2FE
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Apr 2026 09:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776935738; x=1808471738;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9uCq4XvkTIpLuJT851pZO1UQnvAJXPAP3HQ6ctElJXI=;
 b=bT7DXoLw2lxSZkXV1seQMxxB7Dv21RAIe+sNDSFDYnQ9pUXoHk74Ub/X
 ZPkHlG34VCn2oID5YD5UeKLX0HE8NblwwdEfK6HqhuzpzA3HurpIQ7fBv
 O6xNcdURzPlsqkVrd44erd8/A5TVgb2Zwq0i0no2N2s4K2lhfKQHGis1b
 eeyTK4/ZEfPLSPLOj8H3ycXQTQTHH/8KHBL2wLzPk1nS2E4l5DebIQEDs
 8CwXHV7tb222o4z4Fk/Rrtc21i3XE7Zx7fYPLcI2cnolod5Ss3NdJCr51
 +hf73Do8RHNzsv4QxJFqCDWuPme08jhD1PanmaqJ8Uwfcr+3rJHVqeWOJ w==;
X-CSE-ConnectionGUID: mbkd3W+WSSODIgFg3dMhEg==
X-CSE-MsgGUID: 4WoFto5zQ8O9PThxsXnq6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="88981767"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="88981767"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 02:15:35 -0700
X-CSE-ConnectionGUID: Nwnm9XqmQ3aWjYp8ArSNRQ==
X-CSE-MsgGUID: atJC4JplTj+rgtfU06F3RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="232512633"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 02:15:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 02:15:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 23 Apr 2026 02:15:21 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 02:14:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lOYm6Tg8TAqbzBbty852xlfZew0rosz7NosBk9x3YOcJmLjj2SMTj73RKRlkVdAL6lWEsywMQhAttFOAB6misjzfVqPdEfMuACjsrvYwxQsywd2bhTKe/+CBeYcY1uPjmxl6mcf+YOsUZ8wssNM+bu6K7rdI1gQfbMqp/y8kuRNgCgZVnF18rA/DoTaS/gzvkhHxJ3jML9DZgy/NN02OzPiVzrptRdLXDQvg8D7QiENTuuQj3sRyoYR6qPmahXx8GNLHxsSFHXccTHm7DEWBEeEizGIhTlncgq04Sof7yUeNsfFduciCKOXIiahK8wQrjASTQFOyra+1wqwCtEO2jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y4+skGa20F/c7TZ/wWad8mVeyz0hd3fQqEVEM+lpRxI=;
 b=Pf/u9ua+Uhq96nmg4ArNfvuAi/MsJZyDxkvCeEgiCAYDJrTVyXWg0QXF8EcRsoIIMQ5rXGP8D0qQAhuIh1zD+181NWqgubJim008zGvI3OgAcdQ3sFH1VZqgN1YMl6Omzi+f9tShdoprDZEleDNLjGNOIn+4tHSS2yem2rCZHsBJFjQJ9Mv/qgIB1XbWrG8WIEbidEhM2X0cOLtQv8F5y+Y0OEb+yikJVuCUMdp9Ll2ns9VdVFFVs60xHqKEKePPFJS4L+IEzAfaiU4QS0bgDvek6K1wPHmNPcljwKCwY1eofuToFhkJhFwurwlkFbGKsTni2ziQaA1qCTEtQhpT1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by PH7PR11MB6497.namprd11.prod.outlook.com (2603:10b6:510:1f2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 09:11:36 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.20.9846.014; Thu, 23 Apr 2026
 09:11:36 +0000
Date: Thu, 23 Apr 2026 09:11:26 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t 4/4] runner/resultgen: Insert attachments list into
 results.json
Message-ID: <mt2txez6ja3mpu2ysrgvhexwyv74hkuatbuvkoqiy6tbfex3hi@nhthcszzvfwx>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260421111709.3163253-6-zbigniew.kempczynski@intel.com>
 <20260421111709.3163253-10-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260421111709.3163253-10-zbigniew.kempczynski@intel.com>
X-ClientProxiedBy: VIXP296CA0011.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a9::10) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|PH7PR11MB6497:EE_
X-MS-Office365-Filtering-Correlation-Id: 81824480-8e01-410f-1a13-08dea11851f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003|27256017;
X-Microsoft-Antispam-Message-Info: Q5tNfRyT+rZJyiigE9yVJVf+eEGu7clTUYTA6BvbSRCYXRAGpJmyyxuIxKtlLwaoqdd53CgrdOJ8R6sA+i3JzZOf7eIe9jhSBgl5RgcgEgFO5EoFmZ1If+cFI2WVUC+m1Ch/cgXX2DK+yWKJV/SZrXF78vsIY8insTnhjApgFp9VYK88qWkzNy4IcMkOAPcpNJmRJDK/T6iZRIIM/3eZkTdP1fQS90QO446C2Mdh9Qxot71FAkXtR8jlWcnRlTjfFy9foYOx9QQoeH6R9BjEyK+D5KLZr+wW6q8/lwDd6QcqvQCsSATqTQoV7/yxnQf7rghMBNDBsf5Ow7hxn6ISedxpe/ix8NjinVsLAevXpKzGHU9/nT7/3cT9DWKZKqiZ4vSump2qsaHJ81x2THkgni94F4ZIb6002/uaK5gpacibUmuBCDsrMvgr//BEc5KKpPqC7WkOOtUW5njeQjGjihRlAoKpSCmmfvQ0BRQrcyjsA5Fmsn9wqV8ovd3MpK5LyB4PTk70ollpp3OwNmmw7edNf/Or1vL0yckOOgDRzxS9q1YRFySKLSHcSPCKVGMTLgayKsHUVFg3Nd7aB+H72tqTzsp054bSzG/fqp831x4orb1XsS60EXmEK9lgRMNGSZy51vGiQjUHI2MQoV+7KQdRHvO01OXyt6oAKwYU2VWDiLyp3diXhd14lInnBIxz6UAvDL0nkV4zI1TQcDsT7jMIIcCXDQjGH5mDpV/tAz2YnNyfMgufqCmRcbR9DJum0lLWW+5wJqwMvfbeEaNrCA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(27256017);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2JkZElqUmRQNVdXQ1FIRDloMnVKdHIwLzN2UVNmL0plUFpmVzQzc3RlYnE0?=
 =?utf-8?B?VU11eElOTXZVR0cwRU5Waks4ZDRRMWJVZW1hdHZxc1VRdkZHVDN6eEVLWXNV?=
 =?utf-8?B?dTg1b2xBRHpXd243Y0RTSVhWOGpTSFJlSzY4Yy8za3kzUHhOZCtFMDJBZy9H?=
 =?utf-8?B?MFdXVUtUbEVlUXB6VURNWGVJWWxIeWZPRDUxNGo1Vm1TZ3lrMmhoWlJDR0Vi?=
 =?utf-8?B?OFowUm1pb3VyWXlRNHNMcGg5MFNoTklpYWgyWVllQmd1a0pOTGNVSWt1a0E1?=
 =?utf-8?B?VlZGNGZNeUpVTDFnRTBaT1VLT1JaZWROY0htdFlxbGNZeEFzcWxpOGVETVds?=
 =?utf-8?B?NmVTS1JBVlMya1BFNUlteVpTak9QY1R6SnhORGtiempHeW5vMjFVcW1hUjlv?=
 =?utf-8?B?akxRQzVoOGphTzZRdzhJd29yUGNkaHhDNC9kY1R3cERxcUY5eFhKdVZvQTZo?=
 =?utf-8?B?NGlTT3ZRYVRjbVBHZThOT1hkNFM4N2gwVTF5SHRpeC8xL1h1L2FsYTNnRDNy?=
 =?utf-8?B?dExPZnNpVjRVVXFvVUVFZytZbTdSSUFTSHBuK25qaDFxTUNDeC8xTjkwUk5j?=
 =?utf-8?B?V3JyL1Nhb0ZlV3I0UFgxTHZxTmR0d2k2cnkvQUJrUGtCcXFQSk1OMlA0L1Z3?=
 =?utf-8?B?QS9XRWhiNmROaytLc1B0QUxRTFJIWUFWUitYajl5azVtMzhPeTREVDBEc1lw?=
 =?utf-8?B?Z1NEKzlLVjFnUXVIcUQxM3Yzb0s2cGZJdWpPSzdNTHVpUDNuU2JHcU5NSFRX?=
 =?utf-8?B?RDZPNitIK2ZlM3dqOFAxTWZMOStzSW1Nd2RpZ0Z4dmVhYTIwVy8vN040T0I3?=
 =?utf-8?B?ZTlobzQ5c294Q1krUXN0Y25xbnRCSERxa1lmU29OS1I2Q1NsOXlmM3NLTlNx?=
 =?utf-8?B?aHpZUm10VjVYbWVpdWFJVXRDcTRxRktYVXhCdGwxTS9QdkwvcUowN2pFZ0hs?=
 =?utf-8?B?STNod2I5WmtPTlpoalBFUXUzMUFjN0xNWDNRWlFxdVExajBYOEhnYzdGS1Ev?=
 =?utf-8?B?TU9yV1ZHMDRqYkxERjBhWFJjWFdvLzlBdUloTGNKWUt2SzRvdTMzckR3WkJ6?=
 =?utf-8?B?aitiTlBINXR4cFJxaVQzK1liQnF1RnlhdjMxTWEzbndtVjI3azV0eHZ3SWlu?=
 =?utf-8?B?Y1d3ODEzOUVEdGpVMGRvRTNUQ2U3L2hRTTRKdnVZUFZxU2YrRllTKzNrRUJW?=
 =?utf-8?B?d3Y5VVRJeDZGZ2dDSnhpc0JJRVJMK2ZCMk96aWduS0dVdzRRbFlPR0hyQ2ha?=
 =?utf-8?B?T0dMai9zNjk5RWUwU1FKS3dGOUUzekIrd1RBSTVrSmU4VjZ5UmVMYkdrZXFF?=
 =?utf-8?B?bkczMm5aRHgxRjgyZjBuUXNTTW5LRHdCRi9uSENDOWxwaFlKcFN3MERaMG16?=
 =?utf-8?B?K0JUQ3k1eDRQVXdjM3dkNC9vRFB2WmhHaDVyVVVHQ1AxeTA4SzZMUFZwZ0xO?=
 =?utf-8?B?NDZtUnpOVEh1YmMrcHhsSklPeDdibEdrUWtnMXdKL2JERmhqVVh5MHhHcVQw?=
 =?utf-8?B?K0k4RXg4b3owRHlhZHN3SHpQV3k0cER4cXUrZ3FKQThiNXZlUERLYTVWa01h?=
 =?utf-8?B?clAvZXByclYvMlVoQ21BK214YitVMEFpZHlSU01zbWVVeC80U2s1S25UaVJx?=
 =?utf-8?B?dDZnSytQd2RlVEdWMWZ0R3Q0dm9BcWFPVWVPL2FldnZYRFBuWFg0QnZZYzBQ?=
 =?utf-8?B?elY0UG93MEdNNERkVzJhaFVmMEdrUDY2bnJqdWZ6Wk9xTlh6MStFWWhZSEFE?=
 =?utf-8?B?YWZWVWNUNk1pMWFBaDBUb0x1ZlZZRjJJMG9hd3MwUXZuVndBYmlLWW56T3Np?=
 =?utf-8?B?UkpQTW9rSXp0THVTNXhXM1hvekxiakdXVEJweDQzYjRXRDZKeS9KYkhtRzdV?=
 =?utf-8?B?R01HYlZpbGJEUVZtZFhvbE5xRGIzaEJjQ1g5YlZFamtUdkoxUVVaUXFTdDRS?=
 =?utf-8?B?bm00cDhlbnFDK2RQY290eDhQR1orOEt2ZGp1TldqdUN2b3pQVzdiME8yUi94?=
 =?utf-8?B?OXY5bW9JcDFOREhZa0JCdnlEV2FpUzJRY2pqWkJ5M01jR0xJT3B1UWk2WmRJ?=
 =?utf-8?B?TWNQemtWNWRjYjdhRENTUXNRNlBDOUd2WTNnQTRweCtnRTFMNWh2Z0U5VXQ5?=
 =?utf-8?B?NFFjelFZejRpNXUrazZmd1ZLM3NOMGFMd2VSQUtWQysvOFQ1YkJYUDlQTEtY?=
 =?utf-8?B?N0w1RWFUVmZTMmQ5UVA4UE90ZmJUZ0U1S3ZOeHoxYkU4T0lCWGdhNUZ2MnMw?=
 =?utf-8?B?dFZnQ3FEWUd4b1BUb2hVTzI0RWNKbDBsV0VZaTNoekdmMW9Namc5WDM2T1Nw?=
 =?utf-8?B?eFBkMTlocTJMUGFrN3FyVmUvc2NETjdLQ0xRNjJqV1QzYmdOcnp1UUcwQ2JZ?=
 =?utf-8?Q?wnDYdnNfOhGduuUk=3D?=
X-Exchange-RoutingPolicyChecked: qLINo4zKd7rqLFPmFREQr0/ifAu8iPwMzKWHWjle5h2T+oiTtl/t2txssnjF3yzrcu9Qyp1Q7xWty6rI/yqJUhKnTuFzVfY/PDnH1IeA8LYIl2ZV/3Wfj2bBRG4A30V60jYnNIelplHqcXo134bd1Nvl8Am0uG1QXICV8g3pNdh25ioA4BlqUnSC+SSFko/ew3aW/Nh8LCQAdsnY0YbpgP1FXoA5U8fStuZPSVe+ycpnkl172+UQ+fjZ6AVW78pR2FHJ3emVmGTgUdW/fDPY2bLlZkUGcb2dzwjSAdZI+HFJecYexBJ3/qy6PNddBmUdoXEVD+WNWvDACOW5+vUtcg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 81824480-8e01-410f-1a13-08dea11851f9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 09:11:36.0839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gTweICSeeUWShKM3xbOUvcqZVZk0Y5la7URxORxrNkSrBS8Gc6xtdbz+k62WuqfJS7G+SFEsPWR56p/UVd+jAZkoSrk04XTfNAAZyQR+1k0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6497
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

Hi Zbigniew,

I just noticed that you forgot versioning in this batch ;)

On 2026-04-21 at 13:17:14 +0200, Zbigniew Kempczyński wrote:
> ontent-Length: 4165
> 
> Add list of filenames which were created by hooks in attachments directory
> (like GuC log copy) to results.json for allow presenting it in CI.
> Absolute path to attachment directory was added to results.json
> as this is necessary to build full path to attachment file related to
> test/subtest name.
> 
> Due to lack of userdata pointer in nftw() implementation main json
> object is passed via temporary static variable. It shouldn't be the
> problem because results.json is created in single thread. This change
> is not too elegant but allows to minimize the code change and is
> much easier to read comparing to recursive readdir().
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
>  

[...]

> +static struct json_t *tmp_tests;
> +static int ftw_attachments_list(const char *fpath, const struct stat *sb,
> +				int typeflag, struct FTW *ftwbuf)
> +{
> +	struct json_t *obj = NULL, *attobj = NULL;
> +
> +	(void)sb;
> +	(void)ftwbuf;
> +
> +	switch (typeflag) {
> +	case FTW_F:
> +		const char *attdirkey = "attachments-dir";
> +		char *p, *currpath = (char *) fpath + 2;
> +		char currdir[PATH_MAX];
> +
> +		p = strstr(currpath, "/");
> +		if (!p)
> +			return -1;
> +		*p = '\0'; /* temporary for acquiring the piglit name */
> +		obj = get_or_create_json_object(tmp_tests, currpath);
> +		attobj = get_or_create_json_array(obj, "attachments");
> +		*p = '/'; /* bring '/' back */
> +		json_array_append_new(attobj, escaped_json_stringn(currpath, strlen(currpath)));
> +		getcwd(currdir, PATH_MAX);
getcwd() may technically fail, should we be worried about
possible errors? You'd be trying to run strlen on currdir, whose
contents may be undefined in that case.

> +		if (!json_object_get(obj, attdirkey))
> +			json_object_set_new(obj, attdirkey,
> +					    escaped_json_stringn(currdir, strlen(currdir)));

[...]

-- 
Best Regards,
Krzysztof
