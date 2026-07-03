Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D491AC43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:44:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8917D10E60D;
	Fri,  3 Jul 2026 14:44:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ML05frow";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MH51r+wo";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207F510E60D
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:40:00 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 663CxL0f3410343
 for <igt-dev@lists.freedesktop.org>; Fri, 3 Jul 2026 14:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=gO/VCedAewc
 22gVRXOkq5QQQ1XlA6eELo5SL+VQAUf4=; b=ML05frow1C9YcC+hDzpU98e3VUH
 qCyTcmdDtClnyoiUe4wunDh7DwsZVGO+SUEORGZwdFMc5W22xqXApe7REI3kA0zN
 Xk3RkHXo23bh3LtTVi/07JZG+ZixK+E4j4QXyn5jh7OlPMxzOTFvlITqURwA6Q78
 jARhMPN33yP+sG8EgaFX6Cx3YVBY4HLLURJ5kIuN/8NltNKR7HzzJpnkWEKgcKGv
 i663iGwqZKzS6+72CcsaVtraG/+L2hISh6tNWWR4Q3/v21i3nlSgS2LWUYlNRiVq
 twOt9oALIQeI7/yTAhNACJQcXMFB8IzhRqntNY0h7nmkC1qxgZLJLIiLtOA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68u31hte-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Fri, 03 Jul 2026 14:39:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2cacf17c7e0so8348365ad.0
 for <igt-dev@lists.freedesktop.org>; Fri, 03 Jul 2026 07:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783089599; x=1783694399;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gO/VCedAewc22gVRXOkq5QQQ1XlA6eELo5SL+VQAUf4=;
 b=MH51r+woR0IuMMrCb/0bfMysRugTmCuHJRETgW7OuCMWu49UikWH/TQe4pAFAzdrsZ
 tDe3ohsbTLfugc51FycGvBqfQlqXNE2r6/kMnZ7QT8rM7jC8xfhkaSxHRyBprdfitly4
 8+IKewgEoF4He3+6WaAPK7kLqSVgd/257GwQSxuHSnGbudAGZvTD09zHkj3Cd+eqYkab
 Hxv6wAcn60N93N7CaatI6KJWk4Qmp4N9iF0cQXJXXJvReT3WO3zLS9VSK4vj5JJXnWkc
 zVqfPKPq8ahqGc7m/jGmfza01Ei9ItEWIOh+A4ntFGNxVXYYNOBbom5HC1l1aq9qyV7X
 iRmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783089599; x=1783694399;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=gO/VCedAewc22gVRXOkq5QQQ1XlA6eELo5SL+VQAUf4=;
 b=PY/IO4U1WXKfpeD9WSw0Y/FsGWndsOLAlAhyDTkYF4g5YcQC3JLMLfPAUSeFsWBLH1
 nXlTwRdhDOwmrdOZGli8mi7I+mZdKYxzVeinmeqtZlNAtXc66RHZ9MStn3pYJEJ9dFxD
 2jN/jBAU8cMSxPzLKA3QUmc2egsOmbkHe/wIgns702yhKkkeZLegVmdksGaM0bHDyyNA
 ToyUMQskqnjiC+Y9yIdoRe9igyj8Q+41O76TlvkjZHmzxmeOGIGIhfV0jCs+mBfNFKqk
 lf5Ws+oZflKLbvW4f+enOZY8ILLsZ/nYP/VdqQdlM+nu6eMeztPED6AaVeHu2XutH3Ry
 D9vA==
X-Gm-Message-State: AOJu0YwujFUSL8vCWQJhqK55JBHvZEWPdOFgsNmYh8jygi8GtDULk1eW
 HFOeAJBOZ7sV3EPEk0W1JOJNE2tmvDJ7IAlpAACa58KwmYDz+InVhk64X6MTs5MbKwEiQBrHcYB
 f9d4i+M1+VHKof2IM9hdRkohC2RRVynz6hbJAwLG8QYc7ZM2WxzuMlVHZUiwznAG3JAi2P+PZ8d
 bo
