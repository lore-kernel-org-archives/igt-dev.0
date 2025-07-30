Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C06C87FC9
	for <igt-dev@archiver.kernel.org>; Wed, 30 Jul 2025 10:23:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4526B10E164;
	Wed, 30 Jul 2025 10:23:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oAWAnsyX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 066F510E1A5
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Jul 2025 10:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753870987; x=1785406987;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=PutSVB89SclyTb2UZRDelEWPt1cODsVaSL3kw6wFLDk=;
 b=oAWAnsyXS6Gpw80DUacGFK83vzp7xjU40GkMvu3AfnxKPDod03SHDmvo
 l/RRu/Imz3XMbSJCUwQBytLGwEdiU6L7AokEmhbJ/Yu8WR5PXv44sKGS9
 gZvEXS3ovyF+jNqNQTUy0Fu4S/3Q7zNI99avpeBnBg1t5mHfPTg5uSx+A
 WE4kVYySvY7mAXVhsckghVGNcmc5GGTH452r1f0ZitoZXlMJLmQ4rCMVm
 I9y2eO9XS6XqRqdhojL79jvLA06f7fWUc40OY7xKPB9Wv+c+119WlHx7h
 25RkdyqArmc1TRrdY0aO8/PHd4+mcmW8pPRnKgMZNcc19dpqmNMLMGVOd g==;
