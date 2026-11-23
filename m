Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15108606B405
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 14:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OCJaguwY;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Nvgm+TsN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAAC810EEC4;
	Mon, 23 Nov 2026 14:56:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2536810E81C
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 14:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795445673; x=1826981673;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=X51x9q+LjAt7UmmLNVnEh6BxUgv23Bh+ZSnZCZk1jW8=;
 b=OCJaguwYPXxJ94li9xq3dHMecR8TWTf0sWnUiWtQ+ADv9uIYcAIFLvc0
 /hd1FrJhiWtdvkcB2zaNm939R6D0qAUl+PjSTN2oGIe79w4+wtvePAyfy
 /2i+Xf6JbQzzi6FHfUUPq2swDHUN6WBm/O9/kASqJu578NuqzF7mgtxkj
 TFIHiGn3do7LfN9jc9mfnmLf3AIDhghKE+duS0ELW+868cz/0OQ57xawI
 Cil8VNhJZ5+4iI/7gDxkiOSBahjDBnE9rq5f3flBkiUqkJubGe5+kJdPO
 jmIWv8SeDpGTz0TadV5Hx02O7FHH1XBedp89x4mrxv0AQhNIur9sZ2Hxx A==;
X-CSE-ConnectionGUID: I09dtU1dTmqJSdGDVnbTgg==
X-CSE-MsgGUID: GMIwwSTETom+FdGp2dRpjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4307573"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4307573"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 06:54:32 -0800
X-CSE-ConnectionGUID: DazSH9yiTi6sGeHfjGHWbg==
X-CSE-MsgGUID: vtEMebJ6SH6FrGwBvmnMaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208";a="13016900"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 06:54:26 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 06:54:25 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 06:54:25 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.8) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 06:54:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NZXk57T8MB2b9b5/FUEdBqP+LP9LcbP8mXoF/02262Zwc5vwKGCFTUCPEoBOSgmi4eih9xc14XXqJ+OfOBp7gRK3oYjrpg694LbV4PcwC0prCd9BQ9anEyVMcJxkCz9OLfZzJ/XLawGjcsXZ/NB5SjEbPy2K79DtHAaauJwNPGZsiK23zgCaEVTjQSpEyi55l7+wOJFApBXkRiolqAzg23TCiTeA7I8bpzo28Q31ImU6CvO1NSJO9Gd9w5Ydld4V2PDjqAcqz/bkM8yHHAhB9kIZTKdG1X6kMp7jM1I1tBbXXDnGpWSBJgUo7ikXvSBMPE+xTk8PjZsUAQ0A37VH/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDeQJU1H+SzIyOOaGcWZCIa18X0+lBdbE8GNz6fS5ro=;
 b=nu/6+al9I+lR0NOR8G4i8xBxpn8H1Lhys4W8A4QSpnpG7fcWp1VwvNh49aevCG0ZHLNCaqYKTinFmLRgXkEbSELZ5dpXfDT7+WchGACFiMDSGVNUEHOeHhGizmjWSyxc4JkPPP12GN/6uQAjZN3iKzzW+uEFtXELEEIlFAjw/6XM+8pr3iTeJDrsgZIlOKz+JdTbwpwFvqrtiV/b7w4Nd63P7e18MQajDvDs7qK8DhcviJdQmamA+ImYsjkZnbcKT+HLwft0gWytjRj34vbBCLEex9sVQAI6utviOQjKh7OOW9xkw0LYu3PrjZ9IIZhe/afplZS1OAPPkNzWph/q2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDeQJU1H+SzIyOOaGcWZCIa18X0+lBdbE8GNz6fS5ro=;
 b=Nvgm+TsNE6OfzGHMXrzgyCoYTXWZ7XQOnu42wl7YVTocAqV/3Akb/QFNXu/WbPKvIWzuKa2+vTzMxveti6R0Z3PRMfboleQRmUnFnPmmtIF/HCPf60JazC3ETDYOssYURptjQaIv4AMT8b/febAsC+a1Gb5fcVcETTUWFT8Mh10=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 DM6PR11MB4578.namprd11.prod.outlook.com (2603:10b6:5:2a7::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.12; Mon, 23 Nov 2026 14:54:22 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Mon, 23 Nov 2026
 14:54:22 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t 2/6] tools/drm_ras: Add a DRM RAS netlink tool
