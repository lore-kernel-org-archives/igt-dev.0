Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A7AD149EB
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 19:58:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D203F10E0D7;
	Fri, 25 Oct 2024 19:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jIITtcZm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86AE010E0D7
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 19:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729886320; x=1761422320;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Bdo0UcnZbIpUcSjVQS5KGz4v0fKU7JTNmR0V+msrWGQ=;
 b=jIITtcZm6AUaRrFvDqrFZV6aFoDd3fMDAt9QMnisJjTddUehcvdgW5jX
 /1mcGX5q3Y/fI2p0glrWoHdKqzf8e6mG4pFq7C6vhCfxIhrlsg5aRUf18
 XPcDODgtO8LO3ASSR1EwrXTxpKZAJ9Wz2tzDWRzpbNC91dXO0yMKeLIf5
 sCgusXLP+Bjtfkh+knCSNDvUD17B9fN2iPJx93BdimiZwPRfu1dVPA9MZ
 /CElWfkM7znEKaQZtClAgtFwtijvB1c2R5OrnVFkcxz85d4lPmbQB1n8w
 lQ24KD7V+QHm4Ldd5vE5t5KgAwxPGUUEn4Hn7B02vspfxX3EGcrGWCN+l w==;
X-CSE-ConnectionGUID: xyTfjWHZSNqFQ94YmO+lzg==
X-CSE-MsgGUID: h1DCS9jYQZiBAoHPRVfAlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47028527"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="47028527"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 12:58:39 -0700
X-CSE-ConnectionGUID: bdKKIExdRzidklRQdvQNlQ==
X-CSE-MsgGUID: /ESUxUD7RTSNCkfz1t6Xgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="81115577"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2024 12:58:39 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 12:58:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 25 Oct 2024 12:58:38 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 25 Oct 2024 12:58:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wi+tGIrxPlmw9CXGxvYQ2pNenkHoTr5C1gZynA/860oarZtDztvrPcjdREhSEaczMpUhA85IHB3+z1CgMB4Nvv1WQl4mFqwiXuxWdJbxeMG31NlbKSULtoLe8FDX/DTsTzgOlcYP3KZNIZQsu5yRQ5ANOf19R72AyzCoWZTmoS3ZgsDQ/DDYNNqyDRd1czZX1EcDEdBUmNJQqjdWDB18VzVXrWUIMywCuNM2Xz63RmBSR20JwjJ1eAFeGuaU5jTnpyk05LVEwzv0h7LG/ZxjNDotu/BsbZuW4CHZ4sxKfdsGKZxP6zPkJMS+hIXILJ+z9sdrGpSrDcNmm2NE8RS0bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Iqeq33TvnKkiRANSfNtvz/gEOM49T/+SBf1cPRhUW8=;
 b=DRUoJUago9sg1hAcYEm2px6Csflj7Qrwv54DzvJBhWZ4hp0cgsx2qLtJ/vu25cWGqGG0Q790jgVZ+mcSahQzE05hiTM21oBlXKAMO7N5ppOcOwhdXbPPOxq2GyBm76PbGr5H9y1c5cJwzoJ3+s6R4tn0P3pBrNgZV/mUQ12ujx6TRbv57Gqal1pO+AYA/B0tA9t/NK54lwbbx9ZSQjmU32htCe4xubyzPxwPlUsmPwDuTw3brJZiO4rlOvYqZmjN2J8uvXulzh/wj36EWLFDTnWiI1yfJ6sXrswrHrRTcaAvkm2thXGFWofpZ4Dp0bQoGo1JBDotJN9RhaHnWhYrGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB6362.namprd11.prod.outlook.com (2603:10b6:208:3b5::8)
 by LV3PR11MB8555.namprd11.prod.outlook.com (2603:10b6:408:1b0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 25 Oct
 2024 19:58:32 +0000
Received: from BL3PR11MB6362.namprd11.prod.outlook.com
 ([fe80::497a:383a:6d76:ec5f]) by BL3PR11MB6362.namprd11.prod.outlook.com
 ([fe80::497a:383a:6d76:ec5f%5]) with mapi id 15.20.8093.014; Fri, 25 Oct 2024
 19:58:32 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Dixit,
 Ashutosh" <ashutosh.dixit@intel.com>, "Das, Nirmoy" <nirmoy.das@intel.com>,
 "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>, "Singh, Apoorva"
 <apoorva.singh@intel.com>
Subject: RE: [i-g-t 1/1] tests/intel/xe_exec_fault_mode: wait for the
 completion
Thread-Topic: [i-g-t 1/1] tests/intel/xe_exec_fault_mode: wait for the
 completion
Thread-Index: AQHbJnOiHaj4rHAKXEunHJ4espbM6rKWoHsAgABMEzCAAOgbgIAADqMw
Date: Fri, 25 Oct 2024 19:58:32 +0000
Message-ID: <BL3PR11MB6362F1C01310589250561AA99A4F2@BL3PR11MB6362.namprd11.prod.outlook.com>
References: <20241025002322.1422552-1-fei.yang@intel.com>
 <20241025002322.1422552-2-fei.yang@intel.com>
 <ZxrpVF3N88rDpyvv@DUT025-TGLU.fm.intel.com>
 <BL3PR11MB6362AF44F412F6B33E948CFB9A4F2@BL3PR11MB6362.namprd11.prod.outlook.com>
 <Zxvr2S4XqQYTX17e@DUT025-TGLU.fm.intel.com>
In-Reply-To: <Zxvr2S4XqQYTX17e@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6362:EE_|LV3PR11MB8555:EE_
x-ms-office365-filtering-correlation-id: eb50b0d2-270c-49d9-c6bf-08dcf52f677f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?QTjSrzFgBRf6KcuV3UlcgnvQc6mUirzkVMIP+JzQp2wP+/85DOME6S4QL07Q?=
 =?us-ascii?Q?1xSzqWpLkKc+h0peN2mejeu6BT6BsmLHWetBmsfJM8ubzfqs/M8PHAXUIS9z?=
 =?us-ascii?Q?LskCmKIQT679CBCrzO4npus37jU4p8YKR72UHSXd0CkGkvPuwv9oq+Uza4Do?=
 =?us-ascii?Q?k3hrWNMjw2NkPXQbVDmEB7qqv53kmGsyz3i5Qg4Mc2zNliOoTxpQRUCDjoS9?=
 =?us-ascii?Q?q6NRMnbces6PsyE3jjId6nFAhlmTvXmptUxnwEln9yX8+ybw4Ol7tCIpNmec?=
 =?us-ascii?Q?b/bIJZQYA0ePq6FIxMwtcgJnYFMpS6QaxDzElKhnTCeRZ5FwqzD1nCjgxWtK?=
 =?us-ascii?Q?IIwvmXhPocLtAVnk8kp8uJ2/ZwE11yvkaFyCr5/mdqbDEfq5CgylNQZghN/T?=
 =?us-ascii?Q?nk4n1VO5ihn+YfagTYUDAkaeuLIUVMGX53Ak7MfXdgkLJrcWrtjBwNGuu4Ic?=
 =?us-ascii?Q?RJqVah5gK5TxiIHOlsoLYEkIbBDLwArrNzPLLhxVps49sSVA5E8lOszG9DZ1?=
 =?us-ascii?Q?zoXLnCzsTOquwHkG7DWZZ8ZHz+TezS9d3KHpERoEQaATeVZPfBtkKqocqrjK?=
 =?us-ascii?Q?GFQAeRMXKKZtPp24ek1JOOC7jUFsaNHLqQK7fNDaxA6eya0Ky/9dc3izZ0Fx?=
 =?us-ascii?Q?PEx8oHAejcWS48IVl1WWeo+8Jib5rlIP8a8y+5QcoRyL4yCo9/AI43ouahbs?=
 =?us-ascii?Q?8jtHpf9gll7otNA/k4dbm+Qj1jfF6u4YnZ+kd6XRWg0huSDH1uPC8fcbRRAI?=
 =?us-ascii?Q?oCTnqvrkxxGrbb3LiowaQ8Cs++l3qHsVoA0mg5czQZOdnOvJU/U7QvoFTB6G?=
 =?us-ascii?Q?NLy4Ik84/CupIEht96Sbx3y3S0Eh3HMVPW7ag7dys3l7SHX64z4wMz8GU4PW?=
 =?us-ascii?Q?JefSG+IOxA2AfHh4EoLqt135fw4NMsnb9AlHTgxV1OlMB4thz0vhU6Ik3NvW?=
 =?us-ascii?Q?3S2WZT4/vfeP2eNwu8VVpHCzCtvqEWWvzKFprf3cenXm26AiMNLrfSW2TQ1L?=
 =?us-ascii?Q?12un+I2yoO4QHxLiE+MVY/0K/ooUkTlbPFKboaUGkbVVM1FBegjZfaPP1MPQ?=
 =?us-ascii?Q?boPLRzz2QmkbJekP464jFMGl1EgNgzOrxHq/xUx9Mjb0sa4/atMMCpcq5fj+?=
 =?us-ascii?Q?UyjxuOaUS6SPAgaWn285J/eqlUQZ/3HtM3OB9qz9r74JkhnvlHeH0Qwz9qME?=
 =?us-ascii?Q?XoqkG3VupmkoJ4B2QzY4prbdPh1H+ThwM2VAapxM607aHCYeDiLjkjONgtms?=
 =?us-ascii?Q?+a73jkmHSYKq8g7uY2lHZSka/ugJFXLMGlql2MqE/oPJnGoBv+mEcmlHACvO?=
 =?us-ascii?Q?De7npqhpirC0OXUvJhjGoIupvZ6ik5oJw2xOUmHVnhaH8YswmLBVxNYrVXdQ?=
 =?us-ascii?Q?s4h+ZfU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6362.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?n2JpV0va4Qr2wuwRFH0lBU2Vksvhty0ZS0xNKoC3R7w6HmffD4dMEw5NUnUy?=
 =?us-ascii?Q?RSqA6oO7wCpUWVfQcC7sZzqiziLq9lHhu0LHFvShw6BOJK0msmBosC91T5Dt?=
 =?us-ascii?Q?AmCydRjOsaEBFklHGI1pC7cvAIOxjRBDs9fJv+6RS8H8Og5fHBRlttuNxg3x?=
 =?us-ascii?Q?Pac9pVuK1Fluv1dq43Pi7RhV8CVfnRo6fSsDHL5RtWbOtxBAU+ULtknm/i3g?=
 =?us-ascii?Q?cOAQUIC3cs9WW1ewymJuop/y1ttrROLywkl8YReyK+cjNwC/J3AhDoHZirHM?=
 =?us-ascii?Q?5NfeaU8wAbm6pCKfPelNQRHe8IYP+sRuIcICOp7XhmYN9rEGv/aeQmp4Qo9U?=
 =?us-ascii?Q?pRJoVx3CHEauTaisfZh01MHK3/qisQCNnTt3DU/GkcfR98vUXTXY0FJ1fH4x?=
 =?us-ascii?Q?4YLwJOwYJkdy9C+tQE/KxeGevb/E1iaAKW8jbpielMYPGOFPk9nRYMR1aMUK?=
 =?us-ascii?Q?OJaUGWCPV2IkBi+19uD7TiwhHNOTjb/FcCwqQz4lUH0oBBqTdZiG97JAWlRZ?=
 =?us-ascii?Q?kIhe990CDwfUMORFci+2X9BitNDiYM0pYJe4igHY5FjaUWTR1+nawfaOZuJ9?=
 =?us-ascii?Q?sHfZ6jM3l1NM03iRwmd7hkjQ2TimOdQbd8fOJdrb114+oRlV7KkzQ/Nhd2Gk?=
 =?us-ascii?Q?oYVLL+MuJf4uB+1uMXqMxmHZQkcBdWux6DGZrQmBR/zv/oFsoZw2shYyQQfc?=
 =?us-ascii?Q?Nh08wS2shHQKEF+1kMSrDyyMD5cGRLC4jspG37rer7pU1O9rBq9UUQkSoKh3?=
 =?us-ascii?Q?OAX6lRST/f+RIvvjhF7POJhyav3RFqaxd2eKZsMFMarqa1IA0cckXZHw4XXO?=
 =?us-ascii?Q?nnG+82NYLoV6XbYZMYdvqzz/K/FwxK6xyqxvTV2GFqkgW0maYvlYarmpOEW1?=
 =?us-ascii?Q?q6bQ1qYfeRFdgcbw7Ae0D7EZhM5Y5ghHXisgVDkSjpBT6J6nCm3jXG7vbue3?=
 =?us-ascii?Q?PFbXEAfkWh6NeA3X+BM0jpaepmvseRbl2LDpO3xByLyXPzKfGZksPcViiVqX?=
 =?us-ascii?Q?YmAUFIu8iXScqs68i3nTvYa1VArs90eWwYCIEhItJa9d/FGrBs0nO6yoU3ur?=
 =?us-ascii?Q?PwyBrHGKLCFB0PZYMwQj0sOvL6XIUI7weZZ7Jx/7rbKHRK8HNQE35/gaPfOs?=
 =?us-ascii?Q?MBeHQ6bEYYz17Z9reenNrwPuic76QIfwyeRyWlcAoz5OcPaGSTCeicosx72F?=
 =?us-ascii?Q?vGB8LcbysMSUgDlQphziSOcj/U/I7IkP5psP+ZI5vU7X/zAKUC/Q7Oci6Fif?=
 =?us-ascii?Q?dPaSmM94TFwwGqnTYmjkbGJLwzDQk5Zr8gaoHcN6HZ/Y2I16uZVzw1f8Vnhl?=
 =?us-ascii?Q?+aZp+vYh2IoQ+Sc3bPhn3VdKkJ0Hbgsi+wYc0g814z9fT5BwfVgPmCkIcqgP?=
 =?us-ascii?Q?WtoQq58tytjVZjVHfEYJwctn4xOT4GG09Fc/DSsarh/8nZByJLFjn7CcXqNn?=
 =?us-ascii?Q?NRI42py1g0iebPKws/voHbjMrKauguLMLj/tboxR1AonIXuXnk+F4OWXOWN3?=
 =?us-ascii?Q?Bf76wPHsuUbkd9kKy2jDOGtK6leffJ2ikXR5s56BiWiUDJk2HAteDyJx0cmp?=
 =?us-ascii?Q?GL+gU8EU9hAVB3KmBI0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6362.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb50b0d2-270c-49d9-c6bf-08dcf52f677f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2024 19:58:32.7984 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u0wqo6KyxaBDQF3Q7n0XMMWtsH4nVjLKy8Kp3TPQvEPPZUei6c9I2vrQeCLVu33JO7SSBo3Kz7RPeNJUKfS1EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8555
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

> On Thu, Oct 24, 2024 at 11:15:08PM -0600, Yang, Fei wrote:
>>> On Thu, Oct 24, 2024 at 05:23:22PM -0700, fei.yang@intel.com wrote:
>>>> From: Fei Yang <fei.yang@intel.com>
>>>>
>>>> The execution on GPU is out of order, the completion of the last
>>>> submission doesn't mean all the jobs are completed. We need to make
>>>> sure all the jobs are completed before moving on to unbinding the
>>>> buffer, otherwise the test would run into CAT errors.
>>>>
>>>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>>>> ---
>>>>  tests/intel/xe_exec_fault_mode.c | 10 +++++++++-
>>>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/tests/intel/xe_exec_fault_mode.c
>>>> b/tests/intel/xe_exec_fault_mode.c
>>>> index 9cc51b7d3..d416c773b 100644
>>>> --- a/tests/intel/xe_exec_fault_mode.c
>>>> +++ b/tests/intel/xe_exec_fault_mode.c
>>>> @@ -305,7 +305,15 @@ test_exec(int fd, struct drm_xe_engine_class_inst=
ance *eci,
>>>>              }
>>>>      }
>>>>      if (!(flags & INVALID_FAULT)) {
>>>> -            j =3D flags & INVALIDATE ? n_execs - 1 : 0;
>>>> +            /*
>>>> +             * For !RACE cases xe_wait_ufence has already been called=
 in above
>>>> +             * for-loop, we should only wait for the completion of th=
e last
>>>> +             * submission here. For RACE cases we need to wait for al=
l submissions
>>>> +             * to complete because the GuC scheduling can be out of o=
rder, the
>>>> +             * completion of the last submission doesn't mean all sub=
mission are
>>>> +             * completed.
>>>> +             */
>>>> +            j =3D (flags & INVALIDATE && !(flags & RACE)) ? n_execs
>>>> + - 1 : 0;
>>>
>>> This makes sense and xe_exec_threads has similar code to this in functi=
on test_compute_mode() and given that is threaded test much more likely to =
hit this race.
>>>
>>> I checked xe_exec_compute_mode and I believe we need a similar patch fo=
r that test too. While you are here can you fixup that test too?
>>
>> Sure, I will give it a shot. The code looks a bit different, and there
>> is a 1 second sleep after the submissions, I guess that's probably why
>> we are not seeing a problem yet, escpecially on real hardware where 1
>> second is sufficient for all submissions to complete.
>
> Probably that is a bit hacky - a lot of these tests have hacks from early=
 Xe development that never got bother to review. I guess if it is working, =
low priority but removing the sleep and replacing with code like this would=
 be good I think,

I just sent a patch for that, but didn't really run much test, I will rely =
on CI results, will let you know if it's ready for review.

>>
>>> This patch LGTM though, with that:
>>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>>
>> Could you help merge this patch too? I don't have merge right.
>>
>
> Pushed.
>
> Matt
>
>>>>
>>>>              for (i =3D j; i < n_execs; i++) {
>>>>                      int64_t timeout =3D NSEC_PER_SEC;
>>>> --
>>>> 2.25.1
>>>>
