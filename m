Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E55710E2F7
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Dec 2022 08:58:16 +0000 (UTC)
From: "Sharma, Ananya" <ananya.sharma@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Tue, 27 Dec 2022 08:58:12 +0000
Message-ID: <CO1PR11MB48345B7C715212511BBF84B5FDED9@CO1PR11MB4834.namprd11.prod.outlook.com>
References: <20221115170855.196572-1-bhanuprakash.modem@intel.com>
 <20221115170855.196572-44-bhanuprakash.modem@intel.com>
In-Reply-To: <20221115170855.196572-44-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t v5 43/52] tests/i915/kms_fence_pin_leak: Add
 support for Bigjoiner
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

LGTM=20
Reviewed-by: Ananya Sharma <ananya.sharma@intel.com>

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Bhanupra=
kash Modem
Sent: 15 November 2022 22:39
To: igt-dev@lists.freedesktop.org
Subject: [igt-dev] [i-g-t v5 43/52] tests/i915/kms_fence_pin_leak: Add supp=
ort for Bigjoiner

This patch will add a check to Skip the subtest if a selected pipe/output c=
ombo won't support Bigjoiner or 8K mode.

Example:
* Pipe-D wont support a mode > 5K
* To use 8K mode on a pipe then consecutive pipe must be available & free.

V2: - Use updated helper name

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_fence_pin_leak.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/i915/kms_fence_pin_leak.c b/tests/i915/kms_fence_pin_lea=
k.c index 1972a699..63657a74 100644
--- a/tests/i915/kms_fence_pin_leak.c
+++ b/tests/i915/kms_fence_pin_leak.c
@@ -124,6 +124,9 @@ static void run_single_test(data_t *data, enum pipe pip=
e, igt_output_t *output)
 	struct igt_fb fb[2];
 	int i;
=20
+	igt_info("Using (pipe %s + %s) to run the subtest.\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output));
+
 	igt_output_set_pipe(output, pipe);
=20
 	mode =3D igt_output_get_mode(output);
@@ -196,6 +199,12 @@ static void run_test(data_t *data)
 	enum pipe p;
=20
 	for_each_pipe_with_valid_output(display, p, output) {
+		igt_display_reset(display);
+
+		igt_output_set_pipe(output, p);
+		if (!i915_pipe_output_combo_valid(display))
+			continue;
+
 		run_single_test(data, p, output);
=20
 		return; /* one time ought to be enough */
--
2.38.0