Date: Mon, 23 Nov 2026 09:54:11 -0500
Message-ID: <20261123145414.2243338-8-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261123145414.2243338-7-rodrigo.vivi@intel.com>
References: <20261123145414.2243338-7-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0093.namprd05.prod.outlook.com
 (2603:10b6:a03:334::8) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|DM6PR11MB4578:EE_
X-MS-Office365-Filtering-Correlation-Id: a0f1b570-c238-4ff0-9435-08df4971a89e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|10067099003|11063799006|56012099006|261009223027099003|261022075727099003|261022105027099003|261022113327099003|261021121427099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: shPmMIZFY2ik1dUVE1dP+XlGDc9yZCmllWOVMusVJRb+jp0//MfCC8/JFJleZhsqpScyZJ9e0cbnzhSBqpRocGbczowr0oRtmQy+5QqQv7k5hJ7EdgQijspoyy+HzWBVlz0YdcRXDro8Xf08Hx0KduMCp67/EtcoBjuJCmpRwUZsMUvm4QzgKaBGeXr2DXxtlcfvadcJrdk/bGBuo6YT0gNNbVWU7vcrJz4UZUmGKJFtq5petLqorFhZljBniHSshhGF7rjvi+/0agOhd3V12ICcAO5uHedP18anymobCDYLNDp7jDgytARiDNlto2/w+O39gcvTMoSgH1T7XTmppPzZrXB+KY8gQRtQnCXY6BKEQouJwqO9j/kcGgkBMo643zs0FsRIWLc72/pVB2z+XwtjIX0gXQl+Bcyfr4p7RkxyiI50C6biDWlntRBrNn1gZZtPW8Y7Pi+gtR775XSdZ3lfoaA6SMXPB8P0HIGRj0YoJGFDeIvbWjUcIZPYAAlliK2JE0Fl1zAxW1oMb9yBF3xfkkO7Ccm4ZENvfSo7bOVG5eKgH66WfwZK4ZTOYkVnW6DnhRks9rItmQPnx5e1S5limczaZmqKKlAGSXwYBjbgDFp25Jm3jjgX37kwLLvY1AwCeJ/QLwjtB939qx48DtH5kGXLysZIWriMvG8tEVs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(11063799006)(56012099006)(261009223027099003)(261022075727099003)(261022105027099003)(261022113327099003)(261021121427099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVZzRnJFYkhrVmovVlFyY2JYdTI2S3h0ajZ4YWJ3ckxuZVV1Q1lYM2RhbGdh?=
 =?utf-8?B?eHRpS2I1U3MxTHRsU0kvL0diYk0zczRWNk5mSUNKR3VpeEZFVWZoUnhvOUxj?=
 =?utf-8?B?Zm15WVlOYkxrMUQ5VkMxOVB1b1c2NHpKckphWkdPY3JLYTViMVNCbTNkb09h?=
 =?utf-8?B?ZDdRL0FTQmw0QjF5dFdpelY5NUZIZUxreCt5OWNYaytkcDYrdU9lZ2hGV1ds?=
 =?utf-8?B?UnVnRkZJcUM0RDF1QWlqUXd6ZFdNRW9kVlduT2Y4K09UOC81WVJEcS9oMUo0?=
 =?utf-8?B?WFowNFFKM3VEVEp0ZHYyYm9ZRHgwRXExSllRR1MrbUxUWXBJcjRvbjJjcm9G?=
 =?utf-8?B?T2c2MnBvSGV6SlhRbWVBclhPaHBlMi93RnQzTkR6Z0dkSm1lMlJwZXc3bGFR?=
 =?utf-8?B?SFJlb29IK1RYNTNJMTEvaHM5WmhvRTUyOEdUUEo1OVU0V2Q3TWNpb3BmYkJx?=
 =?utf-8?B?NkV4SVRiZGhHTU5hWjIxLytTdlg5RVN1cmE0NW5xZXdVb09rZHhxbnVWbFdX?=
 =?utf-8?B?SyttbkZlOXI1YkY1TlNhZmpaVXBuTFRrZWQzc2JQWSt1bmI3YzNNa3NaeEFM?=
 =?utf-8?B?d2xCSVNkS0tBckcrV3pIV1pkZWd3NmZublY0STMzalY5V3plRmgweG5DN0h5?=
 =?utf-8?B?VFpoeG4yemI0akpMMkZRSndTMjVVZHFTL1Q2ZUU1VG1BWWlHSHZyVFRmb2RG?=
 =?utf-8?B?cEU2eThSS0QrMTNRWFJhenZuYzlqVlBwMzlwcDRlOTNMV29LUW5XYmM2bzZY?=
 =?utf-8?B?QmVCMmdGMkJyeFpTMUY4ekxwZ0xqaEYwRWk4R1VzN1I4Z0xLb2lOcjM0enRr?=
 =?utf-8?B?Q3FHQnR5TktkZkJna2xNZFJQeVI1RWViUG8vN09HS3BLQndNcXRlTUZhQ2ov?=
 =?utf-8?B?bExuaVUrdU9rK1Nmc1dXNm05eVZXdDcxcThPMjVMSmljRGxrUnFacnlsYXov?=
 =?utf-8?B?R2UzUFQ5ZnNEU2dReUlidmlHWWZmUmtlUnlJOWZkVkE2MHNlcWVOb2lIdXBn?=
 =?utf-8?B?b3V6eVBraG9IUkgwWXlpUXhXcnZtcnc3ZDBqRnN3TCs2Yk05ZlU4Mm1VcHhp?=
 =?utf-8?B?aFF2V3NpOEVaelpXbVRuQis5aUFkUExML044TjNNZ0E0QzNNOVM1OFhuTWJS?=
 =?utf-8?B?VGM1MzNSbE1CdGRBVm14ckNkck9ieXJMZnVpYnlOY3lCNHB6WjNBZ29PMFRG?=
 =?utf-8?B?eEVCL3hhRUpyTUlhRHcvQ3VBbXkwd1dMNTRVcmtuTVNHemtKNUNPUnFtRXk0?=
 =?utf-8?B?enNhMG93M0trb3hxekNiSUptMTFXbDdYbXZpNWczWTlmNFJwOUdvZEpqNmo0?=
 =?utf-8?B?RTBiL0EzM2Q1c3FrcmJ2OU5odWhlODdKRGJLVFQ1VjdxTDRrQ0xXRDk0Nkov?=
 =?utf-8?B?ejJxQWM1bGJZaHNZKzJpbjJWVkM3Vm10ZGxIMU1rU0tZNmRQS3lUWGE3T29Q?=
 =?utf-8?B?dWRiK0UzeWFGUVo3UFp5RnV2Z25LWS9wV0o5dzhzZ0pvS01hQnJ1Y3dZVHRu?=
 =?utf-8?B?elc2YTBoTWxJNU9qelNwdkpHNitoWEJ5S1ZLS1VHZVZGWDZCSHl1UzgweEs2?=
 =?utf-8?B?eFIyVjlXMHVXL1IwNTQ5TWJBOGVtb0FsdlVQNUpzTXFaclA3RDlxUlVyaUhy?=
 =?utf-8?B?ek56SVMwM1BhM1Q5TUNwR3p4LzJScUdaanVYdTlZRkVMWmR4UFJaeTBUWTU0?=
 =?utf-8?B?QWtqZnE0MEQveU9EQzduOS9yOExkL0hyZG9RK0x6a3JZTUxtSkVJNHU5UXJl?=
 =?utf-8?B?eWc1bWxBTk1BNGt3Nkx5NFFnM0tLNXo3V3hKVDJNZHRKNW1mY1dxaW9TTXZT?=
 =?utf-8?B?NnRleXdOQmV0NzRGdjVhRm1USTBmTHpsUmVmZFo4UmcxQWxnTWRSc1ZFRElE?=
 =?utf-8?B?OWdPNmwzQTZWK3M0aWh4RlVxOHZqMnlmOUpVcE9iY0dibWdZN01UbG1FamQy?=
 =?utf-8?B?VnJBM3hLRmhKWXd1eDlGeW1sZXMvc0o2dlQ3OEpiK1VscWR5NGZKRWM4R0M2?=
 =?utf-8?B?NWxldHFTWUtoVWZLSDRGRTI2OFN6UFFheExWWGpqb2lZOUlLNnp2SlRFZVBt?=
 =?utf-8?B?bnROV290NkJ6M3BrclZTeHMrVkgxWDYyQ213MzV0V2pPVFFyOUF6U25FUlpv?=
 =?utf-8?B?VVJBSTdRRFkrNElHSkNqOHBXU0VqYWN1YW96aE9xR1cxMFREaWdSNHh4U3Rp?=
 =?utf-8?B?cklsYW1hcENMWUlDa250Rk00UGN4NWFrdjh1aVFsTlp3Nk9rZWFTOTR6M2Vx?=
 =?utf-8?B?Q2NmYkNnTDRlVklFcUszNk5QZTdmQ0RyYlRINkRVRVVzNXN3NE5CUE94WDNk?=
 =?utf-8?B?M3FaQTRzWnlkYWRkeHhwSkVoWGRoNTVUMHlmamZhL2prWGMvYmMvZz09?=
