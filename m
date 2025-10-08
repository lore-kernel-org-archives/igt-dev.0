Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF06CAC5BB
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 22:42:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB1310E094;
	Wed,  8 Oct 2025 22:42:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DG8eaodq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 077D110E094
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 22:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759963363; x=1791499363;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qTpw9FOgZv4N6gmHjJSuM2wBASw73FONvKACv966us4=;
 b=DG8eaodqGbrwCy+h5EEek4+OztUhYjpYmwd9yPKGKqCGLdfFMt38YP1E
 mNjVnUt5X1nip5drpidw+Lxunv8KLY0XbuLuuad6qeVyVyTRsF/hHbGSN
 0bz/X8NNzM7eCObkzBKBx0zKGqvOQ/gShSLDL8P7+PmOPy+29E0SQPYJp
 /jkrpI2LwepA7s/tvvXRTFEDogc2V+WpxK/40v+ZjsXkG3MVPNp5/U9SZ
 TtetdK10FWWaZrEsDclUhq40cP44sQBBvzZlUtjkRzVTM0C4Z6SPcm781
 DmG8IlauVk8SHAvEJb71dGGOLwtMsWV4BXebM39CdVcKPzxT7Fr+cRZV3 Q==;
X-CSE-ConnectionGUID: ZcdCQsc2SAinwQvJjzIg/Q==
X-CSE-MsgGUID: gssaGGHmTwip4JBq98CDyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="61373766"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="61373766"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 15:42:42 -0700
X-CSE-ConnectionGUID: w/xNunPLRj6Qf6KrNVp3wQ==
X-CSE-MsgGUID: 3UcgXSoXTUymxdeu0SNJ7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="180375766"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 15:42:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 15:42:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 15:42:42 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.35)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 15:42:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=olXKvVHm/60ElNvAbMsr/q2lWL/goGIhMoZDKp/uQdK8H5bpFjVBsSw2AqnFvxXHM7Yi2yyZFh4g52Rjk0aPp+75YlI/dUXCEJPygneb9OLnb6rvDkRFULOprvU1g3pyPSR5NCJRidxuL3lC3d9d82LMkQBAksyW377h6jKKcH6ufU1daZdqRsQdNuDFC6K/OR+JH5ojrIERMDEaaaxHX6OyW9tObSJlaOLdCeGEyyGmaO5zJQF0eNeA7dj6pxkqiacwbs4juFEk/UMldc0A7CohfMyIwPnmojlqPG7TvplZKoVq0c2Ix0SY8cMJUgjsVHOHMpTY9dIgKZ8U3FMCIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0IyR1CUeGBJ1m+fXGDVHlA08V+Ra7zFjNSHXWYxNGM=;
 b=Ak7SdDqQQPMnPW5td1PxrdpU0OY7LQC/KKmqPAuT9WYjEK2o2c3e9uTR2d1P4Nn0JVX8vRolHR/hXts6Ha3d3B1XeYyZl/wZN4NKujt5AHW/8DChjKq8IdwHP7Ct9e+h0Xm1wWduW9vMdt33O5RA/3hq1iae6yj8U/4T1iYkFVAqzVCDuecjyB7d+w1fscCEit98u6fngp+Xpm//ApNCNcMatnVel4zkeuDQ3xh66zJaujRkW2rzNX1DALf8DxvJRa480X/v7clcQCP+tyJSPZHB3BvIjiPWfBWHA77p0Y65GmnuDVApBmBD1WTOPE/T3es5XCp6QjlvO7RU/W1xwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA1PR11MB8396.namprd11.prod.outlook.com (2603:10b6:806:38d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 22:42:33 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 22:42:33 +0000
