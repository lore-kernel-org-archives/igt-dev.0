Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AD6606A31B
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 12:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SRIgDMDh
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 147F2112501;
	Thu, 22 Oct 2026 12:00:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FEB710E41B
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 11:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792670341; x=1824206341;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YLM0sm7NkC1HC9WBYxvxkDHg4U4j6d06NjhiGBYW9Ww=;
 b=SRIgDMDhHnlH8uucfFRhG32cniAnafI0qQ80uwJefZuG10GXOquGRrBh
 vznobIA4Dl29whs9wObq59+3wjPOj3bZ7gJuXsbojdcZMeetQqJTYdfei
 vVCOdxNAcuVWE4MfAESQZ4vZmkXJlHxZoKaT9LuBCzM4Ci8FoLsbx0er/
 69o50XrvZevaOVg3HNv/N382v9efiObP2SmbJt0UdA7z2A/tx5nY9kDxo
 hn8O/QxIx9rPkFq3sExCQYeb4Fi+nK76AuOBZzjUtnHPP+icT4knLjYGN
 m7G+7B+xbZaTWxDFRdpGoDcD6bDSxZhN9em2ehMRk+7TFmiL/uDXuecMy A==;
X-CSE-ConnectionGUID: tSu+0/meSAKixIw3IwqPiA==
X-CSE-MsgGUID: bkh0BvbCT1urhCl94N/vcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1296838"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1296838"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 04:59:01 -0700
X-CSE-ConnectionGUID: RkEs0dTgRSSYn3w0IgW8vw==
X-CSE-MsgGUID: ZZsdXX0nRQm8ZkoOPghANw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3707032"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 04:59:00 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 04:59:00 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 04:59:00 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.8) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 04:58:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XDuzoXndkNQAkTMP8/HYylc9E0IIdSHt/0+Wv/pA2M9Kf3wzGztnGSa+U9y0aBON3RL1+dAjl8ax2IXrlehLHQcvYX27iT18OFaxep5ThezpJi/zw002C+8sYj0bj0pvopQf0ftnx+kh629uAv0/NL+43SlRWeW4Qn0eUxU4L6zLcsfVjXAFQ7p7yoZFjvJbWXF0FuXExgMy5Xs5OIoXl0IMRUyAjn8lFhgEYiuUfadOqOledV0EUPC4pt+OKuYIG4x4+LVjpzeMhovYzpriuZaKtQ8hpBKZKKnS1NHimweIUNPCqiDlWQlQPYv4V5vkdi2pTTEeRRn7EQIQ7ue+vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NsFT9UVgNcSDdXA75U/MY68QwDZAtB8X95uSWWIY7pw=;
 b=i39uNxe9HaqFOvLapcb7DnTNa5OyhZzHWCRacsottS+CO36thBRpk45W4xN9lQcl4f71T9AhSEAtWxyryLs5cMCgPQVS8Vc7C8+/Cbs/Pi07JWM6ggtNUeFIBOgvu5PGxMSXOITyWmlrydeZOeKxpWnoO7PhVtGw4+G34Jc/OSMbut1grvJADmelZ62xT5uOEVLDbkSieBltqZlZoUnsukVWSlYPYsiWoGUBDIK7P+tBAzJibRUT8ycpnbicyV4Uxp6yBdYHbcZ30WRs8T4cT7YOyv8c0mNWPU6qtwqVrdK+YOCa4YV/YM+XqUXy2ndnkXbS1+GlPTGti4cu6os/Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB087165.namprd11.prod.outlook.com (2603:10b6:8:4c4::7)
 by SA1PR11MB8328.namprd11.prod.outlook.com (2603:10b6:806:376::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Thu, 22 Oct
 2026 11:56:56 +0000
Received: from DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f]) by DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f%5]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 11:56:56 +0000
Message-ID: <f7c18f1b-fdf8-41a0-a27f-7dd5bb839fbf@intel.com>
Date: Thu, 22 Oct 2026 17:26:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/10] lib/meson: Add libnl dependencies for DRM RAS
 support
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>, Anshuman Gupta
 <anshuman.gupta@intel.com>, Raag Jadav <raag.jadav@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