X-Gm-Gg: AfdE7clPkI68u+4dBcJnGAZirM8WSxSYfmW+YLNjmGmVR0TtwAcI97AwBrmmUW+EN60
 EPFydek/tW9FSEBcR0mIlmx0MElqDAiYbmDTCSj1K3y89Pzdv55+but1F9BeCDeBwBNlDtvkZUg
 aegeaDSj6SNhniGtrQ4MEzKinFEMfNrR1NsZa0ZGjyhO0WSdk9u6dS+I+3wmUWRZF+aamSzhCx9
 VmzekZSalSAK+6hb4wbi+DAGTHDto5DILjzNnV9gs7X72hvPhmZUUv1WPrX3H6AR2ndDKcoJHYo
 kHWOw9wqiNeleFIaHYsSUcT2G4KZyqNcxwVShFoxCARbv91EXHpMpi2tA2AfIkSZhA0eyE2sh4c
 OifPaJZlecGufZmFIl/2/Q2RRocmFzkDtDE6nl1GfdrSdJLSDvMp5FA2BJw==
X-Received: by 2002:a17:903:1245:b0:2ca:281:27f9 with SMTP id
 d9443c01a7336-2ca911d8c3fmr98533185ad.27.1783089598489; 
 Fri, 03 Jul 2026 07:39:58 -0700 (PDT)
X-Received: by 2002:a17:903:1245:b0:2ca:281:27f9 with SMTP id
 d9443c01a7336-2ca911d8c3fmr98532745ad.27.1783089597737; 
 Fri, 03 Jul 2026 07:39:57 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cad7893dadsm10609925ad.74.2026.07.03.07.39.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 07:39:57 -0700 (PDT)
From: Rob Clark <rob.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH 1/2] drm-uapi: Sync msm_drm.h
Date: Fri,  3 Jul 2026 07:39:48 -0700
Message-ID: <20260703143949.280272-2-rob.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703143949.280272-1-rob.clark@oss.qualcomm.com>
References: <20260703143949.280272-1-rob.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: psXACz-7_hwmhmYjyANKGcnsFnx3RdWz
X-Proofpoint-ORIG-GUID: psXACz-7_hwmhmYjyANKGcnsFnx3RdWz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE0NCBTYWx0ZWRfXwphToVqod9gQ
 xqQHSw7419mG9kB7aV9K0TTTTFH9xhhgVBF3EBljJsrwNF7sjk4+Gx0ORJcqAYXkHXRmlYY7qkz
 qQEwKPYnVDe9/ucQYsbJBjLkoCYNMc8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE0NCBTYWx0ZWRfX+qykPBaof+a2
 LDp/4lN3lL9R8/gPqOZBgxiRDquZwZzRU5Qw9qCSTHLshN512bV3WLioMjsV0UeeT6wxq3UMSIb
 02TCSH2U/PUg2zf7Kqs/0suikcSMCi/RxFK1KjVjIHGd6bLM74Gbge4sdbgF3LsPCYjJ2JUgHvP
 EKbWAZW6trlL5glYgAlqFaKe0+4q/LI1Es9Yr1f0ReSHP3xfbHbSlJ4Clbcg6oFg4lVm4QJdltB
 MQOIiQl6BfSnBMWai1y/MSJHc5o5y5VBRMuJrSryB6AKtwMsjCN8TCgoCWcaahqWDtJQ2BNi0kO
 mJw2zL0tU7c4TJBaz1m4FyouLIC1+4zG95C3xRWSB1x6uU01JQeMMxQZIzq+JKcFoa/ylcKONMz
 8UcHiJT9/ZXrIydSlLPJt5PTlGqOS01U+mNFtKFRJGg0YPNur0e+zUZYLC5xaqTesnjKlvZUqw+
 VLW/Vt8HUpeFYFu6FmQ==
X-Authority-Analysis: v=2.4 cv=OaKoyBTY c=1 sm=1 tr=0 ts=6a47c9bf cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=e5mUnYsNAAAA:8
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=Nei9H0Qy7Mr5T7KAPYEA:9
 a=324X-CrmTo6CU4MGRt3R:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030144
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