Date: Wed, 8 Oct 2025 15:42:31 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 05/18] tests/intel/xe_oa: Add oa_unit_by_type
Message-ID: <aObo17ZxFnfVdH6u@soc-5CG1426VCC.clients.intel.com>
References: <20251008211806.625154-1-ashutosh.dixit@intel.com>
 <20251008211806.625154-6-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251008211806.625154-6-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0039.namprd03.prod.outlook.com
 (2603:10b6:303:8e::14) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA1PR11MB8396:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f985f62-9f2d-4ff2-0ff7-08de06bbf89b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ny9LUHRzUFQzazJpMDZ3aExGM3N6OWZheUNROU5PbXdJaElMdVJsYzM4cFQy?=
 =?utf-8?B?Ym56dVcycDJiZjNVR1U4aEU3cjZUVGR2MGtmVUFWeUF2NStUT0kvNEU2aThi?=
 =?utf-8?B?c0pKNmlUMVRiR05UUGt3ZGlPdU1UZFlnMG9IL3prR0loMlllVlRLVTh6cUxB?=
 =?utf-8?B?VmlTQjVGT0NtcngxV1NkMVNIRnVkWTVDdmdIOEtrbnhnM29VMWVjSUZlYURL?=
 =?utf-8?B?VE9NQlJ3VDk3bzFDa1JQeXg1ZDJnMVZWbHA3Uks3TVhBaXNzL20veDBINEdX?=
 =?utf-8?B?ejZkWjRTcDlFZjdENUptT3F6djZtNVlRaTRYT05oZ1Y2TW5SbEM1eVNpYjRw?=
 =?utf-8?B?emJnZ2hRSVl3UHF5L2xIbnYwM3NMN1JweENxcjkwVk9vQUJqYTI4Z2RFMkFh?=
 =?utf-8?B?ZzBtY21KZUtYMm16eUhldldnb3VsSTdoNWM5aUpBMlVaMm9teDkybnhrWTd5?=
 =?utf-8?B?b0RCU2drbFJ3WTQwZ3R0RVkwZHlSbXI0d0tCRktUY1F3SVpxYmlseGtSYkhj?=
 =?utf-8?B?Vnk4RktPcmlxaG94N0J1amxBV2pzR2diK1lxeXpzL28zd2cvYmR1OGhFK3NM?=
 =?utf-8?B?MzYvK0wzbExaWTFiMWw3ZGtwQklzdWNrTUFzdDlJTis4YnE5NXBwdWw0cWZD?=
 =?utf-8?B?TC9JS0JRSTlNVjF0bHRsZ0ViSXF4Y3grTkI3ZVdCT2Zic2V2OG1wVE0wS0pJ?=
 =?utf-8?B?WXNoVDJPdzFCV29XWFJoQmI4cXFmYitQTFZJWGVZNjBjUU85UjhyV1ZFaU04?=
 =?utf-8?B?UlQ4ek1QMXVhRllzME9DWXdHT2Q0eFZqeTE2VGwrZU5oYzRVeEpiWktlTmxK?=
 =?utf-8?B?NXJuTThhM05TRklBWFNWdEdCcndIVURIOERwWWJHbmRuL0xQRmxPRHBDa0tu?=
 =?utf-8?B?UlhXMkFraW5OeDREbFA1ZFRwQXNmcktyWHpGN1poR3ZlZ20vRXZDbmRxL1Rk?=
 =?utf-8?B?SGp4dWdob0RSUUhyWGphdXd6VDNuTEJGcTJDV2l5OW5hditvY28yRWtuVi9O?=
 =?utf-8?B?VXdzWkN3WUM2VlZrbXJlTGVFaVJleXJlSkp6T0ovQW5JRnpYSE1iZk02Rkla?=
 =?utf-8?B?cHg2c1pYNS9qT3hKYXlWekwvYVc5RWptNGxlcGVtWjlkak83dXZVSkc1dm5S?=
 =?utf-8?B?MVJiQk13S0FSb2dKM1hubmJ1Q2JVdkNPSSt4RFVHMUdWbThBcGw0Nlh1eU4z?=
 =?utf-8?B?RXQ3dmVqRE1XRFpvZWtjcFQ5TjhHbW0wOFQ5M0JrOFVzaFpnNWoyTmdvak1N?=
 =?utf-8?B?SHhMWjEzRnlHWXk3VVFFdGRvWUpBeFRSbmsrVmFSOHVURzdaU09oYlJRb1Rr?=
 =?utf-8?B?ekdOT2pONU11VFpkLzZ2MWVvK09BMUlqQjV1NVpPaFJSQW1JSlFnRmp6YnM0?=
 =?utf-8?B?ZkNxSXNONmRJbTJKbjlXWnl3MVo0VUJYUnhkM3B2VFdpc1NIekMyMm1teHZl?=
 =?utf-8?B?T0UvMHJrMlN5TVF4N04ralllTU15OXdHOEp1WnhHYk90SVJxVkZDVUZkTTJ2?=
 =?utf-8?B?VVlaRU94MlU4WisxUER3MFJCTkc0OHY3a1dOWTVtNTBPMTFqWkxkemx2dW9P?=
 =?utf-8?B?NGRNYitESytBM1dLekNRbFZOS2RjOXBkOVd0STB2N2FScmpCZEJyTlRJV3dG?=
 =?utf-8?B?V2trZ0owL0JtR3FESjZlUFV3ZTc1QTkvVWNCY3dWTkphY0dWSU1zb0ZvSCtp?=
 =?utf-8?B?ajNibFpVRTVOK1Q2MWNVRmQwOXJLM3dhK2FZYVhEQTQxRXNldlM4blFnblVt?=
 =?utf-8?B?L2VReHAyWGJnYy80S2M5TnRFVXpQNkg4ZGRYb29HbFFBZWVjTlQvNFNMMDRI?=
 =?utf-8?B?aUpmYVNvUFF0TEhkVFI4SXkxY2VZeTdEcTBuOFdCUWFNV1dPUmlrVEZrRHVq?=
 =?utf-8?B?ZWhsTGI4ZEhCcGhNUjZCVjRSeFFHZ0IycC9FWTFhNjk5NGVQL09TR3Y5TTVv?=
 =?utf-8?Q?R1f9Oaq/YtpoYLMZK2fhMrAUV/snZUN+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1BjSTYrdllsL1FOd1FpKzBtMVFneEo3YzNiTEgvM2R1bEwzTWlVQTJnYnNG?=
 =?utf-8?B?YmNvNnBhdExaU1FNVXBTMkZ0TndSNTNvSmNoQ1JRenZLbHhqaVBYWFlwZnlF?=
 =?utf-8?B?UXhsOFN2NERtVFpZNTNHQ2JpekJPNU54cXRSZTh1bkdoYVFJQklVbHpqUCtz?=
 =?utf-8?B?cWk3OStXVGlOdmNTUi8wZVZySk1MdElxMHN2dHMrWlpFREp0dVZ1dWQ0NGUz?=
 =?utf-8?B?cjRGM2FBaU9NY1pjWmozQlZGdzRqenI1cHp5cWswLy9rWmVIczhEME9WMlAw?=
 =?utf-8?B?K1hCQzhvNURXbHoxV09ZZGYxTTRFMU5wUnZ4dnQ3VFM2OWhPaTZlVmw5UDk0?=
 =?utf-8?B?VGpHNndIdjFsNmpoaHhFbm1qYkxKNUxKdEtlZHI4NDIxcEhDSkVYSGVHc1Y5?=
 =?utf-8?B?WGU0cmZUMURCbFRHekFITHRZOGxIV1dPVWNyb28vYmxUKzAxeWNWdEo2Qkp5?=
 =?utf-8?B?ME1OdWJCdldqRjdseVk4YlR3djg4TGFOZGpGU21Sb0xSVUZST2J3NDUzUExn?=
 =?utf-8?B?WmxGSmZ1RWZKYUpTa3JtTXhKY3dmRm13NnQ2Nzd6Ukw5Smhkc2haKzNoVnFU?=
 =?utf-8?B?SXIvMDh6cG1BSXJhNDdwOXptQ0JQTTkrTnptNzdjMWgrUENINzg2QndGMUNO?=
 =?utf-8?B?Zlc3T1BYamV0cGRLRlIrQ2x0QjhHZHdqZC9HODRwQzBCRUVqUXY0Z0VISFZ4?=
 =?utf-8?B?SXltazc3THkxaXJBa01WTE9LeU51MXZUVTRqYTRnVE43OXVhZ2hYRzViL05W?=
 =?utf-8?B?bjdaVUsra2Q0VWhRcWw3OTdxWlhmcDlBS2htNmxFOHEyTFdSUzlxcTdBbldE?=
 =?utf-8?B?ZkQwOStXWHNzR0Q2L0tJc2lWb2lUWTRrVWt5UTN0WjJ1L211NTFvWDIraTJ3?=
 =?utf-8?B?Y3dKVHpLTnEzQ3pqY0EzSURQMXdlL3RmREVGMDhKVC9RMFh1cm9jYXNPTWVp?=
 =?utf-8?B?SUF1R1RXZlZuVmZMcklYK2QrV0ttYUdpV25VOTZ3QkZReHVtTzZUQnpJYk5N?=
 =?utf-8?B?OW1WUklEbFA4L3E2UlRkWW1IU2ZObXliL1Y4UERxSXNsUi9SejVXcVRyMkh5?=
 =?utf-8?B?KzIvL1pnY3hET2UyZktsYjFjODVWK3kyVUZPeGI4c2pjMWxuckorTlJKQmU1?=
 =?utf-8?B?UHppeWZCaTQ2VGtuRFhRODFScFNETUlqdnpSNDRxWHZNMlRGZkxxcWg1U2RS?=
 =?utf-8?B?d3NnbXIxWW14YzZvcmxJbTdNM0JTM0ZPd2VieDVBL2VxQ0tSSWVlaFlIeDF6?=
 =?utf-8?B?L1k1SDllUDRpd0NjZEZ0TGFwdlorblY0Z3JOeTgvSld1MjZhQm1JODJkVWRs?=
 =?utf-8?B?YVpvWGZIOGxZS002N0hxT3o3WXdZTVRwd0doUStLMnY0SWl5MmdBaFI3dFdY?=
 =?utf-8?B?WkNKaHpkRnY4QnBzejltb251MDhwazFMOHM2Z3k3NUZ5MHk0dUlLR0EyME1l?=
 =?utf-8?B?aHY3Y0p4SE9iVytseHd4OE12bXQ5cGMxR1lYaGtCUzVDSURlL3hzQitjcm0y?=
 =?utf-8?B?YnhLbmF4ZGFKY2JVUjI0VjFsMi9kYXN1Y3ZiZ08rWFdwNkd5R01pUkkrVFFt?=
 =?utf-8?B?WUNzTXlnelFwNFRwUkdqam5Idlp4TjJPdWllY3dJZWhiMDJZeG1BUkdsNFVN?=
 =?utf-8?B?K1BzVldRa2lsWFpvcTU4czB3cU9BZmZRQ1c1dTV3K3lzTWptRTFVSjc2YVFr?=
 =?utf-8?B?NmUyQmNmcVQ0QWJtQ2YxSzJWQW5OQkZqS2RiQUxKVURKN0diMG51cWtmZkh4?=
 =?utf-8?B?RTFWQWp1Wm9TVHlEN1pGdm94VU5sYjNRNllreUhPWjhkeGJ2OXdYMlhtcTdM?=
 =?utf-8?B?aFpNTkpTTXg0U1RHbWQvT0NSSzNNR2NkOHdJcE9ObUZuOFdzeXBscjg3YmZi?=
 =?utf-8?B?L1ZzUE95U3NncnNHNnBBQ1JVdDJkelBNVTZFNmx3VGpldSsrQWFCM2kxOHB3?=
 =?utf-8?B?TTdUVmRLSTkzRFh5eEMrSnVnSDVOSGtQOFM0cFZSR1hIcDNVOHlKd2RWdHFw?=
 =?utf-8?B?VEkzQ0lyK3JuZS9MbURNOWxHZmZTTlNuSy9zTmRmam5EaS9mTlBLZVQybjMx?=
 =?utf-8?B?UzJxVmRocmpTMmZ1cnVlL0dEZTNxWWU0WENFbW1PZGVnU3RBdFZvQnBpdE5t?=
 =?utf-8?B?a0lHLzhaSWpENUdHakcxUVdmdnd2b0RRUTJlOGV4a2tWa3NLbXpzRDgvclpT?=
 =?utf-8?Q?ri2sTz5L4zwEM8y0cIx1moI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f985f62-9f2d-4ff2-0ff7-08de06bbf89b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 22:42:33.4405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zq71hFtXWR1f7HgmBEGoTfKNc7J6ObpVPqkk1rgsn1pvT457cMD1++HMbIEUg5StOJQCBdiaksMuvHD16gjkShIIiqKZb7mrs32S4EthRBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8396
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