X-CSE-ConnectionGUID: ++2EehrCSlqtsgaxoP5txg==
X-CSE-MsgGUID: dEEEVeusQjqeT3PRBzbEzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="58788592"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="58788592"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 03:22:52 -0700
X-CSE-ConnectionGUID: TDENFSDJSVmZ/ZawHfTrfg==
X-CSE-MsgGUID: /Ri3olvhQEWBIbyeHb8c1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="167201999"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 03:22:52 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 03:22:51 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 03:22:51 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.47)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 30 Jul 2025 03:22:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mm7sT6OkHkfj3RdAInmCv8wW3IPycSIIqwUJptsJNkhAoOXsmsSup8fHfTjcU3kK+EHsdhH/QQTa4nnyFlTXGyzCQUrXaMBHgxLmGGItM+zcIU7oPX26tQ/4/gWDLX+P3+w7xgctuElTjeoyZV6vh/ll7jIQTcRi1sHoUW+oG0egc6kCubRdKD+AOWnV88zgckagwIoxjO+pBKJ14Q52RdGl/24RPsZDVoIevp5vKkrjSpYqV/SR/DcXR5N6DHNcmv1bOGqyoSdAgI7EWfFqfBR0uJXMtzMukXEOOFCjrmE8Bfoq/y4MAKPMEc2Q7VAbkPwcZlXwpruTWqse6Y8O5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PutSVB89SclyTb2UZRDelEWPt1cODsVaSL3kw6wFLDk=;
 b=PKJ1dOcGMyTLAFlrmhAp4FmkP12wWes6iRRFlk4u87Wc2hYkOX35+ZHr6asBlFNhmvKMtq85B6qJHiiiIG1fanp+geIj+WBDl9Of3OVxMT7uEw2fAoJbHu/pqUuGlPiwxShBGLKWOmwWNSXLo+1ZmaoRu8C01/R2pY1V+HZ1M3/cXxJB9WTYStIYaf+1kkI4bCewCpHV+nNEwDJGM5cMxbmp7LMIuBpfq71Pt+nC6+/6XsxBV+XILgSpImebM/L5x+iBLd5pbU3fBo+c+gt1SycX+4ZdI3UvKqvgAgq8lbvcfnGatsUL8mlDS3VbeDSdEF258pql38r2/yF/W12bZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7730.namprd11.prod.outlook.com (2603:10b6:930:74::13)
 by LV3PR11MB8577.namprd11.prod.outlook.com (2603:10b6:408:1b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Wed, 30 Jul
 2025 10:22:43 +0000
Received: from CY8PR11MB7730.namprd11.prod.outlook.com
 ([fe80::9d99:8882:fb1e:3ad1]) by CY8PR11MB7730.namprd11.prod.outlook.com
 ([fe80::9d99:8882:fb1e:3ad1%7]) with mapi id 15.20.8989.010; Wed, 30 Jul 2025
 10:22:43 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
Subject: Re: [PATCH i-g-t] tests/xe_vm: Report OOM for vm_bind ioctl under
 memory pressure
Thread-Topic: [PATCH i-g-t] tests/xe_vm: Report OOM for vm_bind ioctl under
 memory pressure
Thread-Index: AQHcAEfzjCkRkqFSbUGGeCrtAB/8vbRKdzKA
Date: Wed, 30 Jul 2025 10:22:42 +0000
Message-ID: <0e7e0fea86eed522287724a4551bf533bcb7d184.camel@intel.com>
References: <20250729051622.3322969-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20250729051622.3322969-1-priyanka.dandamudi@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7730:EE_|LV3PR11MB8577:EE_
x-ms-office365-filtering-correlation-id: caf85a4e-4b3c-4eb9-580b-08ddcf530510
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?cE5Ddlh5a1oyVHZZcGwyRVVQYzB2dWtZU1hadG83YjhPYmpwWTNTV05QVUFK?=
 =?utf-8?B?WW1UVWF3bWRwU1Y1U2xuaDZVQWZlODVIWTEza29VM21ENFh2Q2t2eGU2bS9B?=
 =?utf-8?B?dW9EZkJ0YkxLc2ZKUThteDZqd2RXN0V4ZkJSQXM2dkdqVlRyUXNOUVA1amEw?=
 =?utf-8?B?NndyMjU4WVk0TEFrdzZ4NHFBd0x3WllhZEN4TU44NHFhb2xkMWI1SVJTbER5?=
 =?utf-8?B?OU9QTnA0TWdSZkUvazE3QTd6VG9GWFoyeHpuSUxaVnBBYnhYcGVuYS9DdzQ0?=
 =?utf-8?B?a0M0WjFkem9MYUQ1a0VSZjhaaEQwbHNtOWRYbVI4ZnJQejJRcUVaVVhjV201?=
 =?utf-8?B?aVgvWW1OUkhrNUM2Q201K0ZpOVBKYXpuNkFaZE85djF3M2V3eXZrdWhIRTRO?=
 =?utf-8?B?TGpUOUhXQVRDMGduVFNoN2JoSVhEemMvN0FPcUNFckhDN1NDRkU0NzQ2enQ5?=
 =?utf-8?B?NFJCemxablhEeFFVc0QxenNUalMzVjlNalBwbkloRFhzV05USzczOFZqSW5J?=
 =?utf-8?B?N0o3Q05NVVA3UFhzT3NqQ3V5dUJ6ZGJwS0E4VnRCVzcvSmtCcVBtdDAxMWZC?=
 =?utf-8?B?Y2toOGV3b3RvWklKVCtEYVZrQ0tIWlFBeE8zMjRRRjd5Z1h1ampnZkxLOWlv?=
 =?utf-8?B?c2o4a1hXOUZxNE5SdnBjNXFDcFVTMkFaemZ4dkhXYldNbnpYKy9KamIwYzN3?=
 =?utf-8?B?UGFUcnMxVDZwUXlBbmJTUm05aTlPbzZRN29zY1pDK0FrdmNIbXVOTXBkSk03?=
 =?utf-8?B?TE0rdngycWhsMHhBZFhlaWxyZjl1bnBVakI5TmJMeHNISFBPeUpqSEN0V0lX?=
 =?utf-8?B?ejdkS2g0RlJVYS9DREoyYk1uYnI4c255L0FqVktUODNHZWU0enNlWXlOdWVR?=
 =?utf-8?B?Um5mcHJpWnJjQk1JSDUwZDh1bVlDUkNYcjNrK3pYR2Z5QkFOMExrVWRXeTJt?=
 =?utf-8?B?dkUzN0FIbjc5VkR0LzJuWDNYM1hSd2lNaHI1OHVibmhyTGYwRFRpWFNHZEJ4?=
 =?utf-8?B?UmdWaDVEbFRoa2dySG1rQXhySWlMSk9xTjRVdWVrQ3ZQRUtSS0l6WG04c3Rz?=
 =?utf-8?B?MjR0c1NTbHdCU25sQ3dKOUc4M1ZUcnJLOGJrMnRsSkc5UU02RDh1bEE3Q0xv?=
 =?utf-8?B?Ri81WlFiZ0FsZExkL0hDdU5jYVY2RkFuWHJUK0pYRUhiTENSTjdxa1hsYWJY?=
 =?utf-8?B?WGY2TStDTVdPeFZyUVBIaEZvbFhweHdtcU14T3ZhTnVEeGMxNWhLU3YrdlM2?=
 =?utf-8?B?eXpDZTgwR3lhSFN2OHMwWmw5c0pFQ29SaEdoVVpFd2d6Q2JaSjJ2VDNwMDZG?=
 =?utf-8?B?RHM0dmJQK3pKYitaUEJrbXAvSjA3ZlFkQXJhbnFENnBlT0NHWDdFVzJSckho?=
 =?utf-8?B?UFRLUjJQbjdGb0FkcmxMSDlYVUpKTTFNSXFsNGFCQXcyMUdscmhBUG4xb0JG?=
 =?utf-8?B?UjdnK1IzNUxTaTVZYU1MK1d1ZjVtQWJ0bUJoMGpYcVdyNVZrbzRVd0hSWWsv?=
 =?utf-8?B?V3AwK2drWU82QUE1eG0xUVpDd2tpT09iVDJ2Z1VLQmJBT2tsZ3lzTjdWZjZ1?=
 =?utf-8?B?S1RoQmFRTVM3cGJsVG1JbXhrYStTazh3Mk9wRUVVRG4vRmllTlRKT01UYTN1?=
 =?utf-8?B?QkJaUUZIWDg2NUlpK0dKMWJwNzRJOFdhdkhidnlWVldQVVZMeXkzOFdyRW1M?=
 =?utf-8?B?eHNmcmNwWmt1K1B4RnRaNW8yWk5GSktNb0JHTmF1UzNwZ1c2UGx2WVlDQWRi?=
 =?utf-8?B?YmdPaVZoVFp4K3dtUENWbkhhZTUxUnIwRHRvSDdwdWxVc01zSmVJMmJiWTJ2?=
 =?utf-8?B?SmlnSkZ4RXBubCsrN0pxbW10VWVLSndRNm1lNUdMclM2cUk2aEw3U005YVl3?=
 =?utf-8?B?eGlhc0NxTENKK3R2eEtlRXl4eXpjVHNJMDczamw3VGVaWFdmZDNFSHlxYWFs?=
 =?utf-8?B?cjJ2dzVWeGU5ZGp4dnl4NTJwUEJUbjFtdVpRMWJTaE1vY2pIQVkyNnk3a2ZO?=
 =?utf-8?B?N3JHcHp3NXlRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7730.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Yk41MUpaS2FMNE5ydWYra1Q0WmhwTWdaanVHRGFqMngwTlZGNmJKSkpHdWhL?=
 =?utf-8?B?Y1N0M3ZvS1k3aU1XWmlFdFJ1UlQwa1N0YmhaQjNwbEEyZG1rNFk5aFc2MC9r?=
 =?utf-8?B?NGpHRG5PNklQU2ErWDZzNDFnVVFHcUhjc2VvU1hDcmJRVzN4MFpRV0c2QWFJ?=
 =?utf-8?B?QUdEMWdtWTRPdk1aQThFRXlrdW94L0xyTFVrMXBySDJZbzhEUy9KdHJRWmRL?=
 =?utf-8?B?VlNmNE9WeFk5Tm9ETnRjTWlHVExoMWZ3bWpIY1RqMVdacVJJZkFEa1ZkZVl4?=
 =?utf-8?B?YXlMcUhneWYzQk5YUXk1SUNMMjlVcWZGSVVVMDdYSmx2YXR3VUF4ZmtFUzFM?=
 =?utf-8?B?MUxNWGZhUE0wc1k1VzkybzZvNXhDb0Jmd2xTdTRVUnFrRjRFYWFaY1hRWlZY?=
 =?utf-8?B?cnVNYjlNZE50SENJMUhGUTNVWTR2QjlsbkxDWEJZMzZSNmJKZFBvMzZJOTE2?=
 =?utf-8?B?ZHJhMVc1LzFPNEdCVmJzeGw0NHp5SWt1RWloMEp3MzBUL0ZpVXFaMEN2VE1D?=
 =?utf-8?B?YU1Dc0tTekNhNFFweC9jMnZpYlJIQU9IRm4rZFd2MitSd2pLZUNhNEp3Q1hX?=
 =?utf-8?B?Qk91MERsV3FySlByY2V2eEFXRTlBcFNkRDNwczl2UlI0Rm9Kd2ZzYWEzT3Zi?=
 =?utf-8?B?RnZMSnljcWo4WTJhQ0IwZmh1QjlMU2dDdFlxRzFSRWkrZnBGSUFKSWZTQ21Z?=
 =?utf-8?B?eUNLRm9tNjZDWkZDczV1VXliUlJQZjhkVm1xNXM1RHBoUi9kWWsybXhNd0pq?=
 =?utf-8?B?OXhwaVNmMExiQ0lsNXR4cVV0N0paTnRxdkMwWkNjdzI1dnhFZHg5QVRhbnZO?=
 =?utf-8?B?NFFrUFVBbFNhRlpHUldxRUMyNE9OazlGdkpWdUhrWk5BZDRiL3R4dEJJcW83?=
 =?utf-8?B?M3dXUXNMOFVoSm1sbC9seWJqVmpaUjlZYTZCTGJjYUxhNU1JQ1Q1MkpjYWIx?=
 =?utf-8?B?MFRGZ0hvM3BuSkVQcG1FRnpQbURDOHRYNFpQVjdyNUF1eTZEREVWeXdVTytm?=
 =?utf-8?B?T3lDbFhSOUE2MDA1RFhRRmQ0RGdsQ2hlRWZwSjJwczdKMW5tcW5XTzlWR0dM?=
 =?utf-8?B?YW9FdHpaN1BQMGI0SEN3azAwTmJKWEo0MDdSd1NzVmNTNFBHMituZmFVeXdj?=
 =?utf-8?B?RGtDMFdpeFpFblFUL2dpbGcyeXRnOHc0Ly9NUUFPV1I0SnVBeXNpYzVwUmYv?=
 =?utf-8?B?OHJYMS9JRWhHaS9QVTFkTkVCWVB1WUE3dUtCa1BRcElSTktMQTNOS0pTU1JX?=
 =?utf-8?B?TzVpODhNZUFXRThVeDEzK1VBckJIZTFyWHQ2WXVaZWEwK0RQMDFUY0NHeXRL?=
 =?utf-8?B?NWZhTGxRNWIwaTFPUlBjdzVoRzU3WTlsYnR1TGhXa2dsVmZONGJpbWJHU1RJ?=
 =?utf-8?B?U3B6cGtVbFZGcVJlcCsyNmtrbzlFeTk2eTFMMEhvczBXNHBzWFRxZlRxYzNk?=
 =?utf-8?B?aGZBUkh1Sysxa2MzZi9XQnNwNjR2QWJGdmxKN0Q4eXltNWdVczhRaDI5K2ZC?=
 =?utf-8?B?Wi8zRkMvL09IeTkrVGlVQytaTDJYckEvbTBiOUgrbmpzSjErdmFHNWpBaW5x?=
 =?utf-8?B?ZHMyc2gzb1FIaEt0TXU3d21BMldnRWpjMHFTZ2NKYXBDR1VNS0dqWWQwdldk?=
 =?utf-8?B?MGY2SnNNbXJWR3lGSm1KYkFPOEl0d25DaGpqb2hKa2ZwODg2NGU4eVJIK2Q3?=
 =?utf-8?B?aEp0SEd5N0hmZDR4SWFEQ0daRktYdVNIR3JVdW14K0NYVGRwTFhxMEY3ZUtO?=
 =?utf-8?B?b05Ra2FaOExwa2YxWnJ0MDBSZy95OXk0YVVBeHovK1pNbGpjUVlXeVdnRUgx?=
 =?utf-8?B?Rlc1Z3NQdGZUMDFvSzMrRnBIVHloTmpDM2ltN3hWRjloVTdtSW9OQm9NRTZs?=
 =?utf-8?B?NHJRQ0VMN3d3dzhsMjhHcnV6bXFDZitRamQzc0loalMwaW5wZmZUcEs4RFEz?=
 =?utf-8?B?TElBbElEOFFiK0dxbGFFL1IrU3ByN3NYanFHWjdjR2dVVGIraGF5NUhucWhr?=
 =?utf-8?B?eitTaUxKN0o1VXlNVk82U2w5RlZPVHQxb3BwYkJSZmRsY0lmQUZpcVB0Y0p5?=
 =?utf-8?B?akhLTXFiNGR0YWY5S3FxbXpCMTkxUngrN1E4VnhqbmhsM1krVVdqQ1FFcjZn?=
 =?utf-8?B?cGNReFZ4ZzFiTWlKbDhXQnBmbEdGMHdMYVdGbk1kLzBrQnFjRmVvYUY2Rk5v?=
 =?utf-8?Q?/24WPJKM3ykiIiymjIaKscyMoOWzvx0+abGS8ajEFOpH?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D51730D7D0869C4790E217DB8B80E67F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7730.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caf85a4e-4b3c-4eb9-580b-08ddcf530510
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2025 10:22:43.0194 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KXqlUuLih8U93qB4M4UYeT2fA/oT7TBD4DlNgVPdO/5XIFBC/faTScdYK96FdVarFvDyLIHPJ80prcJ1QVXapwM2XQuSg4k6jtDvoW9axfU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8577
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

T24gVHVlLCAyMDI1LTA3LTI5IGF0IDEwOjQ2ICswNTMwLCBwcml5YW5rYS5kYW5kYW11ZGlAaW50
ZWwuY29tIHdyb3RlOg0KPiBGcm9tOiBQcml5YW5rYSBEYW5kYW11ZGkgPHByaXlhbmthLmRhbmRh
bXVkaUBpbnRlbC5jb20+DQo+IA0KPiBBZGQgYSB0ZXN0IHdoaWNoIGNyZWF0ZSBidWZmZXIgb2Jq
ZWN0cyBvbiBhbiBMUiB2bSBhbmQgdm1fYmluZGluZw0KPiBidWZmZXIgb2JqZWN0cyBpbiBhIGxv
b3AgdW50aWwgaXQgcmVhY2hlcyBPT00uDQo+IFRoaXMgaXMgdG8gY2hlY2sgdGhhdCBidWZmZXIg
b2JqZWN0cyBvbiBhIHNpbmdsZSB2bSBkb2Vzbm90IGdldA0KPiBldmljdGVkDQo+IGFuZCBpbnN0
ZWFkIHJlcG9ydCB3aXRoIEVOT01FTSBvciBFTk9TUEMgaW4gbm9uIGZhdWx0IG1vZGUuDQo+IA0K
PiB2MjogV2hlbiB2bV9iaW5kIGZhaWxzIHdpdGggb29tIGV2ZW4gYmVmb3JlIHRoZSBtZW1vcnkg
YWxsb2NhdGlvbg0KPiBnb2VzDQo+IGJleW9uZCB2aXNpYmxlIHZyYW0gc2l6ZS4gVGVzdCBzaG91
bGQgc3RpbGwgcGFzcyB3aGVuIFZSQU0gaXMgc21hbGxlcg0KPiB0aGFuDQo+IGV4cGVjdGVkIG1h
eSBiZSBkdWUgdG8gbGVha2VkIFZSQU0gbWVtb3J5IHdpdGggYSB3YXJuaW5nLg0KPiBWTSBiaW5k
IGVycm9yIGNvdWxkIGJlIEVOT01FTSBvciBFTk9TUEMgZm9yIG9vbS4gVk0gYmluZCBzaG91bGQN
Cj4gaGFwcGVuDQo+IGF0bGVhc3Qgb25jZSBmb3Igc2FuaXR5IGNoZWNrIHB1cnBvc2UuIE1vZGlm
aWVkIGNvZGUgdG8gaGFuZGxlDQo+IHRoZXNlIGNoYW5nZXMuDQo+IA0KPiBDYzogVGhvbWFzIEhl
bGxzdHJvbSA8dGhvbWFzLmhlbGxzdHJvbUBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFBy
aXlhbmthIERhbmRhbXVkaSA8cHJpeWFua2EuZGFuZGFtdWRpQGludGVsLmNvbT4NCg0KSGksIFBy
aXlhbmthLA0KDQpBIGNvdXBsZSBvZiBzdHlsZSBjb21tZW50cyBiZWxvdzoNCg0KDQo+IC0tLQ0K
PiDCoHRlc3RzL2ludGVsL3hlX3ZtLmMgfCA4OQ0KPiArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysNCj4gwqAxIGZpbGUgY2hhbmdlZCwgODkgaW5zZXJ0aW9ucygr
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX3ZtLmMgYi90ZXN0cy9pbnRlbC94
ZV92bS5jDQo+IGluZGV4IGMxYWJiMDhiYi4uMDAxMTM0Mzg3IDEwMDY0NA0KPiAtLS0gYS90ZXN0
cy9pbnRlbC94ZV92bS5jDQo+ICsrKyBiL3Rlc3RzL2ludGVsL3hlX3ZtLmMNCj4gQEAgLTIzNjgs
NiArMjM2OCw4OSBAQCBzdGF0aWMgdm9pZCBpbnZhbGlkX3ZtX2lkKGludCBmZCkNCj4gwqAJZG9f
aW9jdGxfZXJyKGZkLCBEUk1fSU9DVExfWEVfVk1fREVTVFJPWSwgJmRlc3Ryb3ksIEVOT0VOVCk7
DQo+IMKgfQ0KPiDCoA0KPiArLyoqDQo+ICsgKiBTVUJURVNUOiBvdXQtb2YtbWVtb3J5DQo+ICsg
KiBEZXNjcmlwdGlvbjogVGVzdCBpZiB2bV9iaW5kIGlvY3RsIHJlc3VsdHMgaW4gb29tDQo+ICsg
KiB3aGVuIGNyZWF0aW5nIGFuZCB2bV9iaW5kaW5nIGJ1ZmZlciBvYmplY3RzIG9uIGFuIExSIHZt
IGJleW9uZA0KPiBhdmFpbGFibGUgdmlzaWJsZSB2cmFtIHNpemUuDQo+ICsgKiBGdW5jdGlvbmFs
aXR5OiBvb20NCj4gKyAqIFRlc3QgY2F0ZWdvcnk6IGZ1bmN0aW9uYWxpdHkgdGVzdA0KPiArICov
DQo+ICtzdGF0aWMgdm9pZCB0ZXN0X29vbShpbnQgZmQpDQo+ICt7DQo+ICsjZGVmaW5lIFVTRVJf
RkVOQ0VfVkFMVUUgMHhkZWFkYmVlZmRlYWRiZWVmdWxsDQo+ICsjZGVmaW5lIEJPX1NJWkUgeGVf
YmJfc2l6ZShmZCwgU1pfNTEyTSkNCj4gKyNkZWZpbmUgTUFYX0JVRlMgKGludCkoeGVfdmlzaWJs
ZV92cmFtX3NpemUoZmQsIDApIC8gQk9fU0laRSkNCj4gKwl1aW50NjRfdCBhZGRyID0gMHgxYTAw
MDA7DQo+ICsJdWludDY0X3Qgdm1fc3luYzsNCj4gKwl1aW50MzJfdCBib1tNQVhfQlVGUyArIDFd
Ow0KPiArCXVpbnQzMl90ICpkYXRhW01BWF9CVUZTICsgMV07DQo+ICsJdWludDMyX3Qgdm07DQo+
ICsJc3RydWN0IGRybV94ZV9zeW5jIHN5bmNbMV0gPSB7DQo+ICsJCXsgLnR5cGUgPSBEUk1fWEVf
U1lOQ19UWVBFX1VTRVJfRkVOQ0UsIC5mbGFncyA9DQo+IERSTV9YRV9TWU5DX0ZMQUdfU0lHTkFM
LA0KPiArCQnCoCAudGltZWxpbmVfdmFsdWUgPSBVU0VSX0ZFTkNFX1ZBTFVFIH0sDQo+ICsJfTsN
Cj4gKwlzaXplX3QgYm9fc2l6ZSA9IEJPX1NJWkU7DQo+ICsJaW50IHRvdGFsX2J1ZnMgPSBNQVhf
QlVGUzsNCj4gKwlpbnQgYmluZF92bSA9IDA7DQo+ICsJYm9vbCBvb20gPSBmYWxzZTsNCj4gKw0K
PiArCXZtID0geGVfdm1fY3JlYXRlKGZkLCBEUk1fWEVfVk1fQ1JFQVRFX0ZMQUdfTFJfTU9ERSwg
MCk7DQo+ICsJZm9yIChpbnQgaXRlciA9IDA7IGl0ZXIgPD0gdG90YWxfYnVmczsgaXRlcisrKSB7
DQo+ICsJCWludCBlcnIgPSAwOw0KPiArCQlib1tpdGVyXSA9IHhlX2JvX2NyZWF0ZShmZCwgMCwg
Ym9fc2l6ZSwNCj4gKwkJCQkJdnJhbV9pZl9wb3NzaWJsZShmZCwgMCksDQo+ICsJCQkJCURSTV9Y
RV9HRU1fQ1JFQVRFX0ZMQUdfREVGRVINCj4gX0JBQ0tJTkcgfA0KPiArCQkJCQlEUk1fWEVfR0VN
X0NSRUFURV9GTEFHX05FRURTDQo+IF9WSVNJQkxFX1ZSQU0pOw0KPiArDQo+ICsJCXN5bmNbMF0u
YWRkciA9IHRvX3VzZXJfcG9pbnRlcigmdm1fc3luYyk7DQo+ICsJCWVyciA9IF9feGVfdm1fYmlu
ZChmZCwgdm0sIDAsIGJvW2l0ZXJdLCAwLA0KPiArCQkJCcKgwqAgYWRkciArIGJvX3NpemUgKiBp
dGVyLCBib19zaXplLA0KPiArCQkJCcKgwqAgRFJNX1hFX1ZNX0JJTkRfT1BfTUFQLCAwLCBzeW5j
LA0KPiArCQkJCcKgwqAgMSwgMCwgREVGQVVMVF9QQVRfSU5ERVgsIDApOw0KPiArDQo+ICsJCWlm
IChlcnIpIHsNCj4gKwkJCWlmIChlcnIgPT0gLUVOT01FTSB8fCBlcnIgPT0gLUVOT1NQQykgew0K
PiArCQkJCW9vbSA9IHRydWU7DQo+ICsJCQkJYnJlYWs7DQo+ICsJCQl9DQo+ICsJCQllbHNlDQo+
ICsJCQkJaWd0X2Fzc2VydF9mKGVyciwgIlVuZXhwZWN0ZWQgZXJyb3INCj4gJWQgZm9yIHZtIGJp
bmRcbiIsDQo+ICsJCQkJCcKgwqDCoMKgIGVycik7DQo+ICsJCX0NCj4gKwkJZWxzZQ0KPiArCQkJ
YmluZF92bSA9IGJpbmRfdm0gKyAxOw0KDQpOb3Qgc3VyZSBob3cgc3RyaWN0IGlndCBjb2Rpbmcg
c3R5bGUgaXMgYnV0IGlmIGl0J3MgdGhlIHNhbWUgYXMga2VybmVsDQpjb2Rpbmcgc3R5bGUsIHRo
ZW4gdGhlIGVsc2Ugc2hvdWxkIGJlIGF0IHRoZSB0aGUgc2FtZSBsaW5lIGFzIHRoZQ0KY2xvc2lu
ZyBicmFja2V0LCBhbmQgdGhlIGVsc2UgcGF0aCBzaG91bGQgYWxzbyBiZSBpbmNsdWRlZCBpbiBi
cmFja2V0cy4NCg0KDQo+ICsNCj4gKwkJeGVfd2FpdF91ZmVuY2UoZmQsICZ2bV9zeW5jLCBVU0VS
X0ZFTkNFX1ZBTFVFLCAwLA0KPiBOU0VDX1BFUl9TRUMpOw0KPiArCQl2bV9zeW5jID0gMDsNCj4g
KwkJZGF0YVtpdGVyXSA9IHhlX2JvX21hcChmZCwgYm9baXRlcl0sIGJvX3NpemUpOw0KPiArCQlt
ZW1zZXQoZGF0YVtpdGVyXSwgMCwgYm9fc2l6ZSk7DQo+ICsJfQ0KPiArDQo+ICsJaWd0X2Fzc2Vy
dF9mKG9vbSwgIk9PTSBzY2VuYXJpbyBpcyBub3Qgd29ya2luZyBhcw0KPiBleHBlY3RlZFxuIik7
DQo+ICsNCj4gKwlpZiAoYmluZF92bSA8IHRvdGFsX2J1ZnMpIHsNCj4gKwkJZm9yIChpbnQgaXRl
ciA9IDA7IGl0ZXIgPCBiaW5kX3ZtOyBpdGVyKyspIHsNCj4gKwkJCXN5bmNbMF0uYWRkciA9IHRv
X3VzZXJfcG9pbnRlcigmdm1fc3luYyk7DQo+ICsJCQl4ZV92bV91bmJpbmRfYXN5bmMoZmQsIHZt
LCAwLCAwLCBhZGRyICsNCj4gYm9fc2l6ZSAqIGl0ZXIsIGJvX3NpemUsDQo+ICsJCQkJCcKgwqAg
c3luYywgMSk7DQo+ICsJCQl4ZV93YWl0X3VmZW5jZShmZCwgJnZtX3N5bmMsDQo+IFVTRVJfRkVO
Q0VfVkFMVUUsIDAsIE5TRUNfUEVSX1NFQyk7DQo+ICsJCQltdW5tYXAoZGF0YVtpdGVyXSwgYm9f
c2l6ZSk7DQo+ICsJCQlnZW1fY2xvc2UoZmQsIGJvW2l0ZXJdKTsNCj4gKwkJfQ0KPiArCQlpZ3Rf
d2FybigiVlJBTSB3YXMgc21hbGxlciB0aGFuIGVzdGltYXRlZCwgbWF5IGR1ZQ0KPiB0byBsZWFr
ZWQgVlJBTSBtZW1vcnlcbiIpOw0KDQpDb3VsZG4ndCB0aGlzIGJlIHJlLWFycmFuZ2VkIGxpa2UN
CglpZiAoYmluZF92bSA8IHRvdGFsX2J1ZnMpDQoJCWlndF93YXJuKCJWUkFNIHdhcyBzbWFsbGVy
IHRoYW4gZXN0aW1hdGVkLCBtYXkgZHVlIHRvDQpsZWFrZWQgVlJBTSBtZW1vcnlcbik7DQoJZm9y
IChpbnQgaXRlciA9IDA7IGl0ZXIgPCBiaW5kX3ZtOyBpdGVyKyspIHsuLi4NCg0KDQoNCj4gKwl9
DQo+ICsJZWxzZSB7DQoNCglTbyB0aGF0IHRoaXMgY29kZS1wYXRoIGlzIG5vdCBuZWVkZWQ6DQoN
ClRoYW5rcywNClRob21hcw0KDQoNCj4gKwkJZm9yIChpbnQgaXRlciA9IDA7IGl0ZXIgPCB0b3Rh
bF9idWZzOyBpdGVyKyspIHsNCj4gKwkJCXN5bmNbMF0uYWRkciA9IHRvX3VzZXJfcG9pbnRlcigm
dm1fc3luYyk7DQo+ICsJCQl4ZV92bV91bmJpbmRfYXN5bmMoZmQsIHZtLCAwLCAwLCBhZGRyICsN
Cj4gYm9fc2l6ZSAqIGl0ZXIsIGJvX3NpemUsDQo+ICsJCQkJCcKgwqAgc3luYywgMSk7DQo+ICsJ
CQl4ZV93YWl0X3VmZW5jZShmZCwgJnZtX3N5bmMsDQo+IFVTRVJfRkVOQ0VfVkFMVUUsIDAsIE5T
RUNfUEVSX1NFQyk7DQo+ICsJCQltdW5tYXAoZGF0YVtpdGVyXSwgYm9fc2l6ZSk7DQo+ICsJCQln
ZW1fY2xvc2UoZmQsIGJvW2l0ZXJdKTsNCj4gKwkJfQ0KPiArCX0NCj4gK30NCj4gKw0KPiDCoGln
dF9tYWluDQo+IMKgew0KPiDCoAlzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSAq
aHdlLCAqaHdlX25vbl9jb3B5ID0NCj4gTlVMTDsNCj4gQEAgLTI3NTksNiArMjg0MiwxMiBAQCBp
Z3RfbWFpbg0KPiDCoAlpZ3Rfc3VidGVzdCgiaW52YWxpZC12bS1pZCIpDQo+IMKgCQlpbnZhbGlk
X3ZtX2lkKGZkKTsNCj4gwqANCj4gKwlpZ3Rfc3VidGVzdCgib3V0LW9mLW1lbW9yeSIpIHsNCj4g
KwkJaWd0X3JlcXVpcmUoeGVfaGFzX3ZyYW0oZmQpKTsNCj4gKwkJaWd0X2Fzc2VydCh4ZV92aXNp
YmxlX3ZyYW1fc2l6ZShmZCwgMCkpOw0KPiArCQl0ZXN0X29vbShmZCk7DQo+ICsJfQ0KPiArDQo+
IMKgCWlndF9maXh0dXJlDQo+IMKgCQlkcm1fY2xvc2VfZHJpdmVyKGZkKTsNCj4gwqB9DQoNCg==