Pull in updated UABI header with PERFCNTR_CONFIG ioctl.  Sync with:

   commit 44c460d2cc8b87c08360fe60f861660c8045ef90
   Merge: 9bb8af2770b7 9a967125427e
   Author: Dave Airlie <airlied@redhat.com>

       Merge tag 'drm-msm-next-2026-05-30' of https://gitlab.freedesktop.org/drm/msm into drm-next

Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/41158>
---
 include/drm-uapi/msm_drm.h | 204 ++++++++++++++++++++++++++++++++++---
 1 file changed, 188 insertions(+), 16 deletions(-)

diff --git a/include/drm-uapi/msm_drm.h b/include/drm-uapi/msm_drm.h
index 2377147b6af0..7f2e594be4eb 100644
--- a/include/drm-uapi/msm_drm.h
+++ b/include/drm-uapi/msm_drm.h
@@ -90,6 +90,34 @@ struct drm_msm_timespec {
 #define MSM_PARAM_RAYTRACING 0x11 /* RO */
 #define MSM_PARAM_UBWC_SWIZZLE 0x12 /* RO */
 #define MSM_PARAM_MACROTILE_MODE 0x13 /* RO */
+#define MSM_PARAM_UCHE_TRAP_BASE 0x14 /* RO */
+/* PRR (Partially Resident Region) is required for sparse residency: */
+#define MSM_PARAM_HAS_PRR    0x15  /* RO */
+/* MSM_PARAM_EN_VM_BIND is set to 1 to enable VM_BIND ops.
+ *
+ * With VM_BIND enabled, userspace is required to allocate iova and use the
+ * VM_BIND ops for map/unmap ioctls.  MSM_INFO_SET_IOVA and MSM_INFO_GET_IOVA
+ * will be rejected.  (The latter does not have a sensible meaning when a BO
+ * can have multiple and/or partial mappings.)
+ *
+ * With VM_BIND enabled, userspace does not include a submit_bo table in the
+ * SUBMIT ioctl (this will be rejected), the resident set is determined by
+ * the the VM_BIND ops.
+ *
+ * Enabling VM_BIND will fail on devices which do not have per-process pgtables.
+ * And it is not allowed to disable VM_BIND once it has been enabled.
+ *
+ * Enabling VM_BIND should be done (attempted) prior to allocating any BOs or
+ * submitqueues of type MSM_SUBMITQUEUE_VM_BIND.
+ *
+ * Relatedly, when VM_BIND mode is enabled, the kernel will not try to recover
+ * from GPU faults or failed async VM_BIND ops, in particular because it is
+ * difficult to communicate to userspace which op failed so that userspace
+ * could rewind and try again.  When the VM is marked unusable, the SUBMIT
+ * ioctl will throw -EPIPE.
+ */
+#define MSM_PARAM_EN_VM_BIND 0x16  /* WO, once */
+#define MSM_PARAM_AQE	     0x17  /* RO */
 
 /* For backwards compat.  The original support for preemption was based on
  * a single ring per priority level so # of priority levels equals the #
@@ -113,6 +141,19 @@ struct drm_msm_param {
 
 #define MSM_BO_SCANOUT       0x00000001     /* scanout capable */
 #define MSM_BO_GPU_READONLY  0x00000002
+/* Private buffers do not need to be explicitly listed in the SUBMIT
+ * ioctl, unless referenced by a drm_msm_gem_submit_cmd.  Private
+ * buffers may NOT be imported/exported or used for scanout (or any
+ * other situation where buffers can be indefinitely pinned, but
+ * cases other than scanout are all kernel owned BOs which are not
+ * visible to userspace).
+ *
+ * In exchange for those constraints, all private BOs associated with
+ * a single context (drm_file) share a single dma_resv, and if there
+ * has been no eviction since the last submit, there are no per-BO
+ * bookeeping to do, significantly cutting the SUBMIT overhead.
+ */
+#define MSM_BO_NO_SHARE      0x00000004
 #define MSM_BO_CACHE_MASK    0x000f0000
 /* cache modes */
 #define MSM_BO_CACHED        0x00010000
@@ -122,6 +163,7 @@ struct drm_msm_param {
 
 #define MSM_BO_FLAGS         (MSM_BO_SCANOUT | \
                               MSM_BO_GPU_READONLY | \
+                              MSM_BO_NO_SHARE | \
                               MSM_BO_CACHE_MASK)
 
 struct drm_msm_gem_new {
@@ -179,6 +221,17 @@ struct drm_msm_gem_cpu_fini {
  * Cmdstream Submission:
  */
 
+#define MSM_SYNCOBJ_RESET 0x00000001 /* Reset syncobj after wait. */
+#define MSM_SYNCOBJ_FLAGS ( \
+		MSM_SYNCOBJ_RESET | \
+		0)
+
+struct drm_msm_syncobj {
+	__u32 handle;     /* in, syncobj handle. */
+	__u32 flags;      /* in, from MSM_SUBMIT_SYNCOBJ_FLAGS */
+	__u64 point;      /* in, timepoint for timeline syncobjs. */
+};
+
 /* The value written into the cmdstream is logically:
  *
  *   ((relocbuf->gpuaddr + reloc_offset) << shift) | or
@@ -220,7 +273,10 @@ struct drm_msm_gem_submit_cmd {
 	__u32 size;           /* in, cmdstream size */
 	__u32 pad;
 	__u32 nr_relocs;      /* in, number of submit_reloc's */
-	__u64 relocs;         /* in, ptr to array of submit_reloc's */
+	union {
+		__u64 relocs; /* in, ptr to array of submit_reloc's */
+		__u64 iova;   /* cmdstream address (for VM_BIND contexts) */
+	};
 };
 
 /* Each buffer referenced elsewhere in the cmdstream submit (ie. the
@@ -268,17 +324,6 @@ struct drm_msm_gem_submit_bo {
 		MSM_SUBMIT_FENCE_SN_IN   | \
 		0)
 
-#define MSM_SUBMIT_SYNCOBJ_RESET 0x00000001 /* Reset syncobj after wait. */
-#define MSM_SUBMIT_SYNCOBJ_FLAGS        ( \
-		MSM_SUBMIT_SYNCOBJ_RESET | \
-		0)
-
-struct drm_msm_gem_submit_syncobj {
-	__u32 handle;     /* in, syncobj handle. */
-	__u32 flags;      /* in, from MSM_SUBMIT_SYNCOBJ_FLAGS */
-	__u64 point;      /* in, timepoint for timeline syncobjs. */
-};
-
 /* Each cmdstream submit consists of a table of buffers involved, and
  * one or more cmdstream buffers.  This allows for conditional execution
  * (context-restore), and IB buffers needed for per tile/bin draw cmds.
@@ -292,13 +337,80 @@ struct drm_msm_gem_submit {
 	__u64 cmds;           /* in, ptr to array of submit_cmd's */
 	__s32 fence_fd;       /* in/out fence fd (see MSM_SUBMIT_FENCE_FD_IN/OUT) */
 	__u32 queueid;        /* in, submitqueue id */
