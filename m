Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16130C43327
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jun 2026 21:28:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D6B10E40C;
	Fri, 26 Jun 2026 21:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OfBr973y";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="debKEdr9";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 475D810F717
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jun 2026 21:27:59 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65QJ8SXC1726103
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jun 2026 21:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=thEJD/9Mh3lieDwAugeAu4Et4Zprl0UAN2o
 Swf+vSqY=; b=OfBr973yWPvricCBA3ocYniEs2Jy6K/+tVfP3inW8MOUZ+njnL/
 rMjKFKtZRl1ef3452m7Vf8WqLYXd/dx5Yd20oPJoxMCw1C2IK9NKFQTRPEZ67ZVr
 mX5PQG9LvTxsDe3E057GmC1gogO5DbVRcJ86Z1ssF316oQ6HebKOrs+aMh0lQHmT
 ztU9Ku3as5wvBqGyWZ/HbJErPrt8D9eX1FnRdUbJpB6nPF6PTcvHNEG28HLvMNFD
 IAV/pVkvhiifMHl8Xcv2tIc7fyZOZbwjRbeEiB9zXdLEKgzxn8CSRgEtA4O8Avsr
 aWKcj6kBe+9r8nID4W9gihJzZvxfOhuzecA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1vm2h28w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jun 2026 21:27:58 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-845bc2f62c9so1022261b3a.3
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jun 2026 14:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782509278; x=1783114078;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=thEJD/9Mh3lieDwAugeAu4Et4Zprl0UAN2oSwf+vSqY=;
 b=debKEdr9e/6bCXCa2+vWOvS5fAKcz+5RL0XluE4x3DIVEkkZ6yI4MKHSant22xa54c
 CNy2p487OaBEtM5LJX81JRom10dXApdSGyIQ7Yobf8bJDDhlxubfkBMl81bBg7sDRggT
 DsMkxrW2Yd66J64G4EoIU28rylkipvIcSXYIGOYZ878lh2koRIvMU7bhB9km7L/TfmSr
 FmPGih87ElsDiw35AbzFkGKAtzVdgWVB9zQzHVr+F6J/BHFwKkXOJYip/Mq39ZU8sj+S
 ukghstkcUKVN0rTnt15cwJuyjqt6TMS/1xNXOzyBJI8vZ4qpfF0QuMNNbjmhoaPTiQ3r
 gLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782509278; x=1783114078;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=thEJD/9Mh3lieDwAugeAu4Et4Zprl0UAN2oSwf+vSqY=;
 b=hfPXLLewIMOMOnY8tswv/gBXSLRpjCYUpFr/gEzZ69VIVu15upFyaC2P7ft1Y0JHfw
 y2eqBBm7eAmRp2A5+nO0+xN6yp5eFkOIMK1A7BgUAdxTqwUU0DR217PV6CSRhvVaaD/Q
 3901cSddst7ThKEkGrf+KW6LNC8VVqx+GfjCcLZtNHUwnfTp9vGDiXoc1rS3ocyT9spO
 v7yDxZ5PZWANQ5KFw/VaVi9D/zpHPYTS9AmmmSKkL4gi4ce+LLrX9s/FLDWCk+k2KYpD
 i6MqLyLW3VRc//SxMZEiIQiTdWxfjSs+bcFi8a9NpoERcGFouWqC+EIPE2jmTehOvwWn
 WAXA==
X-Gm-Message-State: AOJu0YxWyPhInIFvHSElKh/QfAC9MnuQKnQdc7ZAGebTPVdpNyl00J9J
 SX+5OnZ+B+raxG1bYYUSMloAh0b7Ys+nDJvo86NP+uHPREc/zJr6TrZZWHdsJ5Zw/7ydPA70Fsh
 X7X6ZT/bJdSBHvfAoL0W3ugXyk3gWqKexzSxel9yrXMr9/80vFqE+o/cVpaNJLi7COX3fr+PqDO
 JDfb0=
X-Gm-Gg: AfdE7cleAcIETcTMO/oPHm3y4LLPE4mkLjuNOSYsCN0wdXMm9Ev5YdbCXI39u5+Bkmx
 u18ZLkGf9HDFh5hCkRKairqJjIIOPCVrxNc3LqZNZtRdHOEdegkXev7xYQTHdZpGhj3jQgZmnlJ
 Pn82O/Bjvz51gcb0SW4ipGMi+9zNHVtFL9LGQG21seiE452WQo1p6ZxpWfOZOmx7bq5dhI+wRwP
 q3GVFYjWxfkAVKNsIfTMKENMOM1IJDqwDyGrZUxxQ0zc3+ki1iPbJZv/yUzXrXzKv04SxRN9IlW
 qgxR19zRYzr2Bd4oYr1VDvRVWbA9YMxSQuQeKR4aMo2aNReuO0APy9BK6IPaD4x5XnIOAxqUgsb
 p0cGJNikzjWQ8Dtwdr4Y8SSFCiObmlV+1hVzOcRcuF6XrquWKfabPgXFNyTwjCZezn/lRzwBtgR
 I95BRN1ENE/2lKNbI2jjyBUVvVRwWcfOwBCQQOhSgv89Bxr/F71g==