X-Exchange-RoutingPolicyChecked: DGQA53lhMd139ZXE2HofuzXlNFjjKy5ZLECX1uOvQzEQ9fjxHmCzPscfu6Jz97np5Oy9iJ7D25Dr4CmLU5q787uM9N1Bl9kUlYz+0T2EV4YGTBOe4eYu/91OtfVrA3N/szFf+1vvK1bjOujfX2efADQy/LzM2/S66ZPRJo9DNSwEwyQ0tYfzFt+NJuBPXFgQ8QqwinajNIMJN5skNT3WFZoUXQ9qkMMhK5Un/z6Zf9FJEooUGBHS2EEiFR0h8YlArm1ULTqtp2lDipPZMv8sbhWK1hJLAXV0V2Ylcnu7L1rQ1+JOYpW8MJchOBV0wTX2g7hCM91PsA3MKzKWjqRodQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a0f1b570-c238-4ff0-9435-08df4971a89e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 14:54:22.0588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cjA2gN8fyR7H+x5yOWO7bxWvwys6PNBd4rUV3JFG1qo7G+Oz52GTNSIhNqVcBzZpgRCkpkSMoCXo0ezCR2kwDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4578
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

List the drm-ras nodes, and show the error counters of a given node:

  # drm_ras
  0	0000:03:00.0	correctable-errors	error-counter
  1	0000:03:00.0	uncorrectable-errors	error-counter
  # drm_ras -n 0
  1	core-compute	0
  2	soc-internal	0

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tools/drm_ras.c   | 106 ++++++++++++++++++++++++++++++++++++++++++++++
 tools/meson.build |   7 +++
 2 files changed, 113 insertions(+)
 create mode 100644 tools/drm_ras.c