-	__u64 in_syncobjs;    /* in, ptr to array of drm_msm_gem_submit_syncobj */
-	__u64 out_syncobjs;   /* in, ptr to array of drm_msm_gem_submit_syncobj */
+	__u64 in_syncobjs;    /* in, ptr to array of drm_msm_syncobj */
+	__u64 out_syncobjs;   /* in, ptr to array of drm_msm_syncobj */
 	__u32 nr_in_syncobjs; /* in, number of entries in in_syncobj */
 	__u32 nr_out_syncobjs; /* in, number of entries in out_syncobj. */
 	__u32 syncobj_stride; /* in, stride of syncobj arrays. */
 	__u32 pad;            /*in, reserved for future use, always 0. */
+};
+
+#define MSM_VM_BIND_OP_UNMAP	0
+#define MSM_VM_BIND_OP_MAP	1
+#define MSM_VM_BIND_OP_MAP_NULL	2
 
+#define MSM_VM_BIND_OP_DUMP	1
+#define MSM_VM_BIND_OP_FLAGS ( \
+		MSM_VM_BIND_OP_DUMP | \
+		0)
+
+/**
+ * struct drm_msm_vm_bind_op - bind/unbind op to run
+ */
+struct drm_msm_vm_bind_op {
+	/** @op: one of MSM_VM_BIND_OP_x */
+	__u32 op;
+	/** @handle: GEM object handle, MBZ for UNMAP or MAP_NULL */
+	__u32 handle;
+	/** @obj_offset: Offset into GEM object, MBZ for UNMAP or MAP_NULL */
+	__u64 obj_offset;
+	/** @iova: Address to operate on */
+	__u64 iova;
+	/** @range: Number of bites to to map/unmap */
+	__u64 range;
+	/** @flags: Bitmask of MSM_VM_BIND_OP_FLAG_x */
+	__u32 flags;
+	/** @pad: MBZ */
+	__u32 pad;
+};
+
+#define MSM_VM_BIND_FENCE_FD_IN		0x00000001
+#define MSM_VM_BIND_FENCE_FD_OUT	0x00000002
+#define MSM_VM_BIND_FLAGS ( \
+		MSM_VM_BIND_FENCE_FD_IN | \
+		MSM_VM_BIND_FENCE_FD_OUT | \
+		0)
+
+/**
+ * struct drm_msm_vm_bind - Input of &DRM_IOCTL_MSM_VM_BIND
+ */
+struct drm_msm_vm_bind {
+	/** @flags: in, bitmask of MSM_VM_BIND_x */
+	__u32 flags;
+	/** @nr_ops: the number of bind ops in this ioctl */
+	__u32 nr_ops;
+	/** @fence_fd: in/out fence fd (see MSM_VM_BIND_FENCE_FD_IN/OUT) */
+	__s32 fence_fd;
+	/** @queue_id: in, submitqueue id */
+	__u32 queue_id;
+	/** @in_syncobjs: in, ptr to array of drm_msm_gem_syncobj */
+	__u64 in_syncobjs;
+	/** @out_syncobjs: in, ptr to array of drm_msm_gem_syncobj */
+	__u64 out_syncobjs;
+	/** @nr_in_syncobjs: in, number of entries in in_syncobj */
+	__u32 nr_in_syncobjs;
+	/** @nr_out_syncobjs: in, number of entries in out_syncobj */
+	__u32 nr_out_syncobjs;
+	/** @syncobj_stride: in, stride of syncobj arrays */
+	__u32 syncobj_stride;
+	/** @op_stride: sizeof each struct drm_msm_vm_bind_op in @ops */
+	__u32 op_stride;
+	union {
+		/** @op: used if num_ops == 1 */
+		struct drm_msm_vm_bind_op op;
+		/** @ops: userptr to array of drm_msm_vm_bind_op if num_ops > 1 */
+		__u64 ops;
+	};
 };
 
 #define MSM_WAIT_FENCE_BOOST	0x00000001