On Wed, Oct 08, 2025 at 02:17:52PM -0700, Ashutosh Dixit wrote:
>Add a function which returns an OA unit identified by its type (similar to
>oa_unit_by_id()).
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> tests/intel/xe_oa.c | 21 +++++++++++++++++++--
> 1 file changed, 19 insertions(+), 2 deletions(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index c7de1d081d..012f5929ce 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -494,6 +494,23 @@ static struct drm_xe_oa_unit *oa_unit_by_id(int fd, int n)
> 	return NULL;
> }
>
>+static struct drm_xe_oa_unit *oa_unit_by_type(int fd, int t)
>+{
>+	struct drm_xe_query_oa_units *qoa = xe_oa_units(fd);
>+	struct drm_xe_oa_unit *oau;
>+	u8 *poau;
>+
>+	poau = (u8 *)&qoa->oa_units[0];
>+	for (int i = 0; i < qoa->num_oa_units; i++) {
>+		oau = (struct drm_xe_oa_unit *)poau;
>+		if (oau->oa_unit_type == t)
>+			return oau;
>+		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
>+	}
>+
>+	return NULL;
>+}
>+
> static char *
> pretty_print_oa_period(uint64_t oa_period_ns)
> {
>@@ -4914,12 +4931,12 @@ static const char *xe_engine_class_name(uint32_t engine_class)
>
> /* Only OAG (not OAM) is currently supported */
> #define __for_one_hwe_in_oag(hwe) \
>-	if ((hwe = oa_unit_engine(oa_unit_by_id(drm_fd, 0)))) \
>+	if ((hwe = oa_unit_engine(oa_unit_by_type(drm_fd, DRM_XE_OA_UNIT_TYPE_OAG)))) \
> 		igt_dynamic_f("%s-%d", xe_engine_class_name(hwe->engine_class), \
> 			      hwe->engine_instance)
>
> #define __for_one_hwe_in_oag_w_arg(hwe, str) \
>-	if ((hwe = oa_unit_engine(oa_unit_by_id(drm_fd, 0)))) \
>+	if ((hwe = oa_unit_engine(oa_unit_by_type(drm_fd, DRM_XE_OA_UNIT_TYPE_OAG)))) \
> 		igt_dynamic_f("%s-%d-%s", xe_engine_class_name(hwe->engine_class), \
> 			      hwe->engine_instance, str)
>
>-- 
>2.48.1
>