diff --git a/tools/drm_ras.c b/tools/drm_ras.c
new file mode 100644
index 000000000..0af1ca919
--- /dev/null
+++ b/tools/drm_ras.c
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <errno.h>
+#include <getopt.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include "drmtest.h"
+#include "igt_drm_ras_nl.h"
+
+static const char * const node_types[] = {
+	[DRM_RAS_NODE_TYPE_ERROR_COUNTER] = "error-counter",
+};
+
+#define name_of(names, i) \
+	((i) < ARRAY_SIZE(names) && (names)[i] ? (names)[i] : "unknown")
+
+static void print_node(const struct igt_drm_ras_node *node, void *data)
+{
+	printf("%u\t%s\t%s\t%s\n", node->id, node->device_name, node->node_name,
+	       name_of(node_types, node->type));
+}
+
+static void find_node(const struct igt_drm_ras_node *node, void *data)
+{
+	struct igt_drm_ras_node *found = data;
+
+	if (node->id == found->id)
+		*found = *node;
+}
+
+static void print_error_counter(const struct igt_drm_ras_error_counter *counter, void *data)
+{
+	printf("%u\t%s\t%u\n", counter->id, counter->name, counter->value);
+}
+
+static int show_node(struct igt_drm_ras_nl_context *ctx, uint32_t id)
+{
+	struct igt_drm_ras_node node = { .id = id };
+	int ret;
+
+	ret = igt_drm_ras_nl_list_nodes(ctx, find_node, &node);
+	if (ret)
+		return ret;
+
+	switch (node.type) {
+	case 0:
+		return -ENOENT;
+	case DRM_RAS_NODE_TYPE_ERROR_COUNTER:
+		return igt_drm_ras_nl_list_error_counters(ctx, id, print_error_counter, NULL);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static void usage(const char *name)
+{
+	printf("Usage: %s [-n <node-id>]\n"
+	       "List the DRM RAS nodes, or show the content of one node.\n"
+	       "  -n, --node <node-id>  show the error counters of a node\n"
+	       "  -h, --help            show this help\n", name);
+}
+
+int main(int argc, char **argv)
+{
+	static const struct option opts[] = {
+		{ "node", required_argument, NULL, 'n' },
+		{ "help", no_argument, NULL, 'h' },
+		{ }
+	};
+	struct igt_drm_ras_nl_context ctx;
+	long node = -1;
+	int c, ret;
+
+	while ((c = getopt_long(argc, argv, "n:h", opts, NULL)) != -1) {
+		switch (c) {
+		case 'n':
+			node = strtol(optarg, NULL, 0);
+			break;
+		case 'h':
+			usage(argv[0]);
+			return EXIT_SUCCESS;
+		default:
+			usage(argv[0]);
+			return EXIT_FAILURE;
+		}
+	}
+
+	if (igt_drm_ras_nl_init(&ctx))
+		return EXIT_FAILURE;
+
+	ret = node < 0 ? igt_drm_ras_nl_list_nodes(&ctx, print_node, NULL) :
+			 show_node(&ctx, node);
+	if (ret)
+		fprintf(stderr, "%s\n", strerror(-ret));
+	else if (ctx.dump_interrupted)
+		fprintf(stderr, "List changed while reading, rerun for a consistent view\n");
+
+	igt_drm_ras_nl_cleanup(&ctx);
+
+	return ret ? EXIT_FAILURE : EXIT_SUCCESS;
+}
diff --git a/tools/meson.build b/tools/meson.build
index 68c31da92..78587ec74 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -38,6 +38,13 @@ foreach prog : tools_progs
 		   install : true)
 endforeach
 
+if have_libnl
+	executable('drm_ras', 'drm_ras.c',
+		   dependencies : [tool_deps, libnl, libnl_genl],
+		   install_rpath : bindir_rpathdir,
+		   install : true)
+endif
+
 executable('igt_stats', 'igt_stats.c',
 	   dependencies : [lib_igt_stats, lib_igt_tools_stub, math],
 	   install_rpath : bindir_rpathdir,
-- 
2.56.0