@@ -344,10 +456,20 @@ struct drm_msm_gem_madvise {
 /*
  * Draw queues allow the user to set specific submission parameter. Command
  * submissions specify a specific submitqueue to use.  ID 0 is reserved for
- * backwards compatibility as a "default" submitqueue
+ * backwards compatibility as a "default" submitqueue.
+ *
+ * Because VM_BIND async updates happen on the CPU, they must run on a
+ * virtual queue created with the flag MSM_SUBMITQUEUE_VM_BIND.  If we had
+ * a way to do pgtable updates on the GPU, we could drop this restriction.
  */
 
-#define MSM_SUBMITQUEUE_FLAGS (0)
+#define MSM_SUBMITQUEUE_ALLOW_PREEMPT	0x00000001
+#define MSM_SUBMITQUEUE_VM_BIND	0x00000002  /* virtual queue for VM_BIND ops */
+
+#define MSM_SUBMITQUEUE_FLAGS		    ( \
+		MSM_SUBMITQUEUE_ALLOW_PREEMPT | \
+		MSM_SUBMITQUEUE_VM_BIND | \
+		0)
 
 /*
  * The submitqueue priority should be between 0 and MSM_PARAM_PRIORITIES-1,
@@ -369,6 +491,52 @@ struct drm_msm_submitqueue_query {
 	__u32 pad;
 };
 
+#define MSM_PERFCNTR_STREAM	0x00000001
+#define MSM_PERFCNTR_UPDATE	0x00000002
+#define MSM_PERFCNTR_FLAGS	( \
+		MSM_PERFCNTR_STREAM | \
+		MSM_PERFCNTR_UPDATE | \
+		0)
+
+struct drm_msm_perfcntr_group {
+	char group_name[16];
+	__u32 nr_countables;
+	__u32 pad;         /* mbz */
+	__u64 countables;  /* pointer to an array of nr_countables u32 */
+};
+
+/*
+ * Note, for MSM_PERFCNTR_STREAM, the ioctl returns an fd to read recorded
+ * counters.  This only works because the ioctl is DRM_IOW(), if we returned
+ * a out param in the ioctl struct the copy_to_user() (in drm_ioctl())
+ * could fault, causing us to leak the fd.
+ *
+ * If the ioctl returns with error E2BIG, that means more counters/countables
+ * are requested than are currently available.  If MSM_PERFCNTR_UPDATE flag
+ * is set, drm_msm_perfcntr_group::nr_countables will be updated to return
+ * the actual # of counters available.
+ *
+ * The data read from the has the following format for each sampling period:
+ *
+ *     uint64_t timestamp;  // CP_ALWAYS_ON_COUNTER captured at sample time
+ *     uint32_t seqno;      // increments by 1 each period, reset to 0 on discontinuity
+ *     uint32_t mbz;        // pad out counters to 64b
+ *     struct {
+ *        uint64_t counter[nr_countables];
+ *     } groups[nr_groups];
+ *
+ * The ordering of groups and counters matches the order in PERFCNTR_CONFIG
+ * ioctl.
+ */
+struct drm_msm_perfcntr_config {
+	__u32 flags;         /* bitmask of MSM_PERFCNTR_x */
+	__u32 nr_groups;     /* # of entries in groups array */
+	__u64 groups;        /* pointer to array of drm_msm_perfcntr_group */
+	__u64 period;        /* sampling period in ns */
+	__u32 bufsz_shift;   /* sample buffer size in bytes is 1<<bufsz_shift */
+	__u32 group_stride;  /* sizeof(struct drm_msm_perfcntr_group) */
+};
+
 #define DRM_MSM_GET_PARAM              0x00
 #define DRM_MSM_SET_PARAM              0x01
 #define DRM_MSM_GEM_NEW                0x02
