Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2713CA6015
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 22:59:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 342FE10E17F;
	Thu,  8 Oct 2026 22:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BXZhVHmJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B47AA10E17F
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2026 22:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791500343; x=1823036343;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6Y9meDy+pMIPY4pv6Yv8e2CzHl+eZZI4a4S9AvTrzYM=;
 b=BXZhVHmJvqTcmBuku93tzh4Kf/APiGjvKAt9JE+zBrkbkeBgZQJVhU9a
 MK0vHhOhE9+Oj2vo7DNE6DM0JfPKGJSygWKuCF/2jalAqRdSHYcDqFdM4
 8kCbbqkAMdYstQVoaUC4571YGlLBG/c5hpk7OI9eJOMzQyP2+FNewdXg2
 Ks1oAlMNjDS6sFHIlFSWr9xlxsJiQ/OyaLVUImFzzAuqMy7wtEYxQ957D
 Un8E7VRRU2pZV8w6y+LDMO2s9/KD8U20GxMHO1GU3qLpDp4/dhjwVMPhB
 znCBPNvI1qmcdrnei9m5s4uVaip1YjjVbY7wJpRlC43cjsUuSBZLKcKls Q==;
X-CSE-ConnectionGUID: Q7ZEzaYXTpmYX2vC7v9ZXQ==
X-CSE-MsgGUID: qqQtONy/QH+ZgIzp96HPhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="306633"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="306633"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 15:59:03 -0700
X-CSE-ConnectionGUID: B5l6SdMyTV+HS5bcKk2Tfw==
X-CSE-MsgGUID: XRiV+5SXQwyZRemEcNDlYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="109754"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 15:59:03 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 15:59:01 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 15:59:01 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.47)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 15:59:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=meaqMH38dhd4mtVeLZ+EXsUR4e2EAgBR18tHxrJYViBim7+BYnha/RacqmscYVLV+/3PXlzg+qS1vRsTxyk5kEtCILvULGctmchv1luZpEWyBl6LsG5zOHXpraNHDQ4Es1VJZYg3NDrXJzlAsiJfMyaQ5+fiwXHjBqRCv9Scf+Zmk9NDpCYlMuiKcn7QootaV6HXICaBloEeyDAGzNtURP64e+hg5/2oxBozlEAZ8TXFLInM7DDst4pILWrngHSbUroGJR50rHtFB26pTWR8iuuKDDRfgYWRYXqnLXYKniR5h8K4AE/qkJja6MzvOcOD/pG2BdBsUyGlvScYvCoQUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Y9meDy+pMIPY4pv6Yv8e2CzHl+eZZI4a4S9AvTrzYM=;
 b=j4uaENAPocID96vu991ivDymKA0l2KOPZZVc1VZGUKQPaSTyimPdPZPlfQcQdjK5GcensWCc6HQufFwOSbMXdne0wJ5zQxmZ6tq8vllhRFKcehnBLEpUv2r1zccunR99gojE4SCKlMwKSR8FEyfD1/x7I0iaWq+ypFbMbIxeOJaqhzbBVBHziBi9KzHTeUVPaESz/yd1VHYaQe1mAlxu5z/bdDA59vG6GvJIs5+teV/qyG5YDVKRW3dckYxBCwIpIQZGZyamWgR4Exwp22vQW7ep5VG9G3AnGlGwBDsBCfdhYSC1D+1gNCwK/J6Q8NXAXCOwAExg9qY2232B5cgAwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by CY2PR11MB943027.namprd11.prod.outlook.com (2603:10b6:930:114::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 22:58:59 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 22:58:59 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "K V P,
 Satyanarayana" <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH 3/4] tests/intel/xe_fault_injection: Avoid backslash
 escapes in dmesg ignore regex
Thread-Topic: [PATCH 3/4] tests/intel/xe_fault_injection: Avoid backslash
 escapes in dmesg ignore regex
Thread-Index: AQHdVp/F/kmzt2L4uEmcd2KjnUXeM7bzt3eAgACL9uA=
Date: Thu, 8 Oct 2026 22:58:59 +0000
Message-ID: <DM4PR11MB5456AD99AC2A2B0D3BF8418EEA932@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20261007210603.1350158-1-shuicheng.lin@intel.com>
 <20261007210603.1350158-4-shuicheng.lin@intel.com>
 <20261008143609.yl5gfxmudvzwlqw5@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20261008143609.yl5gfxmudvzwlqw5@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|CY2PR11MB943027:EE_
x-ms-office365-filtering-correlation-id: bd45bac7-c74d-4ad7-419c-08df258fbd50
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|38070700021|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: q9BXgvvXp6AZ1JpMpQYrQJ5pT9MZZX9NhFSdg4E0P5KK9RIS1uD8yLiY2OGQRk0Qmh006KZsA4isCd4b3IfEoYb33ZTLQ5GVWa8wg8hoYvgdpOOsTeOlDBqv9WVDVQCnGGnM0Y37p7T1VL2hTpd0CCrO9HHr4odIQV+LNv04cf8f+s+rdLLBtpcWo3XmsF54x6q1jehli/uN1msexUjIqqPk0+Vep6ASS/UbtnIAFD1n/Q3hfg0pvenOAvacv0CVfGYHm6odkutoCqnbIz+DkLfRtEIu4RyPX53yhziUYVknJOpjwKr55yiBWoXLc3wvCYy+KvMOb1ABh0Dr3pGjTKTEOPkpAh4w9yzprTx+YuIyXHVgi2VRu7QkFVPR6tzlL4zF+bfuKlOPk9G/D2wA9z1m73VxQ6N5AxIaqoeTto/EFU72h/fmqKlxdxQaAxuypxOWmD4EXb6/RcVT5CQsNR6KHIuy/rfC42sybPb6Drs+umOABrnCUlf0b7QDcK3VnZ/W7GGKv7JCp/So3/o/t5lmL33jqOz9RAn0Ou/rTk0bjS8OIUm3dZVUD1+fgFk5RHrz3GkZul34enTwn1Tv4Hlr3AY0ab0OH7p7jrCHu8vRmekT7CrlTl+7Ciquu15hiolYHm7BxA7B7MvQA2iCllm/7OF6363mJiNFHQmG6cj5mj/srSOplJKhlwQXuGkrMMedfB0jEdYSLw9s3pXD21C2rbv0fg8DuNOOUho+5nM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cWE2a3htNGNhRjZEdEIrWVhGQTdtUUE1dFdLVkZTQ01aU0Jnb1o2VGFyQ2Rx?=
 =?utf-8?B?VVR2eHh5dW92Zmk4UUxNd0FBR2YrbTNlb1cvbUJYRnJGTmpsd1BZYnVoSU50?=
 =?utf-8?B?R29Nbnc3ZkxGb2R1cmk5d1ZNb3JOb3V3UW9OQ3RrSzU3QkZOTkQ0MFhWUlNp?=
 =?utf-8?B?NVB5MmxOeDNUMWkxaHJ3Tm1yZVJwcno1WnltaUpqSmxCQmhqN1JnSzhkbjF5?=
 =?utf-8?B?KzUwY25VLzEzZVFDS1NjTGpQcVV4cStFYWlYUlZhamJFdC9yL3pTd21HMERh?=
 =?utf-8?B?M2lyWE5tZFNERCtiWDdWU3cvV1dZdi9vL2dHdGdjZzQxTkxMeGVoWHFOa01Q?=
 =?utf-8?B?VHdLNWVWbHUzNlNhdnlhVVlUVVgxVW44RE8rdkUwMklzYXk3LzA2QWxZN3l6?=
 =?utf-8?B?RFROSm03dXVhamtMZWFCMk9YVWQrTGU2aWtJWGVXeTlDSmtZckVmbWNQYStQ?=
 =?utf-8?B?bmp2TUVjVXZRdmhCYytvWER6NGtza2x4d2lreWdVMWQvUWQvU2htanVRcDBh?=
 =?utf-8?B?RktpdUE1MVZucEZsUUdMenNZU01WTzJWNHMyNmJVcjhWMlFadisybVQ2cXpt?=
 =?utf-8?B?Yk5zSEtobnozVmNsbVUyc3JwZEFlL292bkZPVHh2MVQ5b2dXeE91U3lieitq?=
 =?utf-8?B?TnJiVHZjOTVxZ2R4NmU0VTB3Zk1jcE9SOGQ5bjdwUlY5MXEzMnFZSi9FRW1T?=
 =?utf-8?B?WGw5ZmZUNGVPaXRkcTZvYllyRUljdWFFTitjZmhUNml5aEpGRHQ1bFkza1Jv?=
 =?utf-8?B?UFJ2UWtvSUhzeDBVRzlhYlpnMDVnMHd5M2xTeVhhbXhXSldpc29haWZNT1Jz?=
 =?utf-8?B?V2QvY1ptc3NHOTJRTnd4OVJ2RXVVRGZXYXVNMm1DV1c5UU9GMGtPRDM4cS9r?=
 =?utf-8?B?RjBtbTNzSml2b2hwdjZpWVM0aEQxbHJJZy9pTmZFa0Y3amcxWXBhWndmUmVT?=
 =?utf-8?B?Y2srZFJWaS91VURQdGdvUllnOVFGUUgrR0Z5TjVtRTlKaDYrc0ZKQ1NIZkhi?=
 =?utf-8?B?NG5RakxRbVUzTVZhOWNFYUxITkdEZkZyd0g4djZRbEp6S2hjUjJyaWZxT0hw?=
 =?utf-8?B?c0tLWmxneVlKV093SWNkcW5sZlFrRlBHWjlKdlNnS2xxUk9CTE9jN0U2bnBs?=
 =?utf-8?B?aWFyRVdpVUpla2VoZWxiWmp4UG8xWGhuOTNhU3ozS3A3ODNmK3lvWjZaL2tN?=
 =?utf-8?B?S24wZjNOcGUxQi9Pc0RZKzN4eDF5OGV3SEVyZmlxOGp2RHQwaDcvWVpETk5J?=
 =?utf-8?B?T3I4SDBicFBjSXRzLzdST2YrV25LSThLRTdONWplZWlWWUY0WExPK1VhdnBH?=
 =?utf-8?B?QmVadmhjVGVCbmdXaVhCWjZ3QzhYaDF1S3Z4Rys1N0kvQy9YaWFQenh3VWp2?=
 =?utf-8?B?Y3hKZzh1dWE2eGQ4bTBsZERoMzljM2xwd1RrcDBjRjI3b1h2RmZqNC9PRGZ3?=
 =?utf-8?B?MFk0Nnh5aHdWU2VDa0VNTXpicjU5aTcvcnFMYlU1MDlwTlNrVGk4a1hMemc2?=
 =?utf-8?B?aHN2SEc3OStxUkxpYkczV056T2hpemc3QTJ2SnFYWXJ3M3o5dWs3dnZwS3pm?=
 =?utf-8?B?SGt6OVJIVDl4UTNlb2hCMGxzN3ZTdlNUUDlBUWdicFRrYk9mdndVb1RSajB3?=
 =?utf-8?B?Qm9Ddnl2N2ppL25VYkNoWkdjSFFqNVNJZjFNQTVuK2hZbnRjTU94RDd6a1R1?=
 =?utf-8?B?eEsvZWpiM21mL0lQL0JhSTBpMytYR1FaOUVzV3VHQnpLU3hvN2tvQ29Lckty?=
 =?utf-8?B?Zk1CN21rS2M3VkVLU1Jqbnc3MjJOMXJqT042N2FNZmNhVTRueDIyVEVVMnl1?=
 =?utf-8?B?alpRTHp5WnRaajJjbUNDTTRacmw3ZFlKdCtUQmJqdnRVMlBMUG5ES01XM1NL?=
 =?utf-8?B?ZnQyK2pmNXFIRHFyMEdJVjFtWE9GZTVuVGRSdTZyRXJCMkY5WFFHcFFLWC9p?=
 =?utf-8?B?REhwMENYaWpORy93UVJwY0gvTU5uaFFINzRZRVdURXNBUmo5UXF5MGl1WkI0?=
 =?utf-8?B?UWxxL3J1d01vWW9IOEkvVzJOZWlFQ3dzTzBoR0xzOTllUTk0OUdpZUpsbkFt?=
 =?utf-8?B?Szd0WWVEY1ZQNzNTNjY3SktEaDY3eDFLRzl6OHBscFFZRGtSazY3TFk0MXFq?=
 =?utf-8?B?UmFaTXpmTDhtNE9GMWgybFRVTmdITnI1cW8rVWp6SHVTeC9SUXNMckN5M01R?=
 =?utf-8?B?WDRkdURnNGh5bWg1V0lpaGRSVE56ajNyV2JrRTZwQlQ2ZExJWEZ4WjV3Mk5X?=
 =?utf-8?B?ZHplZlY1a3dlNEFvVytmR3V0T0xHN0tWbUE3cFRYdzhFMUVxMStwOVhlS24r?=
 =?utf-8?B?Y3ZtdnNhOFl0TitOMW15L3NwVVppaUhjMXJzOWRFc0ZWbnJNK3JjUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ycoY8ENt6lnsR/7b8XrAOn87mSwP6rf6R/QSnSw7+X8jjDcktKc71AXPuLUW0fQ9x72hEKj0WI9irG6A73Om9zUvH2m22MMSGoLtZO3sjh+N52mtdwN8IGSkYOGO9zwNFyaCLHJxLikFPo7LcQVYEBjIPGsd3+JgRCc0vPw+KJ3txMToDphNpDjZaRuuW2/GNDeAGOsQt9mjo7VfWX2tMKg/uSS2KAG8dgmbEvNq2x8L/P3yBmx0kIH/iMiCM70J1V471D+ms9zBWYwVBiBDqF6uxs6YPwr4T5isPheFyZMQlDCbNi5Xnf7RBlY/tcEWi7qzcTL3+2Hj7ipGd3vtnA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd45bac7-c74d-4ad7-419c-08df258fbd50
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 22:58:59.6439 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +84tLppEkyOUHboitlCrqw0sAL2ZPNi7aCQylvq5jc8GR1+uP4X4TZpyjcghznium2LoE363sNI2nXSDUovPTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY2PR11MB943027
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

SGkgS2FtaWwsDQpPbiBUaHUsIE9jdCA4LCAyMDI2IDc6MzYgQU0gS2FtaWwgS29uaWVjem55IHdy
b3RlOg0KPiBIaSBTaHVpY2hlbmcsDQo+IE9uIDIwMjYtMTAtMDcgYXQgMjE6MDY6MDIgKzAwMDAs
IFNodWljaGVuZyBMaW4gd3JvdGU6DQo+ID4gaWd0X2VtaXRfaWdub3JlX2RtZXNnX3JlZ2V4KCkg
cGFzc2VzIHRoZSByZWdleCB0byBpZ3RfcnVubmVyIHRocm91Z2gNCj4gPiAvZGV2L2ttc2csIHdo
aWNoIGVzY2FwZXMgJ1wnIGFzICJceDVjIi4gIlwqRVJST1JcKiIgdGhlcmVmb3JlIHR1cm5zDQo+
ID4gaW50byAiXHg1YypFUlJPUlx4NWMqIiwgaS5lLiAiRVJST1IiIHN1cnJvdW5kZWQgYnkgb3B0
aW9uYWwNCj4gPiBiYWNrc2xhc2hlcywgd2hpY2ggb25seSB3b3JrcyBieSBhY2NpZGVudCBhbmQg
YWxzbyBtYXRjaGVzIGFueSBsaW5lDQo+ID4gY29udGFpbmluZyAiRVJST1IiLiBVc2UgIlsqXUVS
Uk9SWypdIiBzbyB0aGUgcmVnZXggbWF0Y2hlcyB3aGF0IGl0IHNheXMuDQo+ID4NCj4gPiBDYzog
U2F0eWFuYXJheWFuYSBLIFYgUCA8c2F0eWFuYXJheWFuYS5rLnYucEBpbnRlbC5jb20+DQo+ID4g
U2lnbmVkLW9mZi1ieTogU2h1aWNoZW5nIExpbiA8c2h1aWNoZW5nLmxpbkBpbnRlbC5jb20+DQo+
ID4gLS0tDQo+ID4gIHRlc3RzL2ludGVsL3hlX2ZhdWx0X2luamVjdGlvbi5jIHwgMiArLQ0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+
IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94ZV9mYXVsdF9pbmplY3Rpb24uYw0KPiA+IGIvdGVz
dHMvaW50ZWwveGVfZmF1bHRfaW5qZWN0aW9uLmMNCj4gPiBpbmRleCA0ZjRhNzkyMmMuLjc3MmNm
MjlkZiAxMDA2NDQNCj4gPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9mYXVsdF9pbmplY3Rpb24uYw0K
PiA+ICsrKyBiL3Rlc3RzL2ludGVsL3hlX2ZhdWx0X2luamVjdGlvbi5jDQo+ID4gQEAgLTcyLDcg
KzcyLDcgQEAgc3RhdGljIHZvaWQgaWdub3JlX2RtZXNnX2Vycm9yc19mcm9tX2R1dChjb25zdCBj
aGFyDQo+IHBjaV9zbG90W10pDQo+ID4gIAkgKiBBZGRpdGlvbmFsbHksIGVycm9yLWxldmVsIHJl
cG9ydHMgYXJlIGV4cGVjdGVkLA0KPiA+ICAJICogc28gaWdub3JlIHRoZXNlIGluIGlndF9ydW5u
ZXIuDQo+ID4gIAkgKi8NCj4gPiAtCXN0YXRpYyBjb25zdCBjaGFyICpzdG9yZSA9ICJwcm9iZSB3
aXRoIGRyaXZlciB4ZSBmYWlsZWQgd2l0aA0KPiBlcnJvcnxcXCpFUlJPUlxcKiI7DQo+ID4gKwlz
dGF0aWMgY29uc3QgY2hhciAqc3RvcmUgPSAicHJvYmUgd2l0aCBkcml2ZXIgeGUgZmFpbGVkIHdp
dGgNCj4gPiArZXJyb3J8WypdRVJST1JbKl0iOw0KPiANCj4gTWF5YmUgd2Ugc2hvdWxkIGFkZCBz
b21lIGV4YW1wbGUgZG1lc2cgbGluZXMgaW4gYSBjb21tZW50IGFib3ZlLg0KPiBXaXRoIG9yIHdp
dGhvdXQgdGhpcyBjb21tZW50IGV4dGVudGlvbiwNCj4gUmV2aWV3ZWQtYnk6IEthbWlsIEtvbmll
Y3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT4NCg0KVGhhbmtzIGZvciB0aGUg
cmV2aWV3Lg0KTGV0IG1lIGFkZCB0aGUgZXhhbXBsZXMgaW4gdjIuDQoNClNodWljaGVuZw0KDQo+
IA0KPiBSZWdhcmRzLA0KPiBLYW1pbA0KPiANCj4gPiAgCWNoYXIgcmVnZXhbMTAyNF07DQo+ID4N
Cj4gPiAgCS8qIE9ubHkgYmxvY2sgZG1lc2cgcmVwb3J0cyB0aGF0IHRhcmdldCB0aGUgcGNpIHNs
b3Qgb2YgdGhlIGdpdmVuIGZkDQo+ID4gKi8NCj4gPiAtLQ0KPiA+IDIuNDMuMA0KPiA+DQo=