X-Received: by 2002:a05:6a00:c87:b0:845:a302:2281 with SMTP id
 d2e1a72fcca58-845d25fb441mr1470210b3a.35.1782509277780; 
 Fri, 26 Jun 2026 14:27:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:c87:b0:845:a302:2281 with SMTP id
 d2e1a72fcca58-845d25fb441mr1470188b3a.35.1782509277145; 
 Fri, 26 Jun 2026 14:27:57 -0700 (PDT)
Received: from ip-172-31-25-255.us-west-2.compute.internal
 (ec2-35-83-207-173.us-west-2.compute.amazonaws.com. [35.83.207.173])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-845c4650e58sm2249393b3a.34.2026.06.26.14.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 14:27:56 -0700 (PDT)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu/amd_basic: use a portable spin-wait CPU
 hint
Date: Fri, 26 Jun 2026 21:27:43 +0000
Message-ID: <20260626212743.16149-1-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE3NyBTYWx0ZWRfX1QpAZZ0vTnhV
 5cVI48Gka+kh5etc7CQDUSf1frrI4EegGI4fEBxndc+LzrfFx0Kp87yDo+6FdF6QrxRfOVqyJLJ
 FmfZQ6grRRtDkg2gvP0vwlY0M7uLD65ezl1AlRWmUQrJmchhaIbK9T//o567YHZQzDQjAydNh+k
 givAd61iP+daeT9FKjRuB2oKgyvty29+p9nEY3ZSN9cs4//4Necd4ZibRiZtKHf7v7uQQZv9omz
 O8KkKxjzSgu3fRzFDMAl4xkNlYsnvspb+AhVU1SKfL6x4ysjvrwuBqxNDUFyaC2PqLAI9jPaJ5/
 Gz9YqlQqH+DKm531Od/GXMgvMLYqDB8djZZ1IF58Ip5szij44qO6RpR4ZhNf4vSHWxFpHAYgEcA
 X9lb+Qd2ZxF5qQHW15gkmWH4+SrBnxVjf8/2l/mKcz5mNkDz1v3UmBj0zHAQnxTPEiUCeEQJDR7
 yXrStPFlptmNm8CVsFg==
X-Proofpoint-GUID: UBCUxv-uqP_lboS5PCjeRyExzOVSJYnc
X-Authority-Analysis: v=2.4 cv=UIvt2ify c=1 sm=1 tr=0 ts=6a3eeede cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=P2/bgbqRawb6I1+7fxbs5g==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=7eQ_OMvLpQlDoeJT7OYA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: UBCUxv-uqP_lboS5PCjeRyExzOVSJYnc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE3NyBTYWx0ZWRfX+l6pXcjqCoRi
 vq+Vl0jpBUGfRrandUUTPOYDwhdlDI6l6mP2V6BP7q7aePh2fKijAJq0lkJF348wTPYE5HCCLgJ
 IEq0yPK6i4hq1NrNjcK3nJSPDMAvHgE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260177
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

wait_for_value64() polls a 64-bit value and, when no polling interval is
requested, issues a CPU spin-loop hint through inline assembly. The hint
was hardcoded to the x86 'pause' instruction, which is not a valid
mnemonic on other architectures, so assembling it on aarch64 (or arm)
fails:

  {standard input}: Error: unknown mnemonic `pause' -- `pause'

The breakage is easy to miss because it only surfaces in unoptimized
builds. wait_for_value64() is static and both of its callers pass a
non-zero compile-time constant for check_interval_ns. At -O2 the compiler
inlines the function, folds 'check_interval_ns > 0' to true and discards
the else branch holding the 'pause' as dead code, so the bad instruction
never reaches the assembler and the build happens to succeed. At -O0
there is no inlining, constant propagation or dead-code elimination: the
branch is emitted as written and the assembler rejects it. Builds that
select a debug / unoptimized build type therefore fail to cross-build the
amdgpu tests for non-x86 targets, while optimized builds do not.

Define a cpu_relax() helper guarded by architecture, mirroring the idiom
already used in tests/kms_cursor_legacy.c: __builtin_ia32_pause() on x86,
a 'yield' (the equivalent spin-loop hint) on aarch64/arm, and a plain
compiler barrier elsewhere. This assembles on every architecture
regardless of optimization level.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
 tests/amdgpu/amd_basic.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 3ad023472..5278fc572 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -20,6 +20,15 @@
 #include "lib/amdgpu/amdgpu_asic_addr.h"
 #include "lib/amdgpu/amd_utils.h"
 
+/* CPU hint for spin-wait loops */
+#if defined(__x86_64__) || defined(__i386__)
+#define cpu_relax()	__builtin_ia32_pause()
+#elif defined(__aarch64__) || defined(__arm__)
+#define cpu_relax()	asm volatile("yield" ::: "memory")
+#else
+#define cpu_relax()	asm volatile("" ::: "memory")
+#endif
+
 #define BUFFER_SIZE (8 * 1024)
 
 /**
@@ -704,7 +713,7 @@ static int wait_for_value64(volatile uint64_t *ptr, uint64_t expected,
 		if (check_interval_ns > 0)
 			nanosleep(&sleep_time, NULL);
 		else
-			__asm__ __volatile__("pause" ::: "memory"); /* CPU hint for spin-wait */
+			cpu_relax();
 	}
 }
 
-- 
2.43.0