@@ -384,6 +552,8 @@ struct drm_msm_submitqueue_query {
 #define DRM_MSM_SUBMITQUEUE_NEW        0x0A
 #define DRM_MSM_SUBMITQUEUE_CLOSE      0x0B
 #define DRM_MSM_SUBMITQUEUE_QUERY      0x0C
+#define DRM_MSM_VM_BIND                0x0D
+#define DRM_MSM_PERFCNTR_CONFIG        0x0E
 
 #define DRM_IOCTL_MSM_GET_PARAM        DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_GET_PARAM, struct drm_msm_param)
 #define DRM_IOCTL_MSM_SET_PARAM        DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_SET_PARAM, struct drm_msm_param)
@@ -397,6 +567,8 @@ struct drm_msm_submitqueue_query {
 #define DRM_IOCTL_MSM_SUBMITQUEUE_NEW    DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_NEW, struct drm_msm_submitqueue)
 #define DRM_IOCTL_MSM_SUBMITQUEUE_CLOSE  DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_CLOSE, __u32)
 #define DRM_IOCTL_MSM_SUBMITQUEUE_QUERY  DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_QUERY, struct drm_msm_submitqueue_query)
+#define DRM_IOCTL_MSM_VM_BIND          DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_VM_BIND, struct drm_msm_vm_bind)
+#define DRM_IOCTL_MSM_PERFCNTR_CONFIG  DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_PERFCNTR_CONFIG, struct drm_msm_perfcntr_config)
 
 #if defined(__cplusplus)
 }
-- 
2.54.0