References: <20261013190651.897241-1-ravi.kishore.koppuravuri@intel.com>
 <20261013190651.897241-3-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20261013190651.897241-3-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0129.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::14) To DS6PR11MB087165.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB087165:EE_|SA1PR11MB8328:EE_
X-MS-Office365-Filtering-Correlation-Id: 87b5bc61-1dde-4a81-cf7e-08df30339211
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|261021121427099003|11063799006|4143699003|261009223027099003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 9xZi+0cb9KWKznq2+IIhEwI8EK50dLU62MMdjboPklmM5IWnhMJp67+5xPL3btZlKE+QNY3OuwItg0Pms4g+ZjJukwc/vwIB68IPe0UmAYDuMjzxHjsB/M8Irz0Ce6Gyhk43wN403KHL3LX+aadAtu/jMMqn9YGWaIHjKNgO1vskkPvGHDNdwgu3OATJzxxU+NZfFKm1LFb4aNc8gtayxE297XpU7+QoNK/lWZmZc93UZQRIiV7Tp4sgp6uWRn4yQIGQBK+CZ0dzA25IVGoK1X3hWiewR2qRH1U2SMDVoxaX12iKIPooEvtIATgsFKtrZrAUq3t6DIh53BJybbBng6vjNfLgFP0Aua3/pTD6XRYJ0pl2t/paLGH1yYoRqxUx565od4fmHvGmdx5H8qDmstd28e8oMxPNqTCKVpLQcwNU9TmexcHd19rl2do0hf5SfRt88vgx2ogcGvwkhzmFWE3IVofE5dD0q61StSBUz3ueBy9vJ2Kcv/xg7fff6hwZB7iJhO0QAO8uw4X7rQneZc6pUjY0MQY4304AbahVHy1rFbbV36giue5Q70kqSrR264La9JmHgmp3ClRJMiEAeQWaiVVP5lvPno+mQTM4UEwgkkayapVPgwNBzadBn9BbuzzN1ySixmJ2yEKqC9QB9YeSWCkkgl7KWOSsoZ02hh8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS6PR11MB087165.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(261021121427099003)(11063799006)(4143699003)(261009223027099003)(56012099006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Uy9oUVpaY3krdGFYRkNtYWlicHMyM21FbHRSZjBJYmpUeFR0QkYydUk3SEZQ?=
 =?utf-8?B?ZXlqK2h6eXBpNTlJeFZ0MVZNMnMxYi90allOVkQ5OXNadk1ZSm5uZjAxRDBp?=
 =?utf-8?B?dnJyR1hKNUVnQXZMSW9xWXJUTHlONGVSUUVZb2FNVWZiMnJmTEZnenV3K3E4?=
 =?utf-8?B?TzVsdm8rVjdDQzQwbzJtbkYvOHFxdG4zMEhPSzkrMkVSaWttNG10bXNNK0ZM?=
 =?utf-8?B?NjduNXFaR0xSaitMUkNBak1GWHVhVitGR0JGYmYvbk1PbklUd2Jhd1lHaFd1?=
 =?utf-8?B?MDd6ZU5SV3FFVWxDOWQvdEtGY29TVUM2WjlHV3hISWRnbWJoendpRktCSUEw?=
 =?utf-8?B?U1FnaFRWSjZ5dUVMM1p6V29zSVBEdy9SMXRIamFWUkNGOW9ma2dkaUFtMXZB?=
 =?utf-8?B?NTI0aVB0WTRxUFFrL2FKYUpxd3VjRm41N0FsTURKTzZDNEh3aHJJMW5tN1Ju?=
 =?utf-8?B?U0hzZU1kVlowckZNcjM0YVUrV0E5eUNLaG53VUhCVWl0MTI3bE1nNWZJOWl4?=
 =?utf-8?B?a05md2pneExoZzA1djFDQ2tGQ2FzVXJOUm9lR1FBaEh1SmR1cFRLODdzWWxj?=
 =?utf-8?B?ek5RT05UaDIrSm82ZzRSTjQxa1lKN0I5OHlHQytaYW51N2RWc2F2OW5MaHg1?=
 =?utf-8?B?YjNzeEJkY1NoaXoxYk5sTTM1TWtxWkhlQThXOGw3eGRwMm1KcllpTUlNSjRl?=
 =?utf-8?B?K3VlV3RobVF4amx3eFR4R2tVVVE3Q0ZxWjVaa1ZtNUFrSmVPK3ZoRmRYNGsw?=
 =?utf-8?B?ODNwT2JFNW5EeU5XMmVFUVk4R3l1K08vd2xKVVlIOFFGSzVkOC83RmpGdWJB?=
 =?utf-8?B?M29xNWZaQ0hqajJPY3cwNFBKZlQ4V1pnL2djOEo2akh1VFNvcTA1KzZNbDlI?=
 =?utf-8?B?RUpsbVNNMFQ4T3lHQW84VXp0ZmpGSXVwakQ4MjBUOWtIR2Q5T1BZSzZkSERL?=
 =?utf-8?B?cm1weHpmYi8rbTgycXJhRHZzOXFyTnNNS05NQ3FFd2UyeS95azE1Sm1CK1h2?=
 =?utf-8?B?MnA0Y1pDY2dSWHJVYTk1WnBWWkcrMkF5NHRPVUszdE5qT1pheUY5cHpuZ0dz?=
 =?utf-8?B?L2RXUzR4OGtmdFBSVzVlREV5TURFNFkxb2lwV1h5anAydU43Ly92c3A2UENJ?=
 =?utf-8?B?L1JRbDBvOSs2YzE0UEJzaGRNMWFxVDZ2cmVUY1FhTzlyRElibXNrSzcxTzJ0?=
 =?utf-8?B?anNFTkdOTjlVTDQyTHVPeGtpb0M2QTF1UVkzWlcvZFpnMG9PT2dpeGt4S3lx?=
 =?utf-8?B?OWd1ZXhSejNMMjRRc2c1SXdkRW1lcTdjQjJ5dmdDUDhBZ3l3NTBTMlpSYzUv?=
 =?utf-8?B?di9Kc25WNlFZSW9vK3R4REx5MlZCSU0yclBEUUNFMEttM0J2Y05vKzkrcHo3?=
 =?utf-8?B?WWUwUEJCSTFHRWhjWWlZMG1ock5ZQW5QalRVYXM3VXBLdUxzQ1I2YW9JQ1B4?=
 =?utf-8?B?ZnNRMGdvcGE1OG9oMks5b09FbWdWdFhTMGNDMDlDemRHMldhV29JbXM0THBk?=
 =?utf-8?B?WUhOOWdmWmJ6MHg1WTh1MVZJdkJJMmw4TDFVdUpML3dZYkV1YkNOcllKbnN5?=
 =?utf-8?B?aXpIUS9VbEFoWXNOS0pWUzJ6bFBRMkxVMXVKUldXSEN2MXMxL0x5dm5CSG5X?=
 =?utf-8?B?R3Z2SFdPVzFhUnJPVDFpa1VPZmsvQjcxV1hIdzg5aVhtNXYwdVA4dlVwcTE5?=
 =?utf-8?B?Umd2TU9sVUtyTllqaE54dDVMTVlSVm91Y2JBK1hncGRvVEJLTll6NE1jM1gv?=
 =?utf-8?B?SUNxbVA0OXk1d3U5YjE3cUQ0dWx0bTg1cXVzQzUra0J1L0lKTkFpOHhVOWRG?=
 =?utf-8?B?aUhjdkY2VWJyYkk5WWZMOHRXTUpqdmoyUjlZMUVrWDR3S25IeTdEN3dsWVBP?=
 =?utf-8?B?UVhHTFBwSlBka3c3VkJ2OXY1ay9icFg0YVMxc3NjWXo3U1lsUzZPV2JBVmVL?=
 =?utf-8?B?UUpaK1RQVGZTWFF1WHZoVzIxRU9XcDNLSHlCNTBqcklHT1MySDZmZis4MkFO?=
 =?utf-8?B?ZlpLelFjMzd0dXhkOWFjSk5Rei9qbE9qemhDd2s3ZHB2MXVoTEtWVHJnWUZv?=
 =?utf-8?B?S0c4NUtTSnV5M0hmNURGMjRZSzBxMHI1T0FkWDJNU0dWTm00N3d5OFNyaVpt?=
 =?utf-8?B?aVJUNHFNL25qTTM5bkZZRzV6cGlIN0dBYlBqZ052WkpkVmpKUWdwQlU0REFP?=
 =?utf-8?B?R0FvSzFxTERNQTNhUUxrd1gvdEw3TDJPU3U2Rkc0U3IrZnZWNHlXNWRscWFS?=
 =?utf-8?B?NE4veGNHdkpOYWIxZUpLbUtuNjlvRjFqYjFtNnZYdkRyRU9xL3hRT0Y2dEl2?=
 =?utf-8?B?YXdVOVNsbE9yRmdydlV2NEd2OUJxR3JXYlpDUmhOMkZUUWU2UWMyQT09?=
X-Exchange-RoutingPolicyChecked: vQpna1gq2rwyy+7VuNnnP9qedRZxPAumj4MLwXY5rczzdYP1H61qFv6+XKYtjXDXFBgcdZuaHIi+vGx4Ps6XtpGiZKwDFDZU5prS1A6mCaTvXtztGUPSgxkATTss+myOhuWtth5wGsEx+jhcgPeyCNrqhCOonVJz5Z8FqZgUvYeyY8u2GvuiGBrWIiSyQshwCTyKvaZbvoONXDOsF8ILO/z+Y5EThv5Dz9HpwYnPP9F49tmJmdA5WUkBvRumwO4xx0fP4eTPNADMNvZaoNFV3f8KpB9V3hWSevn4sJN5Wf49FMxyVsuYa8N3IMg1J+cTOcf5Yziqjqs0e3tPkgbHgQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 87b5bc61-1dde-4a81-cf7e-08df30339211
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB087165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 11:56:56.5018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rK0BHroQAomUtnarnd4L+fCM1VkZcmoVIE/OzTozUQNCzhAlqg4vBYIaicBvunQOMTieIWN4gYq5XQctqavqvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8328
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ravi,

On 14-10-2026 00:36, Ravi Kishore Koppuravuri wrote:
> Add the required libnl Generic Netlink dependencies for DRM RAS Netlink
> library support.
>
> Cc: Soham Purkait <soham.purkait@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Harish Chegondi <harish.chegondi@intel.com>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
> v5: Removed libnl-cli and libnl-utils packages from dependencies (Soham)
> ---
>   lib/meson.build | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/lib/meson.build b/lib/meson.build
> index 4af346b43..df3046f46 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -141,6 +141,11 @@ lib_sources = [
>   	'vendor/uwildmat/uwildmat.c',
>   ]
>   
> +libnl = declare_dependency(dependencies : [
> +	dependency('libnl-3.0', required : true),
> +	dependency('libnl-genl-3.0', required : true),
> +])
> +
>   lib_deps = [
>   	cairo,
>   	glib,
> @@ -148,6 +153,7 @@ lib_deps = [
>   	libdrm,
>   	libdw,
>   	libkmod,
> +        libnl,
>   	libpci,
>   	libudev,
>   	math,
LGTM
Reviewed-by: Soham Purkait <soham.purkait@intel.com>

Regards,
Soham
