Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E9E6E08A
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2020 19:48:14 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Wed, 30 Sep 2020 15:47:56 -0400
Message-Id: <20200930194756.13054-1-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/igt_device_scan: init card in
 igt_device_find_first_i915_discrete_card()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Chris Siebenmann <cks-rhbugzilla@cs.toronto.edu>
List-ID: <igt-dev@lists.freedesktop.org>

From: Lyude Paul <lyude@redhat.com>

Because we never initialize the card pointer passed to
igt_device_find_first_i915_discrete_card() if we don't match any cards, we make
the mistake of checking the contents of card in main() in intel_gpu_top.c before
they've actually been initialized, which can lead to a segfault in some
scenarios:

   # intel_gpu_top
   intel_gpu_top: ../tools/intel_gpu_top.c:1297: tr_pmu_name: Assertion `ret == (bufsize-1)' failed.
   abort--core dumped

So, fix it by making sure to initialize card in
igt_device_find_first_i915_discrete_card() like we do in
igt_device_card_match().

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reported-by: Chris Siebenmann <cks-rhbugzilla@cs.toronto.edu>
Fedora bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1884016
---
 lib/igt_device_scan.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 345bae76..d77311a4 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -453,6 +453,8 @@ void igt_device_find_first_i915_discrete_card(struct igt_device_card *card)
 {
 	struct igt_device *dev;
 
+	memset(card, 0, sizeof(*card));
+
 	igt_list_for_each_entry(dev, &igt_devs.all, link) {
 
 		if (!is_pci_subsystem(dev))
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
