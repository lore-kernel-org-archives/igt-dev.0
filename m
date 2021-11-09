Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57FA06E88B
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Nov 2021 23:04:04 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
Date: Tue,  9 Nov 2021 14:59:21 -0800
Message-Id: <20211109225928.23711-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/7] Backport CT changes + GuC 62.0.0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Pulling in 27 patches from upstream, replacing 40ish in DII.

Asking for timely reviews as this was non-trival.

v2:
 (CI)
  - Fix build error
 (Michal)
  - Fix indentation

Acked-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>

---
baseline: 240f660b1c74da0c0851a475cabc654749ef87f2
pile-commit: abaf8fef45830b03b15b0f8494a8155474d71e84
range-diff:
1324:  3110523b76bc !  359:  8b756c4d4b79 INTEL_DII: drm/i915/guc: Remove sample_forcewake h2g action
1325:  035c450f323f !  360:  c1c3828b03de INTEL_DII: drm/i915/guc: Keep strict GuC ABI definitions separate
   -:  ------------ >  361:  8beb91ff79f6 drm/i915/guc: Drop guc->interrupts.enabled
1326:  aab6a0b3262d !  362:  c7af13c74f31 INTEL_DII: drm/i915/guc: Stop using fence/status from CTB descriptor
1327:  05130ecc0e56 !  363:  18fb8adf94e9 INTEL_DII: drm/i915: Promote ptrdiff() to i915_utils.h
1328:  0cc7c6258d59 !  364:  35f73bf0f282 INTEL_DII: drm/i915/guc: Only rely on own CTB size
1329:  2f7137b39b8b !  365:  2e6eb2ef0ee8 INTEL_DII: drm/i915/guc: Don't repeat CTB layout calculations
1330:  f07b63fd0a32 !  367:  52e2c0c6669a INTEL_DII: drm/i915/guc: Replace CTB array with explicit members
1331:  fcadfd27ace6 !  368:  a86a48dfe01d INTEL_DII: drm/i915/guc: Update sizes of CTB buffers
1333:  20036540f895 !  369:  3b0b949af81f INTEL_DII: drm/i915/guc: Start protecting access to CTB descriptors
   -:  ------------ >  370:  ac8f1ec44029 drm/i915/guc: Ensure H2G buffer updates visible before tail update
1334:  1742c79c2a03 !  371:  1e6c11ad4fa5 INTEL_DII: drm/i915/guc: Stop using mutex while sending CTB messages
1335:  fdd515a150f9 !  372:  6aebcd5d395f INTEL_DII: drm/i915/guc: Don't receive all G2H messages in irq handler
1336:  5601fb5746de !  373:  d0648932905b INTEL_DII: drm/i915/guc: Always copy CT message to new allocation
1351:  225d20e196e2 !  374:  816883d056f9 INTEL_DII: drm/i915/guc: Early initialization of GuC send registers
 360:  b7deff77b146 !  375:  55157b201c6e drm/i915/guc: Use guc_class instead of engine_class in fw interface
1350:  d33a6812e7f0 !  392:  0118b9b391db INTEL_DII: drm/i915/uc: turn on GuC/HuC auto mode by default
1337:  73fd24a01225 !  405:  843baf23fc10 INTEL_DII: drm/i915/guc: Introduce unified HXG messages
   -:  ------------ >  406:  c1dca56e8f6b drm/i915/guc: Update firmware to v62.0.0
1345:  1df4dd521719 !  407:  62056265474c INTEL_DII: drm/i915/doc: Include GuC ABI documentation
 443:  de519e66d617 !  462:  4505ce70286e drm/i915/gt: finish INTEL_GEN and friends conversion
   -:  ------------ >  480:  38b25e8985c4 drm/i915/guc: Relax CTB response timeout
1430:  21e818fa8e77 !  481:  048241cd3d9f INTEL_DII: drm/i915/guc: Improve error message for unsolicited CT response
1434:  aeb67b9f724e !  482:  692a16dd64af INTEL_DII: drm/i915/guc: Increase size of CTB buffers
1431:  738da5fa0523 !  483:  40d936ae2a0f INTEL_DII: drm/i915/guc: Add non blocking CTB send function
   -:  ------------ >  484:  ad33bf22c7dd drm/i915/guc: Add stall timer to non blocking CTB send function
1433:  afcc9816aa04 !  485:  48a800157edc INTEL_DII: drm/i915/guc: Optimize CTB writes and reads
1435:  b4dc9cd018c0 !  486:  fdca0f208fb8 INTEL_DII: drm/i915/guc: Module load failure test for CT buffer creation
1239:  6daebfff7458 ! 1265:  03970bccc0c7 INTEL_DII: drm/i915/gtt: map the PD up front
1241:  5a3f3c99bea9 ! 1267:  914dd2b9dcb1 INTEL_DII: drm/i915/gtt: make flushing conditional
1323:  213a2664f45f ! 1349:  4762fd97d20c INTEL_DII: drm/i915/uc: Allow platforms to have GuC but not HuC
1332:  c8a67a3d9a02 <    -:  ------------ INTEL_DII: drm/i915/guc: Relax CTB response timeout
1338:  24f51bddb897 <    -:  ------------ INTEL_DII: drm/i915/guc: Update MMIO based communication
1339:  d6f198b89263 <    -:  ------------ INTEL_DII: drm/i915/guc: Update CTB response status definition
1340:  5b8d33c706ba <    -:  ------------ INTEL_DII: drm/i915/guc: Support per context scheduling policies
1341:  e518ad395628 <    -:  ------------ INTEL_DII: drm/i915/guc: Add flag for mark broken CTB
1342:  b96b05e5f022 <    -:  ------------ INTEL_DII: drm/i915/guc: New definition of the CTB descriptor
1343:  555f29ee4761 <    -:  ------------ INTEL_DII: drm/i915/guc: New definition of the CTB registration action
1344:  f401ca7786dd <    -:  ------------ INTEL_DII: drm/i915/guc: New CTB based communication
1346:  5166ba4d2cae <    -:  ------------ INTEL_DII: drm/i915/guc: Kill guc_clients.ct_pool
1347:  1babf878f76a <    -:  ------------ INTEL_DII: drm/i915/guc: Kill ads.client_info
1348:  4ce305764206 <    -:  ------------ INTEL_DII: drm/i915/guc: Unified GuC log
1349:  1b3cc34570bc <    -:  ------------ INTEL_DII: drm/i915/guc: Update firmware to v61.1.1
1352:  eb7887da8ec4 ! 1350:  4269443e1706 INTEL_DII: drm/i915/dg1: Load guc and huc
1432:  9975e9fb606c <    -:  ------------ INTEL_DII: drm/i915/guc: Add stall timer to non blocking CTB send function
1449:  45b5613e1737 ! 1441:  09d184364b4a INTEL_DII/FIXME: drm/i915/guc: Ensure G2H response has space in buffer
1450:  ab9ca0f38350 ! 1442:  a68974b65b3a INTEL_DII: drm/i915/guc: Update intel_gt_wait_for_idle to work with GuC
1459:  588e3999d48c ! 1451:  bef9e0e273df INTEL_DII: drm/i915/guc: Reset implementation for new GuC interface
1462:  1fb73eb6d978 ! 1454:  4eb82c68702a INTEL_DII: drm/i915/guc: Suspend/resume implementation for new interface
   -:  ------------ > 1504:  0c2fd46e3a87 INTEL_DII/NOT_UPSTREAM: Fixup GuC submission to understand -EPIPE rather than -EIO
1529:  4e525961f407 ! 1522:  c806261a173e INTEL_DII/FIXME: drm/i915/guc: IOMMU catastrophic error notification handling
1539:  bb3b54126f02 ! 1532:  4029297ef7a7 INTEL_DII: drm/i915/guc: Selftest for GuC flow control
1545:  71145e92888f ! 1538:  bc9bfa3d64de INTEL_DII: drm/i915/guc/slpc: Add modparam and state checkers for slpc
1560:  bff746d9a2a1 ! 1553:  3f5f4ffa21ee INTEL_DII/NOT_UPSTREAM: drm/i915/guc: Dump error capture to dmesg on CTB error
1561:  1732ad9fc5c0 ! 1554:  b27a2bbdb71e INTEL_DII: drm/i915/huc: Update firmware to v7.9.3 for TGL+
1562:  2bfd376916b3 ! 1555:  7fb1d681417f INTEL_DII: drm/i915/guc: Update GuC to 63.0.0
1563:  5a4e17bce95d ! 1556:  856d2a500e69 INTEL_DII: drm/i915/guc: Add support for CTB RETRY message
1568:  4f58f7d759bb ! 1561:  df9dbf66b167 INTEL_DII: drm/i915/guc: Use new CTB config/control actions
1569:  af08ada798ff ! 1562:  0d12035062ef INTEL_DII: drm/i915/guc: Drop obsolete CTB registration ABI
1572:  7b5800a51e10 ! 1565:  2fba65604d90 INTEL_DII: drm/i915/guc: Add query of hwconfig tables
1582:  e9d17234504c ! 1575:  5c6f83a0c16c INTEL_DII: drm/i915/guc: Define CTB based TLB invalidation routines
1596:  e48ad21d948e ! 1589:  1404283fe06d INTEL_DII: drm/i915/pf: Allow controlling PF functionality
1631:  11baa1a37637 ! 1624:  561870d228d4 INTEL_DII: drm/i915/pf: Support for VFPF relay messages
1635:  a703d12db0ce ! 1628:  812b2e8fb5b2 INTEL_DII: drm/i915/pf: Support for MMIO relay messages
1637:  4db2c7732342 ! 1630:  a9eb52e8936b INTEL_DII: drm/i915/pf: Support GuC VF state notifications
1664:  203430a47a52 ! 1657:  a58bbc5596ae INTEL_DII: drm/i915/pf: Adverse events notifications
1668:  c1baa284f7a2 ! 1661:  ccf14ebd912c INTEL_DII: drm/i915/pf: Process VF memory CAT fault notification
1669:  681fcde303a6 ! 1662:  84ed7633ca5a INTEL_DII/NOT_UPSTREAM: drm/i915/guc: Allow to control GuC features
1862:  c89d9525a95b ! 1855:  2d1e6eb14558 INTEL_DII: drm/i915/vf: Ignore GuC CT event from memIRQ if CT is disabled
1925:  8e6cf7ddd6fc ! 1918:  66226bec7caa INTEL_DII/FIXME: drm/i915/gt: Fake interrupts for Wa:16014207253
1984:  e3d815e8594c ! 1977:  d0b15aea416b INTEL_DII: drm/i915/guc: Add function engine / disable GuC
2382:  df7657b25db2 ! 2375:  b244e3f7a66e INTEL_DII: drm/i915/mtl: Use primary GT's irq lock for media GT
2407:  6da2b94bf715 ! 2400:  032a876b710d INTEL_DII: drm/i915/guc: handle interrupts from media GuC
2579:  ba27a2290d49 ! 2572:  8f64d27abff9 INTEL_DII: drm/i915/sim: Adjust timeouts for presilicon environments

 series                                             |   61 +-
 ...c-Use-guc_class-instead-of-engine_class-i.patch |    8 +-
 ...rm-i915-uc-turn-on-GuC-HuC-auto-mode-by-d.patch |   28 -
 ...t-finish-INTEL_GEN-and-friends-conversion.patch |   15 +-
 ...NTEL_DII-drm-i915-gtt-map-the-PD-up-front.patch |   49 +-
 ...II-drm-i915-gtt-make-flushing-conditional.patch |   17 +-
 ...rm-i915-uc-Allow-platforms-to-have-GuC-bu.patch |   55 +-
 0001-INTEL_DII-drm-i915-dg1-Load-guc-and-huc.patch |   11 +-
 ...IXME-drm-i915-guc-Ensure-G2H-response-has.patch |   87 +-
 ...rm-i915-guc-Update-intel_gt_wait_for_idle.patch |    8 +-
 ...rm-i915-guc-Reset-implementation-for-new-.patch |    8 +-
 ...rm-i915-guc-Suspend-resume-implementation.patch |   34 +-
 ...IXME-drm-i915-guc-IOMMU-catastrophic-erro.patch |    6 +-
 ...rm-i915-guc-Selftest-for-GuC-flow-control.patch |   58 +-
 ...rm-i915-guc-slpc-Add-modparam-and-state-c.patch |   19 +-
 ...OT_UPSTREAM-drm-i915-guc-Dump-error-captu.patch |   53 +-
 ...rm-i915-huc-Update-firmware-to-v7.9.3-for.patch |    2 +-
 ...TEL_DII-drm-i915-guc-Update-GuC-to-63.0.0.patch |   28 +-
 ...rm-i915-guc-Add-support-for-CTB-RETRY-mes.patch |   14 +-
 ...rm-i915-guc-Use-new-CTB-config-control-ac.patch |   14 +-
 ...rm-i915-guc-Drop-obsolete-CTB-registratio.patch |   12 +-
 ...drm-i915-guc-Add-query-of-hwconfig-tables.patch |    8 +-
 ...rm-i915-guc-Define-CTB-based-TLB-invalida.patch |   18 +-
 ...rm-i915-pf-Allow-controlling-PF-functiona.patch |    4 +-
 ...rm-i915-pf-Support-for-VFPF-relay-message.patch |   10 +-
 ...rm-i915-pf-Support-for-MMIO-relay-message.patch |    6 +-
 ...rm-i915-pf-Support-GuC-VF-state-notificat.patch |    8 +-
 ...-drm-i915-pf-Adverse-events-notifications.patch |    8 +-
 ...rm-i915-pf-Process-VF-memory-CAT-fault-no.patch |    6 +-
 ...OT_UPSTREAM-drm-i915-guc-Allow-to-control.patch |    4 +-
 ...rm-i915-vf-Ignore-GuC-CT-event-from-memIR.patch |    2 +-
 ...IXME-drm-i915-gt-Fake-interrupts-for-Wa-1.patch |   54 +-
 ...rm-i915-guc-Add-function-engine-disable-G.patch |    8 +-
 ...rm-i915-mtl-Use-primary-GT-s-irq-lock-for.patch |   63 +-
 ...rm-i915-guc-handle-interrupts-from-media-.patch |  127 +-
 ...rm-i915-sim-Adjust-timeouts-for-presilico.patch |   35 +-
 ...15-guc-Remove-sample_forcewake-h2g-action.patch |   19 +-
 ...-i915-guc-Keep-strict-GuC-ABI-definitions.patch |   17 +-
 ...c-Stop-using-fence-status-from-CTB-descri.patch |   13 +-
 ...-drm-i915-Promote-ptrdiff-to-i915_utils.h.patch |   12 +-
 ...01-drm-i915-guc-Only-rely-on-own-CTB-size.patch |   10 +-
 ...-guc-Don-t-repeat-CTB-layout-calculations.patch |   50 +-
 ...c-Replace-CTB-array-with-explicit-members.patch |   17 +-
 ...-drm-i915-guc-Update-sizes-of-CTB-buffers.patch |   11 +-
 ...c-Start-protecting-access-to-CTB-descript.patch |   18 +-
 ...c-Stop-using-mutex-while-sending-CTB-mess.patch |   16 +-
 ...c-Don-t-receive-all-G2H-messages-in-irq-h.patch |   34 +-
 ...c-Always-copy-CT-message-to-new-allocatio.patch |   38 +-
 ...c-Early-initialization-of-GuC-send-regist.patch |   18 +-
 ...-Use-platform-specific-defaults-for-GuC-H.patch |   47 +
 ...m-i915-guc-Introduce-unified-HXG-messages.patch |   13 +-
 ...rm-i915-doc-Include-GuC-ABI-documentation.patch |   13 +-
 ...c-Improve-error-message-for-unsolicited-C.patch |   12 +-
 ...drm-i915-guc-Increase-size-of-CTB-buffers.patch |   24 +-
 ...15-guc-Add-non-blocking-CTB-send-function.patch |  221 ++-
 ...rm-i915-guc-Optimize-CTB-writes-and-reads.patch |  175 +--
 ...c-Module-load-failure-test-for-CT-buffer-.patch |   18 +-
 ...-drm-i915-guc-Drop-guc-interrupts.enabled.patch |   96 ++
 ...c-Ensure-H2G-buffer-updates-visible-befor.patch |   79 +
 0001-drm-i915-guc-Update-firmware-to-v62.0.0.patch | 1510 ++++++++++++++++++++
 0001-drm-i915-guc-Relax-CTB-response-timeout.patch |   54 +
 ...c-Add-stall-timer-to-non-blocking-CTB-sen.patch |  184 +++
 ...OT_UPSTREAM-Fixup-GuC-submission-to-under.patch |   55 +
 ...I-drm-i915-guc-Relax-CTB-response-timeout.patch |   45 -
 ...rm-i915-guc-Update-MMIO-based-communicati.patch |  239 ----
 ...rm-i915-guc-Update-CTB-response-status-de.patch |  108 --
 ...rm-i915-guc-Support-per-context-schedulin.patch |  104 --
 ...drm-i915-guc-Add-flag-for-mark-broken-CTB.patch |   94 --
 ...rm-i915-guc-New-definition-of-the-CTB-des.patch |  271 ----
 ...rm-i915-guc-New-definition-of-the-CTB-reg.patch |  305 ----
 ...-drm-i915-guc-New-CTB-based-communication.patch |  395 -----
 ...DII-drm-i915-guc-Kill-guc_clients.ct_pool.patch |   90 --
 ...TEL_DII-drm-i915-guc-Kill-ads.client_info.patch |   76 -
 0001-INTEL_DII-drm-i915-guc-Unified-GuC-log.patch  |  167 ---
 ...I-drm-i915-guc-Update-firmware-to-v61.1.1.patch |   62 -
 ...rm-i915-guc-Add-stall-timer-to-non-blocki.patch |  142 --
 76 files changed, 2926 insertions(+), 2894 deletions(-)

diff --git a/series b/series
index a290bd73f3b8..251e7f188672 100644
--- a/series
+++ b/series
@@ -358,7 +358,22 @@
 0001-drm-i915-guc-skip-disabling-CTBs-before-sanitizing-t.patch
 0001-drm-i915-guc-use-probe_error-log-for-CT-enablement-f.patch
 0001-drm-i915-guc-enable-only-the-user-interrupt-when-usi.patch
+0001-drm-i915-guc-Remove-sample_forcewake-h2g-action.patch
+0001-drm-i915-guc-Keep-strict-GuC-ABI-definitions.patch
+0001-drm-i915-guc-Drop-guc-interrupts.enabled.patch
+0001-drm-i915-guc-Stop-using-fence-status-from-CTB-descri.patch
+0001-drm-i915-Promote-ptrdiff-to-i915_utils.h.patch
+0001-drm-i915-guc-Only-rely-on-own-CTB-size.patch
+0001-drm-i915-guc-Don-t-repeat-CTB-layout-calculations.patch
 0001-drm-i915-Initialize-the-mbus_offset-to-fix-Klockwork.patch
+0001-drm-i915-guc-Replace-CTB-array-with-explicit-members.patch
+0001-drm-i915-guc-Update-sizes-of-CTB-buffers.patch
+0001-drm-i915-guc-Start-protecting-access-to-CTB-descript.patch
+0001-drm-i915-guc-Ensure-H2G-buffer-updates-visible-befor.patch
+0001-drm-i915-guc-Stop-using-mutex-while-sending-CTB-mess.patch
+0001-drm-i915-guc-Don-t-receive-all-G2H-messages-in-irq-h.patch
+0001-drm-i915-guc-Always-copy-CT-message-to-new-allocatio.patch
+0001-drm-i915-guc-Early-initialization-of-GuC-send-regist.patch
 0001-drm-i915-guc-Use-guc_class-instead-of-engine_class-i.patch
 0001-drm-i915-gvt-replace-IS_GEN-and-friends-with-GRAPHIC.patch
 0001-drm-i915-display-replace-IS_GEN-in-commented-code.patch
@@ -376,6 +391,7 @@
 0001-drm-i915-dsc-Fix-bigjoiner-check-in-dsc_disable.patch
 0001-drm-i915-adl_p-CDCLK-crawl-support-for-ADL.patch
 0001-drm-i915-adl_p-Same-slices-mask-is-not-same-Dbuf-sta.patch
+0001-drm-i915-uc-Use-platform-specific-defaults-for-GuC-H.patch
 0001-Revert-drm-i915-display-Drop-FIXME-about-turn-off-in.patch
 0001-drm-i915-xelpd-break-feature-inheritance.patch
 0001-drm-i915-adl_p-Add-initial-ADL_P-Workarounds.patch
@@ -388,6 +404,9 @@
 0001-drm-i915-extract-steered-reg-access-to-common-functi.patch
 0001-drm-i915-Add-GT-support-for-multiple-types-of-multic.patch
 0001-drm-i915-Add-support-for-explicit-L3BANK-steering.patch
+0001-drm-i915-guc-Introduce-unified-HXG-messages.patch
+0001-drm-i915-guc-Update-firmware-to-v62.0.0.patch
+0001-drm-i915-doc-Include-GuC-ABI-documentation.patch
 0001-drm-i915-display-Do-not-zero-past-infoframes.vsc.patch
 0001-drm-i915-dmc-Introduce-DMC_FW_MAIN.patch
 0001-drm-i915-xelpd-Pipe-A-DMC-plugging.patch
@@ -460,6 +479,13 @@
 0001-drm-i915-display-Settle-on-adl-x-in-WA-comments.patch
 0001-drm-i915-Limit-Wa_22010178259-to-affected-platforms.patch
 0001-drm-i915-display-xelpd-Extend-Wa_14011508470.patch
+0001-drm-i915-guc-Relax-CTB-response-timeout.patch
+0001-drm-i915-guc-Improve-error-message-for-unsolicited-C.patch
+0001-drm-i915-guc-Increase-size-of-CTB-buffers.patch
+0001-drm-i915-guc-Add-non-blocking-CTB-send-function.patch
+0001-drm-i915-guc-Add-stall-timer-to-non-blocking-CTB-sen.patch
+0001-drm-i915-guc-Optimize-CTB-writes-and-reads.patch
+0001-drm-i915-guc-Module-load-failure-test-for-CT-buffer-.patch
 0001-drm-i915-debugfs-DISPLAY_VER-13-lpsp-capability.patch
 0001-drm-i915-step-s-platform-_revid_tbl-platform-_revids.patch
 0001-drm-i915-Make-pre-production-detection-use-direct-re.patch
@@ -1323,34 +1349,6 @@
 0001-INTEL_DII-END-dg1-pending-features-hacks.patch
 0001-INTEL_DII-START-guc-GuC-features.patch
 0001-INTEL_DII-drm-i915-uc-Allow-platforms-to-have-GuC-bu.patch
-0001-INTEL_DII-drm-i915-guc-Remove-sample_forcewake-h2g-a.patch
-0001-INTEL_DII-drm-i915-guc-Keep-strict-GuC-ABI-definitio.patch
-0001-INTEL_DII-drm-i915-guc-Stop-using-fence-status-from-.patch
-0001-INTEL_DII-drm-i915-Promote-ptrdiff-to-i915_utils.h.patch
-0001-INTEL_DII-drm-i915-guc-Only-rely-on-own-CTB-size.patch
-0001-INTEL_DII-drm-i915-guc-Don-t-repeat-CTB-layout-calcu.patch
-0001-INTEL_DII-drm-i915-guc-Replace-CTB-array-with-explic.patch
-0001-INTEL_DII-drm-i915-guc-Update-sizes-of-CTB-buffers.patch
-0001-INTEL_DII-drm-i915-guc-Relax-CTB-response-timeout.patch
-0001-INTEL_DII-drm-i915-guc-Start-protecting-access-to-CT.patch
-0001-INTEL_DII-drm-i915-guc-Stop-using-mutex-while-sendin.patch
-0001-INTEL_DII-drm-i915-guc-Don-t-receive-all-G2H-message.patch
-0001-INTEL_DII-drm-i915-guc-Always-copy-CT-message-to-new.patch
-0001-INTEL_DII-drm-i915-guc-Introduce-unified-HXG-message.patch
-0001-INTEL_DII-drm-i915-guc-Update-MMIO-based-communicati.patch
-0001-INTEL_DII-drm-i915-guc-Update-CTB-response-status-de.patch
-0001-INTEL_DII-drm-i915-guc-Support-per-context-schedulin.patch
-0001-INTEL_DII-drm-i915-guc-Add-flag-for-mark-broken-CTB.patch
-0001-INTEL_DII-drm-i915-guc-New-definition-of-the-CTB-des.patch
-0001-INTEL_DII-drm-i915-guc-New-definition-of-the-CTB-reg.patch
-0001-INTEL_DII-drm-i915-guc-New-CTB-based-communication.patch
-0001-INTEL_DII-drm-i915-doc-Include-GuC-ABI-documentation.patch
-0001-INTEL_DII-drm-i915-guc-Kill-guc_clients.ct_pool.patch
-0001-INTEL_DII-drm-i915-guc-Kill-ads.client_info.patch
-0001-INTEL_DII-drm-i915-guc-Unified-GuC-log.patch
-0001-INTEL_DII-drm-i915-guc-Update-firmware-to-v61.1.1.patch
-0001-INTEL_DII-drm-i915-uc-turn-on-GuC-HuC-auto-mode-by-d.patch
-0001-INTEL_DII-drm-i915-guc-Early-initialization-of-GuC-s.patch
 0001-INTEL_DII-drm-i915-dg1-Load-guc-and-huc.patch
 0001-INTEL_DII-drm-i915-guc-Request-RP0-before-loading-fi.patch
 0001-INTEL_DII-drm-i915-huc-Use-i915_probe_error-to-repor.patch
@@ -1429,12 +1427,6 @@
 0001-INTEL_DII-START-GuC-submission-support.patch
 0001-INTEL_DII-drm-i915-Introduce-i915_sched_engine-objec.patch
 0001-INTEL_DII-FIXME-drm-i915-Engine-relative-MMIO.patch
-0001-INTEL_DII-drm-i915-guc-Improve-error-message-for-uns.patch
-0001-INTEL_DII-drm-i915-guc-Add-non-blocking-CTB-send-fun.patch
-0001-INTEL_DII-drm-i915-guc-Add-stall-timer-to-non-blocki.patch
-0001-INTEL_DII-drm-i915-guc-Optimize-CTB-writes-and-reads.patch
-0001-INTEL_DII-drm-i915-guc-Increase-size-of-CTB-buffers.patch
-0001-INTEL_DII-drm-i915-guc-Module-load-failure-test-for-.patch
 0001-INTEL_DII-FIXME-drm-i915-guc-Add-new-GuC-interface-d.patch
 0001-INTEL_DII-drm-i915-guc-Remove-GuC-stage-descriptor-a.patch
 0001-INTEL_DII-FIXME-drm-i915-guc-Add-lrc-descriptor-cont.patch
@@ -1511,6 +1503,7 @@
 0001-INTEL_DII-drm-i915-Move-certain-functions-from-engin.patch
 0001-INTEL_DII-UAPI-NEEDSIGT-drm-i915-guc-Implement-BB-bo.patch
 0001-INTEL_DII-FIXME-Workaround-atomic-issue-preempt-boun.patch
+0001-INTEL_DII-NOT_UPSTREAM-Fixup-GuC-submission-to-under.patch
 0001-INTEL_DII-i915-drm-Move-secure-execbuf-check-to-exec.patch
 0001-INTEL_DII-drm-i915-Move-input-exec-fence-handling-to.patch
 0001-INTEL_DII-drm-i915-Move-output-fence-handling-to-i91.patch
diff --git a/0001-drm-i915-guc-Use-guc_class-instead-of-engine_class-i.patch b/0001-drm-i915-guc-Use-guc_class-instead-of-engine_class-i.patch
index f059c1cdc001..7a7ee2c65fde 100644
--- a/0001-drm-i915-guc-Use-guc_class-instead-of-engine_class-i.patch
+++ b/0001-drm-i915-guc-Use-guc_class-instead-of-engine_class-i.patch
@@ -119,9 +119,9 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/
  #include <linux/types.h>
 +#include "gt/intel_engine_types.h"
  
- #define GUC_CLIENT_PRIORITY_KMD_HIGH	0
- #define GUC_CLIENT_PRIORITY_HIGH	1
-@@ -26,6 +27,12 @@
+ #include "abi/guc_actions_abi.h"
+ #include "abi/guc_errors_abi.h"
+@@ -32,6 +33,12 @@
  #define GUC_VIDEO_ENGINE2		4
  #define GUC_MAX_ENGINES_NUM		(GUC_VIDEO_ENGINE2 + 1)
  
@@ -134,7 +134,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/
  #define GUC_MAX_ENGINE_CLASSES		16
  #define GUC_MAX_INSTANCES_PER_CLASS	32
  
-@@ -123,6 +130,25 @@
+@@ -129,6 +136,25 @@
  #define GUC_ID_TO_ENGINE_INSTANCE(guc_id) \
  	(((guc_id) & GUC_ENGINE_INSTANCE_MASK) >> GUC_ENGINE_INSTANCE_SHIFT)
  
diff --git a/0001-INTEL_DII-drm-i915-uc-turn-on-GuC-HuC-auto-mode-by-d.patch b/0001-INTEL_DII-drm-i915-uc-turn-on-GuC-HuC-auto-mode-by-d.patch
deleted file mode 100644
index 80c7e76a65f3..000000000000
--- a/0001-INTEL_DII-drm-i915-uc-turn-on-GuC-HuC-auto-mode-by-d.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
-Date: Fri, 28 Feb 2020 14:03:06 -0800
-Subject: [PATCH] INTEL_DII: drm/i915/uc: turn on GuC/HuC auto mode by default
-
-This will enable HuC loading for Gen11+ by default if the binaries
-are available on the system. GuC submission still requires explicit
-enabling by the user.
-
-Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
-Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
----
- drivers/gpu/drm/i915/i915_params.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
---- a/drivers/gpu/drm/i915/i915_params.h
-+++ b/drivers/gpu/drm/i915/i915_params.h
-@@ -59,7 +59,7 @@ struct drm_printer;
- 	param(int, disable_power_well, -1, 0400) \
- 	param(int, enable_ips, 1, 0600) \
- 	param(int, invert_brightness, 0, 0600) \
--	param(int, enable_guc, 0, 0400) \
-+	param(int, enable_guc, -1, 0400) \
- 	param(int, guc_log_level, -1, 0400) \
- 	param(char *, guc_firmware_path, NULL, 0400) \
- 	param(char *, huc_firmware_path, NULL, 0400) \
diff --git a/0001-drm-i915-gt-finish-INTEL_GEN-and-friends-conversion.patch b/0001-drm-i915-gt-finish-INTEL_GEN-and-friends-conversion.patch
index 4dde28419129..aa524a37d846 100644
--- a/0001-drm-i915-gt-finish-INTEL_GEN-and-friends-conversion.patch
+++ b/0001-drm-i915-gt-finish-INTEL_GEN-and-friends-conversion.patch
@@ -19,8 +19,7 @@ show up and need to be fixed up ]
 Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
 ---
  drivers/gpu/drm/i915/gt/intel_ring_submission.c | 2 +-
- drivers/gpu/drm/i915/gt/uc/intel_guc.c          | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
 --- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
@@ -34,15 +33,3 @@ diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i
  		err = gen7_ctx_switch_bb_init(engine);
  		if (err)
  			goto err_ring_unpin;
-diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
---- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
-+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
-@@ -60,7 +60,7 @@ void intel_guc_init_send_regs(struct intel_guc *guc)
- 	enum forcewake_domains fw_domains = 0;
- 	unsigned int i;
- 
--	if (INTEL_GEN(gt->i915) >= 11) {
-+	if (GRAPHICS_VER(gt->i915) >= 11) {
- 		guc->send_regs.base =
- 				i915_mmio_reg_offset(GEN11_SOFT_SCRATCH(0));
- 		guc->send_regs.count = GEN11_SOFT_SCRATCH_COUNT;
diff --git a/0001-INTEL_DII-drm-i915-gtt-map-the-PD-up-front.patch b/0001-INTEL_DII-drm-i915-gtt-map-the-PD-up-front.patch
index 6efa36ff05aa..f225845cf25b 100644
--- a/0001-INTEL_DII-drm-i915-gtt-map-the-PD-up-front.patch
+++ b/0001-INTEL_DII-drm-i915-gtt-map-the-PD-up-front.patch
@@ -17,15 +17,15 @@ Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
 ---
  .../drm/i915/gem/selftests/i915_gem_context.c | 11 +----
  drivers/gpu/drm/i915/gt/gen6_ppgtt.c          | 11 ++---
- drivers/gpu/drm/i915/gt/gen8_ppgtt.c          | 26 ++++------
+ drivers/gpu/drm/i915/gt/gen8_ppgtt.c          | 26 +++++-------
  drivers/gpu/drm/i915/gt/intel_ggtt.c          |  2 +-
- drivers/gpu/drm/i915/gt/intel_gtt.c           | 48 +++++++++----------
- drivers/gpu/drm/i915/gt/intel_gtt.h           | 11 +++--
- drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  7 ++-
+ drivers/gpu/drm/i915/gt/intel_gtt.c           | 40 +++++++------------
+ drivers/gpu/drm/i915/gt/intel_gtt.h           |  8 ++--
+ drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  7 ++--
  drivers/gpu/drm/i915/i915_vma.c               |  3 +-
- drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 10 ++--
+ drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 10 ++---
  drivers/gpu/drm/i915/selftests/i915_perf.c    |  3 +-
- 10 files changed, 54 insertions(+), 78 deletions(-)
+ 10 files changed, 43 insertions(+), 78 deletions(-)
 
 diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
 --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
@@ -284,22 +284,7 @@ diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel
  
  	i915_gem_object_make_unshrinkable(obj);
  	return 0;
-@@ -170,6 +168,14 @@ void clear_pages(struct i915_vma *vma)
- 	memset(&vma->page_sizes, 0, sizeof(vma->page_sizes));
- }
- 
-+void *__px_vaddr(struct drm_i915_gem_object *p)
-+{
-+	enum i915_map_type type;
-+
-+	GEM_BUG_ON(!i915_gem_object_has_pages(p));
-+	return page_unpack_bits(p->mm.mapping, &type);
-+}
-+
- dma_addr_t __px_dma(struct drm_i915_gem_object *p)
- {
- 	GEM_BUG_ON(!i915_gem_object_has_pages(p));
-@@ -185,19 +191,15 @@ struct page *__px_page(struct drm_i915_gem_object *p)
+@@ -193,19 +191,15 @@ struct page *__px_page(struct drm_i915_gem_object *p)
  void
  fill_page_dma(struct drm_i915_gem_object *p, const u64 val, unsigned int count)
  {
@@ -321,7 +306,7 @@ diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel
  	u32 val;
  
  	val = 0;
-@@ -216,13 +218,7 @@ static u32 poison_scratch_page(struct drm_i915_gem_object *scratch)
+@@ -224,13 +218,7 @@ static u32 poison_scratch_page(struct drm_i915_gem_object *scratch)
  		val |= (u32)POISON_FREE << 24;
  	}
  
@@ -336,7 +321,7 @@ diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel
  
  	return val;
  }
-@@ -254,7 +250,7 @@ int setup_scratch_page(struct i915_address_space *vm)
+@@ -262,7 +250,7 @@ int setup_scratch_page(struct i915_address_space *vm)
  		if (IS_ERR(obj))
  			goto skip;
  
@@ -348,17 +333,7 @@ diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel
 diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
 --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
 +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
-@@ -191,6 +191,9 @@ struct page *__px_page(struct drm_i915_gem_object *p);
- dma_addr_t __px_dma(struct drm_i915_gem_object *p);
- #define px_dma(px) (__px_dma(px_base(px)))
- 
-+void *__px_vaddr(struct drm_i915_gem_object *p);
-+#define px_vaddr(px) (__px_vaddr(px_base(px)))
-+
- #define px_pt(px) \
- 	__px_choose_expr(px, struct i915_page_table *, __x, \
- 	__px_choose_expr(px, struct i915_page_directory *, &__x->pt, \
-@@ -527,8 +530,6 @@ struct i915_ppgtt *i915_ppgtt_create(struct intel_gt *gt);
+@@ -530,8 +530,6 @@ struct i915_ppgtt *i915_ppgtt_create(struct intel_gt *gt);
  void i915_ggtt_suspend(struct i915_ggtt *gtt);
  void i915_ggtt_resume(struct i915_ggtt *ggtt);
  
@@ -367,7 +342,7 @@ diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel
  void
  fill_page_dma(struct drm_i915_gem_object *p, const u64 val, unsigned int count);
  
-@@ -546,8 +547,8 @@ struct i915_page_table *alloc_pt(struct i915_address_space *vm);
+@@ -549,8 +547,8 @@ struct i915_page_table *alloc_pt(struct i915_address_space *vm);
  struct i915_page_directory *alloc_pd(struct i915_address_space *vm);
  struct i915_page_directory *__alloc_pd(int npde);
  
@@ -378,7 +353,7 @@ diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel
  
  void free_px(struct i915_address_space *vm,
  	     struct i915_page_table *pt, int lvl);
-@@ -594,7 +595,7 @@ void setup_private_pat(struct intel_uncore *uncore);
+@@ -597,7 +595,7 @@ void setup_private_pat(struct intel_uncore *uncore);
  int i915_vm_alloc_pt_stash(struct i915_address_space *vm,
  			   struct i915_vm_pt_stash *stash,
  			   u64 size);
diff --git a/0001-INTEL_DII-drm-i915-gtt-make-flushing-conditional.patch b/0001-INTEL_DII-drm-i915-gtt-make-flushing-conditional.patch
index 8a13a71002cf..63c12a744ebc 100644
--- a/0001-INTEL_DII-drm-i915-gtt-make-flushing-conditional.patch
+++ b/0001-INTEL_DII-drm-i915-gtt-make-flushing-conditional.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] INTEL_DII: drm/i915/gtt: make flushing conditional
 Now that PDs can also be mapped as WC, we can forgo all the flushing for
 such mappings.
 
+v2: Update intel_guc_ct.c to use __px_vaddr new arg (Matthew Brost)
+
 Signed-off-by: Matthew Auld <matthew.auld@intel.com>
 ---
  .../drm/i915/gem/selftests/i915_gem_context.c |  2 +-
@@ -14,8 +16,9 @@ Signed-off-by: Matthew Auld <matthew.auld@intel.com>
  drivers/gpu/drm/i915/gt/intel_gtt.c           | 20 ++++++++---
  drivers/gpu/drm/i915/gt/intel_gtt.h           |  4 +--
  drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  6 ++--
+ drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  2 +-
  drivers/gpu/drm/i915/selftests/i915_perf.c    |  2 +-
- 7 files changed, 47 insertions(+), 26 deletions(-)
+ 8 files changed, 48 insertions(+), 27 deletions(-)
 
 diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
 --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
@@ -246,6 +249,18 @@ diff --git a/drivers/gpu/drm/i915/gt/intel_ppgtt.c b/drivers/gpu/drm/i915/gt/int
  }
  
  void
+diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
++++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+@@ -304,7 +304,7 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
+ 	base = intel_guc_ggtt_offset(guc, ct->vma);
+ 
+ 	/* blob should start with send descriptor */
+-	blob = __px_vaddr(ct->vma->obj);
++	blob = __px_vaddr(ct->vma->obj, NULL);
+ 	GEM_BUG_ON(blob != ct->ctbs.send.desc);
+ 
+ 	/* (re)initialize descriptors */
 diff --git a/drivers/gpu/drm/i915/selftests/i915_perf.c b/drivers/gpu/drm/i915/selftests/i915_perf.c
 --- a/drivers/gpu/drm/i915/selftests/i915_perf.c
 +++ b/drivers/gpu/drm/i915/selftests/i915_perf.c
diff --git a/0001-INTEL_DII-drm-i915-uc-Allow-platforms-to-have-GuC-bu.patch b/0001-INTEL_DII-drm-i915-uc-Allow-platforms-to-have-GuC-bu.patch
index f3b7c5362572..3d6b115f3d9e 100644
--- a/0001-INTEL_DII-drm-i915-uc-Allow-platforms-to-have-GuC-bu.patch
+++ b/0001-INTEL_DII-drm-i915-uc-Allow-platforms-to-have-GuC-bu.patch
@@ -8,6 +8,9 @@ It is possible for platforms to require GuC but not HuC firmware.
 Also, the firmware versions for GuC and HuC advance independently. So
 split the macros up to allow the lists to be maintained separately.
 
+v2:
+ - Baseline version on 62.0.0
+
 Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
 Reviewed-by: Matthew Brost <matthew.brost@intel.com>
 ---
@@ -22,33 +25,33 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/
   * firmware as TGL.
   */
 -#define INTEL_UC_FIRMWARE_DEFS(fw_def, guc_def, huc_def) \
--	fw_def(ALDERLAKE_S, 0, guc_def(tgl, 49, 0, 1), huc_def(tgl,  7, 5, 0)) \
--	fw_def(ROCKETLAKE,  0, guc_def(tgl, 49, 0, 1), huc_def(tgl,  7, 5, 0)) \
--	fw_def(TIGERLAKE,   0, guc_def(tgl, 49, 0, 1), huc_def(tgl,  7, 5, 0)) \
--	fw_def(JASPERLAKE,  0, guc_def(ehl, 49, 0, 1), huc_def(ehl,  9, 0, 0)) \
--	fw_def(ELKHARTLAKE, 0, guc_def(ehl, 49, 0, 1), huc_def(ehl,  9, 0, 0)) \
--	fw_def(ICELAKE,     0, guc_def(icl, 49, 0, 1), huc_def(icl,  9, 0, 0)) \
--	fw_def(COMETLAKE,   5, guc_def(cml, 49, 0, 1), huc_def(cml,  4, 0, 0)) \
--	fw_def(COMETLAKE,   0, guc_def(kbl, 49, 0, 1), huc_def(kbl,  4, 0, 0)) \
--	fw_def(COFFEELAKE,  0, guc_def(kbl, 49, 0, 1), huc_def(kbl,  4, 0, 0)) \
--	fw_def(GEMINILAKE,  0, guc_def(glk, 49, 0, 1), huc_def(glk,  4, 0, 0)) \
--	fw_def(KABYLAKE,    0, guc_def(kbl, 49, 0, 1), huc_def(kbl,  4, 0, 0)) \
--	fw_def(BROXTON,     0, guc_def(bxt, 49, 0, 1), huc_def(bxt,  2, 0, 0)) \
--	fw_def(SKYLAKE,     0, guc_def(skl, 49, 0, 1), huc_def(skl,  2, 0, 0))
+-	fw_def(ALDERLAKE_S, 0, guc_def(tgl, 62, 0, 0), huc_def(tgl,  7, 5, 0)) \
+-	fw_def(ROCKETLAKE,  0, guc_def(tgl, 62, 0, 0), huc_def(tgl,  7, 5, 0)) \
+-	fw_def(TIGERLAKE,   0, guc_def(tgl, 62, 0, 0), huc_def(tgl,  7, 5, 0)) \
+-	fw_def(JASPERLAKE,  0, guc_def(ehl, 62, 0, 0), huc_def(ehl,  9, 0, 0)) \
+-	fw_def(ELKHARTLAKE, 0, guc_def(ehl, 62, 0, 0), huc_def(ehl,  9, 0, 0)) \
+-	fw_def(ICELAKE,     0, guc_def(icl, 62, 0, 0), huc_def(icl,  9, 0, 0)) \
+-	fw_def(COMETLAKE,   5, guc_def(cml, 62, 0, 0), huc_def(cml,  4, 0, 0)) \
+-	fw_def(COMETLAKE,   0, guc_def(kbl, 62, 0, 0), huc_def(kbl,  4, 0, 0)) \
+-	fw_def(COFFEELAKE,  0, guc_def(kbl, 62, 0, 0), huc_def(kbl,  4, 0, 0)) \
+-	fw_def(GEMINILAKE,  0, guc_def(glk, 62, 0, 0), huc_def(glk,  4, 0, 0)) \
+-	fw_def(KABYLAKE,    0, guc_def(kbl, 62, 0, 0), huc_def(kbl,  4, 0, 0)) \
+-	fw_def(BROXTON,     0, guc_def(bxt, 62, 0, 0), huc_def(bxt,  2, 0, 0)) \
+-	fw_def(SKYLAKE,     0, guc_def(skl, 62, 0, 0), huc_def(skl,  2, 0, 0))
 +#define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_def) \
-+	fw_def(ALDERLAKE_S,  0, guc_def(tgl,  49, 0, 1)) \
-+	fw_def(ROCKETLAKE,   0, guc_def(tgl,  49, 0, 1)) \
-+	fw_def(TIGERLAKE,    0, guc_def(tgl,  49, 0, 1)) \
-+	fw_def(JASPERLAKE,   0, guc_def(ehl,  49, 0, 1)) \
-+	fw_def(ELKHARTLAKE,  0, guc_def(ehl,  49, 0, 1)) \
-+	fw_def(ICELAKE,      0, guc_def(icl,  49, 0, 1)) \
-+	fw_def(COMETLAKE,    5, guc_def(cml,  49, 0, 1)) \
-+	fw_def(COMETLAKE,    0, guc_def(kbl,  49, 0, 1)) \
-+	fw_def(COFFEELAKE,   0, guc_def(kbl,  49, 0, 1)) \
-+	fw_def(GEMINILAKE,   0, guc_def(glk,  49, 0, 1)) \
-+	fw_def(KABYLAKE,     0, guc_def(kbl,  49, 0, 1)) \
-+	fw_def(BROXTON,      0, guc_def(bxt,  49, 0, 1)) \
-+	fw_def(SKYLAKE,      0, guc_def(skl,  49, 0, 1))
++	fw_def(ALDERLAKE_S,  0, guc_def(tgl,  62, 0, 0)) \
++	fw_def(ROCKETLAKE,   0, guc_def(tgl,  62, 0, 0)) \
++	fw_def(TIGERLAKE,    0, guc_def(tgl,  62, 0, 0)) \
++	fw_def(JASPERLAKE,   0, guc_def(ehl,  62, 0, 0)) \
++	fw_def(ELKHARTLAKE,  0, guc_def(ehl,  62, 0, 0)) \
++	fw_def(ICELAKE,      0, guc_def(icl,  62, 0, 0)) \
++	fw_def(COMETLAKE,    5, guc_def(cml,  62, 0, 0)) \
++	fw_def(COMETLAKE,    0, guc_def(kbl,  62, 0, 0)) \
++	fw_def(COFFEELAKE,   0, guc_def(kbl,  62, 0, 0)) \
++	fw_def(GEMINILAKE,   0, guc_def(glk,  62, 0, 0)) \
++	fw_def(KABYLAKE,     0, guc_def(kbl,  62, 0, 0)) \
++	fw_def(BROXTON,      0, guc_def(bxt,  62, 0, 0)) \
++	fw_def(SKYLAKE,      0, guc_def(skl,  62, 0, 0))
 +
 +#define INTEL_HUC_FIRMWARE_DEFS(fw_def, huc_def) \
 +	fw_def(ALDERLAKE_S,  0, huc_def(tgl,  7, 5, 0)) \
diff --git a/0001-INTEL_DII-drm-i915-dg1-Load-guc-and-huc.patch b/0001-INTEL_DII-drm-i915-dg1-Load-guc-and-huc.patch
index c5344eceb49b..315ad6229610 100644
--- a/0001-INTEL_DII-drm-i915-dg1-Load-guc-and-huc.patch
+++ b/0001-INTEL_DII-drm-i915-dg1-Load-guc-and-huc.patch
@@ -40,6 +40,7 @@ v33: 61.0.0 (michal)
 v34: Resolve minor conflict with adls upstream rebase.(aswarup)
 v35: Updated to GuC v61.1.1 (JohnH).
 v36: Split GuC/HuC definition entries (JohnH).
+v37: 62.0.0 (Matthew Brost)
 
 Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
 Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
@@ -56,11 +57,11 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/
 @@ -50,6 +50,7 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
   */
  #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_def) \
- 	fw_def(ALDERLAKE_S,  0, guc_def(tgl,  61, 1, 1)) \
-+	fw_def(DG1,          0, guc_def(dg1,  61, 1, 1)) \
- 	fw_def(ROCKETLAKE,   0, guc_def(tgl,  61, 1, 1)) \
- 	fw_def(TIGERLAKE,    0, guc_def(tgl,  61, 1, 1)) \
- 	fw_def(JASPERLAKE,   0, guc_def(ehl,  61, 1, 1)) \
+ 	fw_def(ALDERLAKE_S,  0, guc_def(tgl,  62, 0, 0)) \
++	fw_def(DG1,          0, guc_def(dg1,  62, 0, 0)) \
+ 	fw_def(ROCKETLAKE,   0, guc_def(tgl,  62, 0, 0)) \
+ 	fw_def(TIGERLAKE,    0, guc_def(tgl,  62, 0, 0)) \
+ 	fw_def(JASPERLAKE,   0, guc_def(ehl,  62, 0, 0)) \
 @@ -65,6 +66,7 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
  
  #define INTEL_HUC_FIRMWARE_DEFS(fw_def, huc_def) \
diff --git a/0001-INTEL_DII-FIXME-drm-i915-guc-Ensure-G2H-response-has.patch b/0001-INTEL_DII-FIXME-drm-i915-guc-Ensure-G2H-response-has.patch
index be38703a05be..191fef30fe6c 100644
--- a/0001-INTEL_DII-FIXME-drm-i915-guc-Ensure-G2H-response-has.patch
+++ b/0001-INTEL_DII-FIXME-drm-i915-guc-Ensure-G2H-response-has.patch
@@ -39,37 +39,31 @@ v18: Increase size of G2H responses by 1 DW (Matthew Brost)
 Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
 Signed-off-by: Matthew Brost <matthew.brost@intel.com>
 ---
- drivers/gpu/drm/i915/gt/uc/intel_guc.h        | 13 +++-
- drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 72 +++++++++++++++----
- drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |  4 +-
+ drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  8 +-
+ drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 74 +++++++++++++++----
+ drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     | 13 +++-
  drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  3 +
  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 13 ++--
- 5 files changed, 82 insertions(+), 23 deletions(-)
+ 5 files changed, 86 insertions(+), 25 deletions(-)
 
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
-@@ -96,11 +96,17 @@ inline int intel_guc_send(struct intel_guc *guc, const u32 *action, u32 len)
+@@ -95,10 +95,11 @@ inline int intel_guc_send(struct intel_guc *guc, const u32 *action, u32 len)
  }
  
- #define INTEL_GUC_SEND_NB		BIT(31)
-+#define INTEL_GUC_SEND_G2H_DW_SHIFT	0
-+#define INTEL_GUC_SEND_G2H_DW_MASK	(0xff << INTEL_GUC_SEND_G2H_DW_SHIFT)
-+#define MAKE_SEND_FLAGS(len) \
-+	({GEM_BUG_ON(!FIELD_FIT(INTEL_GUC_SEND_G2H_DW_MASK, len)); \
-+	(FIELD_PREP(INTEL_GUC_SEND_G2H_DW_MASK, len) | INTEL_GUC_SEND_NB);})
  static
 -inline int intel_guc_send_nb(struct intel_guc *guc, const u32 *action, u32 len)
 +inline int intel_guc_send_nb(struct intel_guc *guc, const u32 *action, u32 len,
 +			     u32 g2h_len_dw)
  {
  	return intel_guc_ct_send(&guc->ct, action, len, NULL, 0,
--				 INTEL_GUC_SEND_NB);
+-				 INTEL_GUC_CT_SEND_NB);
 +				 MAKE_SEND_FLAGS(g2h_len_dw));
  }
  
  static inline int
-@@ -114,6 +120,7 @@ intel_guc_send_and_receive(struct intel_guc *guc, const u32 *action, u32 len,
+@@ -112,6 +113,7 @@ intel_guc_send_and_receive(struct intel_guc *guc, const u32 *action, u32 len,
  static inline int intel_guc_send_busy_loop(struct intel_guc* guc,
  					   const u32 *action,
  					   u32 len,
@@ -77,7 +71,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc
  					   bool loop)
  {
  	int err;
-@@ -122,7 +129,7 @@ static inline int intel_guc_send_busy_loop(struct intel_guc* guc,
+@@ -120,7 +122,7 @@ static inline int intel_guc_send_busy_loop(struct intel_guc* guc,
  	might_sleep_if(loop && (!in_atomic() && !irqs_disabled()));
  
  retry:
@@ -89,15 +83,15 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
-@@ -73,6 +73,7 @@ static inline struct drm_device *ct_to_drm(struct intel_guc_ct *ct)
+@@ -74,6 +74,7 @@ static inline struct drm_device *ct_to_drm(struct intel_guc_ct *ct)
  #define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
  #define CTB_H2G_BUFFER_SIZE	(SZ_4K)
  #define CTB_G2H_BUFFER_SIZE	(4 * CTB_H2G_BUFFER_SIZE)
 +#define G2H_ROOM_BUFFER_SIZE	(PAGE_SIZE)
  
- #define MAX_US_STALL_CTB	1000000
- 
-@@ -131,23 +132,27 @@ static void guc_ct_buffer_desc_init(struct guc_ct_buffer_desc *desc)
+ struct ct_request {
+ 	struct list_head link;
+@@ -130,23 +131,27 @@ static void guc_ct_buffer_desc_init(struct guc_ct_buffer_desc *desc)
  
  static void guc_ct_buffer_reset(struct intel_guc_ct_buffer *ctb)
  {
@@ -127,7 +121,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  
  	guc_ct_buffer_reset(ctb);
  }
-@@ -228,6 +233,7 @@ int intel_guc_ct_init(struct intel_guc_ct *ct)
+@@ -227,6 +232,7 @@ int intel_guc_ct_init(struct intel_guc_ct *ct)
  	struct guc_ct_buffer_desc *desc;
  	u32 blob_size;
  	u32 cmds_size;
@@ -135,7 +129,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  	void *blob;
  	u32 *cmds;
  	int err;
-@@ -252,19 +258,21 @@ int intel_guc_ct_init(struct intel_guc_ct *ct)
+@@ -251,19 +257,21 @@ int intel_guc_ct_init(struct intel_guc_ct *ct)
  	desc = blob;
  	cmds = blob + 2 * CTB_DESC_SIZE;
  	cmds_size = CTB_H2G_BUFFER_SIZE;
@@ -163,16 +157,18 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  
  	return 0;
  }
-@@ -450,7 +458,7 @@ static int ct_write(struct intel_guc_ct *ct,
- 	/* now update descriptor */
- 	ctb->tail = tail;
- 	WRITE_ONCE(desc->tail, tail);
--	ctb->space -= len + 1;
-+	atomic_sub(len + 1, &ctb->space);
+@@ -462,8 +470,8 @@ static int ct_write(struct intel_guc_ct *ct,
  
- 	return 0;
+ 	/* update local copies */
+ 	ctb->tail = tail;
+-	GEM_BUG_ON(ctb->space < len + GUC_CTB_HDR_LEN);
+-	ctb->space -= len + GUC_CTB_HDR_LEN;
++	GEM_BUG_ON(atomic_read(&ctb->space) < len + GUC_CTB_HDR_LEN);
++	atomic_sub(len + GUC_CTB_HDR_LEN, &ctb->space);
  
-@@ -514,13 +522,34 @@ static inline bool ct_deadlocked(struct intel_guc_ct *ct)
+ 	/* now update descriptor */
+ 	WRITE_ONCE(desc->tail, tail);
+@@ -538,6 +546,27 @@ static inline bool ct_deadlocked(struct intel_guc_ct *ct)
  	return ret;
  }
  
@@ -200,6 +196,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  static inline bool h2g_has_room(struct intel_guc_ct *ct, u32 len_dw)
  {
  	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
+@@ -545,7 +574,7 @@ static inline bool h2g_has_room(struct intel_guc_ct *ct, u32 len_dw)
  	u32 head;
  	u32 space;
  
@@ -207,8 +204,8 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
 +	if (atomic_read(&ctb->space) >= len_dw)
  		return true;
  
- 	head = READ_ONCE(ctb->desc->head);
-@@ -533,16 +562,16 @@ static inline bool h2g_has_room(struct intel_guc_ct *ct, u32 len_dw)
+ 	head = READ_ONCE(desc->head);
+@@ -558,16 +587,16 @@ static inline bool h2g_has_room(struct intel_guc_ct *ct, u32 len_dw)
  	}
  
  	space = CIRC_SPACE(ctb->tail, head, ctb->size);
@@ -228,15 +225,15 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  		if (ct->stall_time == KTIME_MAX)
  			ct->stall_time = ktime_get();
  
-@@ -556,6 +585,7 @@ static int has_room_nb(struct intel_guc_ct *ct, u32 len_dw)
+@@ -581,6 +610,7 @@ static int has_room_nb(struct intel_guc_ct *ct, u32 len_dw)
  	return 0;
  }
  
-+#define G2H_LEN_DW(flags)	FIELD_GET(INTEL_GUC_SEND_G2H_DW_MASK, flags)
++#define G2H_LEN_DW(flags)	FIELD_GET(INTEL_GUC_CT_SEND_G2H_DW_MASK, flags)
  static int ct_send_nb(struct intel_guc_ct *ct,
  		      const u32 *action,
  		      u32 len,
-@@ -563,12 +593,13 @@ static int ct_send_nb(struct intel_guc_ct *ct,
+@@ -588,12 +618,13 @@ static int ct_send_nb(struct intel_guc_ct *ct,
  {
  	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
  	unsigned long spin_flags;
@@ -246,12 +243,12 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  
  	spin_lock_irqsave(&ctb->lock, spin_flags);
  
--	ret = has_room_nb(ct, len + 1);
-+	ret = has_room_nb(ct, len + 1, g2h_len_dw);
+-	ret = has_room_nb(ct, len + GUC_CTB_HDR_LEN);
++	ret = has_room_nb(ct, len + GUC_CTB_HDR_LEN, g2h_len_dw);
  	if (unlikely(ret))
  		goto out;
  
-@@ -577,6 +608,7 @@ static int ct_send_nb(struct intel_guc_ct *ct,
+@@ -602,6 +633,7 @@ static int ct_send_nb(struct intel_guc_ct *ct,
  	if (unlikely(ret))
  		goto out;
  
@@ -259,7 +256,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  	intel_guc_notify(ct_to_guc(ct));
  
  out:
-@@ -972,10 +1004,22 @@ static void ct_incoming_request_worker_func(struct work_struct *w)
+@@ -1007,10 +1039,22 @@ static void ct_incoming_request_worker_func(struct work_struct *w)
  static int ct_handle_event(struct intel_guc_ct *ct, struct ct_incoming_msg *request)
  {
  	const u32 *hxg = &request->msg[GUC_CTB_MSG_MIN_LEN];
@@ -305,6 +302,22 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt
  	bool broken;
  };
  
+@@ -96,7 +98,14 @@ static inline bool intel_guc_ct_enabled(const struct intel_guc_ct *ct)
+ 	return ct->enabled;
+ }
+ 
+-#define INTEL_GUC_CT_SEND_NB		BIT(31)
++#define INTEL_GUC_CT_SEND_NB            BIT(31)
++#define INTEL_GUC_CT_SEND_G2H_DW_SHIFT  0
++#define INTEL_GUC_CT_SEND_G2H_DW_MASK   (0xff << INTEL_GUC_CT_SEND_G2H_DW_SHIFT)
++#define MAKE_SEND_FLAGS(len) ({ \
++        typeof(len) len_ = (len); \
++        GEM_BUG_ON(!FIELD_FIT(INTEL_GUC_CT_SEND_G2H_DW_MASK, len_)); \
++        (FIELD_PREP(INTEL_GUC_CT_SEND_G2H_DW_MASK, len_) | INTEL_GUC_CT_SEND_NB); \
++})
+ int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
+ 		      u32 *response_buf, u32 response_buf_size, u32 flags);
+ void intel_guc_ct_event_handler(struct intel_guc_ct *ct);
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
diff --git a/0001-INTEL_DII-drm-i915-guc-Update-intel_gt_wait_for_idle.patch b/0001-INTEL_DII-drm-i915-guc-Update-intel_gt_wait_for_idle.patch
index 3f890f49205c..408728c20cd5 100644
--- a/0001-INTEL_DII-drm-i915-guc-Update-intel_gt_wait_for_idle.patch
+++ b/0001-INTEL_DII-drm-i915-guc-Update-intel_gt_wait_for_idle.patch
@@ -184,9 +184,9 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc
 +	atomic_t outstanding_submission_g2h;
 +
  	struct {
- 		bool enabled;
  		void (*reset)(struct intel_guc *guc);
-@@ -239,6 +241,8 @@ static inline void intel_guc_disable_msg(struct intel_guc *guc, u32 mask)
+ 		void (*enable)(struct intel_guc *guc);
+@@ -232,6 +234,8 @@ static inline void intel_guc_disable_msg(struct intel_guc *guc, u32 mask)
  	spin_unlock_irq(&guc->irq_lock);
  }
  
@@ -198,10 +198,10 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
-@@ -111,6 +111,7 @@ void intel_guc_ct_init_early(struct intel_guc_ct *ct)
+@@ -110,6 +110,7 @@ void intel_guc_ct_init_early(struct intel_guc_ct *ct)
  	INIT_LIST_HEAD(&ct->requests.incoming);
  	INIT_WORK(&ct->requests.worker, ct_incoming_request_worker_func);
- 	tasklet_init(&ct->receive_tasklet, ct_receive_tasklet_func, (unsigned long)ct);
+ 	tasklet_setup(&ct->receive_tasklet, ct_receive_tasklet_func);
 +	init_waitqueue_head(&ct->wq);
  }
  
diff --git a/0001-INTEL_DII-drm-i915-guc-Reset-implementation-for-new-.patch b/0001-INTEL_DII-drm-i915-guc-Reset-implementation-for-new-.patch
index 3d9052a96042..b1f7253d0020 100644
--- a/0001-INTEL_DII-drm-i915-guc-Reset-implementation-for-new-.patch
+++ b/0001-INTEL_DII-drm-i915-guc-Reset-implementation-for-new-.patch
@@ -383,7 +383,7 @@ diff --git a/drivers/gpu/drm/i915/gt/mock_engine.c b/drivers/gpu/drm/i915/gt/moc
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
-@@ -147,6 +147,9 @@ static void gen11_disable_guc_interrupts(struct intel_guc *guc)
+@@ -139,6 +139,9 @@ static void gen11_disable_guc_interrupts(struct intel_guc *guc)
  {
  	struct intel_gt *gt = guc_to_gt(guc);
  
@@ -391,9 +391,9 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc
 +		return;
 +
  	spin_lock_irq(&gt->irq_lock);
- 	guc->interrupts.enabled = false;
  
-@@ -586,19 +589,6 @@ int intel_guc_suspend(struct intel_guc *guc)
+ 	intel_uncore_write(gt->uncore, GEN11_GUC_SG_INTR_MASK, ~0);
+@@ -577,19 +580,6 @@ int intel_guc_suspend(struct intel_guc *guc)
  	return 0;
  }
  
@@ -416,7 +416,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
-@@ -243,14 +243,16 @@ static inline void intel_guc_disable_msg(struct intel_guc *guc, u32 mask)
+@@ -236,14 +236,16 @@ static inline void intel_guc_disable_msg(struct intel_guc *guc, u32 mask)
  
  int intel_guc_wait_for_idle(struct intel_guc *guc, long timeout);
  
diff --git a/0001-INTEL_DII-drm-i915-guc-Suspend-resume-implementation.patch b/0001-INTEL_DII-drm-i915-guc-Suspend-resume-implementation.patch
index 1d5b5dbdfbdc..eb5a1a4fbb2b 100644
--- a/0001-INTEL_DII-drm-i915-guc-Suspend-resume-implementation.patch
+++ b/0001-INTEL_DII-drm-i915-guc-Suspend-resume-implementation.patch
@@ -50,11 +50,11 @@ Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> #7
 Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com> #12
 ---
  .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |  1 +
- drivers/gpu/drm/i915/gt/uc/intel_guc.c        | 64 ++++++++-----------
+ drivers/gpu/drm/i915/gt/uc/intel_guc.c        | 67 +++++++------------
  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 14 ++--
  .../gpu/drm/i915/gt/uc/intel_guc_submission.h |  5 ++
- drivers/gpu/drm/i915/gt/uc/intel_uc.c         | 28 +++++---
- 5 files changed, 59 insertions(+), 53 deletions(-)
+ drivers/gpu/drm/i915/gt/uc/intel_uc.c         | 20 ++++--
+ 5 files changed, 53 insertions(+), 54 deletions(-)
 
 diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
 --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
@@ -70,7 +70,17 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
-@@ -541,51 +541,34 @@ int intel_guc_auth_huc(struct intel_guc *guc, u32 rsa_offset)
+@@ -139,9 +139,6 @@ static void gen11_disable_guc_interrupts(struct intel_guc *guc)
+ {
+ 	struct intel_gt *gt = guc_to_gt(guc);
+ 
+-	if (!guc->interrupts.enabled)
+-		return;
+-
+ 	spin_lock_irq(&gt->irq_lock);
+ 
+ 	intel_uncore_write(gt->uncore, GEN11_GUC_SG_INTR_MASK, ~0);
+@@ -532,51 +529,34 @@ int intel_guc_auth_huc(struct intel_guc *guc, u32 rsa_offset)
   */
  int intel_guc_suspend(struct intel_guc *guc)
  {
@@ -142,7 +152,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc
  	return 0;
  }
  
-@@ -595,7 +578,12 @@ int intel_guc_suspend(struct intel_guc *guc)
+@@ -586,7 +566,12 @@ int intel_guc_suspend(struct intel_guc *guc)
   */
  int intel_guc_resume(struct intel_guc *guc)
  {
@@ -212,17 +222,14 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h b/drivers/gpu/drm
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
 --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
-@@ -597,14 +597,20 @@ void intel_uc_cancel_requests(struct intel_uc *uc)
+@@ -597,14 +597,18 @@ void intel_uc_cancel_requests(struct intel_uc *uc)
  void intel_uc_runtime_suspend(struct intel_uc *uc)
  {
  	struct intel_guc *guc = &uc->guc;
 -	int err;
  
--	if (!intel_guc_is_ready(guc))
-+	if (!intel_guc_is_ready(guc)) {
-+		guc->interrupts.enabled = false;
+ 	if (!intel_guc_is_ready(guc))
  		return;
-+	}
  
 -	err = intel_guc_suspend(guc);
 -	if (err)
@@ -238,17 +245,14 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/
  
  	guc_disable_communication(guc);
  }
-@@ -613,12 +619,18 @@ void intel_uc_suspend(struct intel_uc *uc)
+@@ -613,12 +617,16 @@ void intel_uc_suspend(struct intel_uc *uc)
  {
  	struct intel_guc *guc = &uc->guc;
  	intel_wakeref_t wakeref;
 +	int err;
  
--	if (!intel_guc_is_ready(guc))
-+	if (!intel_guc_is_ready(guc)) {
-+		guc->interrupts.enabled = false;
+ 	if (!intel_guc_is_ready(guc))
  		return;
-+	}
  
 -	with_intel_runtime_pm(uc_to_gt(uc)->uncore->rpm, wakeref)
 -		intel_uc_runtime_suspend(uc);
diff --git a/0001-INTEL_DII-FIXME-drm-i915-guc-IOMMU-catastrophic-erro.patch b/0001-INTEL_DII-FIXME-drm-i915-guc-IOMMU-catastrophic-erro.patch
index 9de8fdcab928..2c3d3a6a74b1 100644
--- a/0001-INTEL_DII-FIXME-drm-i915-guc-IOMMU-catastrophic-erro.patch
+++ b/0001-INTEL_DII-FIXME-drm-i915-guc-IOMMU-catastrophic-erro.patch
@@ -60,7 +60,7 @@ Reviewed-by: Janusz Krzystofik <janusz.krzysztofik@linux.intel.com>
 diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
 --- a/drivers/gpu/drm/i915/Makefile
 +++ b/drivers/gpu/drm/i915/Makefile
-@@ -180,6 +180,7 @@ i915-y += \
+@@ -179,6 +179,7 @@ i915-y += \
  	  i915_scheduler.o \
  	  i915_trace_points.o \
  	  i915_vma.o \
@@ -88,9 +88,9 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  #include "intel_guc_ct.h"
 +#include "intel_pagefault.h"
  #include "gt/intel_gt.h"
+ #include "gem/i915_gem_lmem.h"
  
- static inline struct intel_guc *ct_to_guc(struct intel_guc_ct *ct)
-@@ -963,6 +964,9 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
+@@ -998,6 +999,9 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
  			CT_ERROR(ct, "engine failure handler failed %x %*ph\n",
  				  action, 4 * len, payload);
  		break;
diff --git a/0001-INTEL_DII-drm-i915-guc-Selftest-for-GuC-flow-control.patch b/0001-INTEL_DII-drm-i915-guc-Selftest-for-GuC-flow-control.patch
index c0a7f7a55757..f514caf73316 100644
--- a/0001-INTEL_DII-drm-i915-guc-Selftest-for-GuC-flow-control.patch
+++ b/0001-INTEL_DII-drm-i915-guc-Selftest-for-GuC-flow-control.patch
@@ -31,7 +31,7 @@ v8: Drop submission disabled check (Matthew Brost)
 Signed-off-by: Matthew Brost <matthew.brost@intel.com>
 ---
  drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   6 +
- drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  40 +-
+ drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  39 +-
  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |   9 +
  .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  25 +-
  .../i915/gt/uc/intel_guc_submission_types.h   |   2 +
@@ -39,13 +39,13 @@ Signed-off-by: Matthew Brost <matthew.brost@intel.com>
  .../drm/i915/selftests/i915_live_selftests.h  |   1 +
  .../i915/selftests/intel_scheduler_helpers.c  |  11 +
  .../i915/selftests/intel_scheduler_helpers.h  |   2 +
- 9 files changed, 665 insertions(+), 10 deletions(-)
+ 9 files changed, 665 insertions(+), 9 deletions(-)
  create mode 100644 drivers/gpu/drm/i915/gt/uc/selftest_guc_flow_control.c
 
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
-@@ -101,6 +101,12 @@ struct intel_guc {
+@@ -100,6 +100,12 @@ struct intel_guc {
  
  	/* To serialize the intel_guc_send actions */
  	struct mutex send_mutex;
@@ -69,25 +69,20 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  #include <linux/ktime.h>
  #include <linux/time64.h>
  #include <linux/timekeeping.h>
-@@ -405,11 +404,13 @@ static int ct_write(struct intel_guc_ct *ct,
+@@ -414,8 +413,10 @@ static int ct_write(struct intel_guc_ct *ct,
  	u32 *cmds = ctb->cmds;
  	unsigned int i;
  
--	if (unlikely(ctb->broken))
--		return -EIO;
-+	if (!I915_SELFTEST_ONLY(ct_to_guc(ct)->deadlock_expected)) {
-+		if (unlikely(ctb->broken))
-+			return -EIO;
- 
 -	if (unlikely(desc->status))
 -		goto corrupted;
++	if (!I915_SELFTEST_ONLY(ct_to_guc(ct)->deadlock_expected)) {
 +		if (unlikely(desc->status))
 +			goto corrupted;
 +	}
  
- #ifdef CONFIG_DRM_I915_DEBUG_GUC
- 	if (unlikely((desc->tail | desc->head) >= size)) {
-@@ -428,6 +429,15 @@ static int ct_write(struct intel_guc_ct *ct,
+ 	GEM_BUG_ON(tail > size);
+ 
+@@ -443,6 +444,15 @@ static int ct_write(struct intel_guc_ct *ct,
  		 FIELD_PREP(GUC_CTB_MSG_0_NUM_DWORDS, len) |
  		 FIELD_PREP(GUC_CTB_MSG_0_FENCE, fence);
  
@@ -100,10 +95,10 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
 +	}
 +#endif
 +
- 	hxg = (flags & INTEL_GUC_SEND_NB) ?
- 		(FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_EVENT) |
- 		 FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
-@@ -465,8 +475,12 @@ static int ct_write(struct intel_guc_ct *ct,
+ 	type = (flags & INTEL_GUC_CT_SEND_NB) ? GUC_HXG_TYPE_EVENT :
+ 		GUC_HXG_TYPE_REQUEST;
+ 	hxg = FIELD_PREP(GUC_HXG_MSG_0_TYPE, type) |
+@@ -481,8 +491,12 @@ static int ct_write(struct intel_guc_ct *ct,
  	return 0;
  
  corrupted:
@@ -116,27 +111,30 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
 +		CT_ERROR(ct, "Corrupted descriptor head=%u tail=%u status=%#x\n",
 +			 desc->head, desc->tail, desc->status);
  	ctb->broken = true;
- 	return -EIO;
+ 	return -EPIPE;
  }
-@@ -518,8 +532,16 @@ static inline bool ct_deadlocked(struct intel_guc_ct *ct)
- 	bool ret = ktime_us_delta(ktime_get(), ct->stall_time) >
- 		MAX_US_STALL_CTB;
+@@ -539,9 +553,18 @@ static inline bool ct_deadlocked(struct intel_guc_ct *ct)
+ 		struct guc_ct_buffer_desc *send = ct->ctbs.send.desc;
+ 		struct guc_ct_buffer_desc *recv = ct->ctbs.send.desc;
  
--	if (unlikely(ret))
--		CT_ERROR(ct, "CT deadlocked\n");
-+	if (unlikely(ret)) {
+-		CT_ERROR(ct, "Communication stalled for %lld ms, desc status=%#x,%#x\n",
+-			 ktime_ms_delta(ktime_get(), ct->stall_time),
+-			 send->status, recv->status);
 +		/*
 +		 * CI doesn't like error messages, demote to debug if deadlock was
 +		 * intentionally hit.
 +		 */
 +		if (I915_SELFTEST_ONLY(ct_to_guc(ct)->deadlock_expected))
-+			CT_DEBUG(ct, "CT deadlocked\n");
++			CT_DEBUG(ct, "Communication stalled for %lld ms, desc status=%#x,%#x\n",
++				 ktime_ms_delta(ktime_get(), ct->stall_time),
++				 send->status, recv->status);
 +		else
-+			CT_ERROR(ct, "CT deadlocked\n");
-+	}
++			CT_ERROR(ct, "Communication stalled for %lld ms, desc status=%#x,%#x\n",
++				 ktime_ms_delta(ktime_get(), ct->stall_time),
++				 send->status, recv->status);
+ 		ct->ctbs.send.broken = true;
+ 	}
  
- 	return ret;
- }
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
@@ -148,7 +146,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt
  
  #include "intel_guc_fwif.h"
  
-@@ -109,4 +110,12 @@ void intel_guc_ct_event_handler(struct intel_guc_ct *ct);
+@@ -117,4 +118,12 @@ void intel_guc_ct_event_handler(struct intel_guc_ct *ct);
  
  void intel_guc_log_ct_info(struct intel_guc_ct *ct, struct drm_printer *p);
  
diff --git a/0001-INTEL_DII-drm-i915-guc-slpc-Add-modparam-and-state-c.patch b/0001-INTEL_DII-drm-i915-guc-slpc-Add-modparam-and-state-c.patch
index 9cbd3d89673a..493b19222445 100644
--- a/0001-INTEL_DII-drm-i915-guc-slpc-Add-modparam-and-state-c.patch
+++ b/0001-INTEL_DII-drm-i915-guc-slpc-Add-modparam-and-state-c.patch
@@ -39,13 +39,12 @@ Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
  .../gpu/drm/i915/gt/uc/intel_guc_submission.h | 16 ++++++++++++++
  drivers/gpu/drm/i915/gt/uc/intel_uc.c         | 13 ++++++++++--
  drivers/gpu/drm/i915/gt/uc/intel_uc.h         |  1 +
- drivers/gpu/drm/i915/i915_params.c            |  2 +-
- 7 files changed, 53 insertions(+), 3 deletions(-)
+ 6 files changed, 52 insertions(+), 2 deletions(-)
 
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
-@@ -170,6 +170,7 @@ void intel_guc_init_early(struct intel_guc *guc)
+@@ -158,6 +158,7 @@ void intel_guc_init_early(struct intel_guc *guc)
  	intel_guc_ct_init_early(&guc->ct);
  	intel_guc_log_init_early(&guc->log);
  	intel_guc_submission_init_early(guc);
@@ -56,7 +55,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
-@@ -71,6 +71,8 @@ struct intel_guc {
+@@ -70,6 +70,8 @@ struct intel_guc {
  
  	bool submission_supported;
  	bool submission_selected;
@@ -176,15 +175,3 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.h b/drivers/gpu/drm/i915/gt/uc/
  
  #undef uc_state_checkers
  #undef __uc_state_checker
-diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
---- a/drivers/gpu/drm/i915/i915_params.c
-+++ b/drivers/gpu/drm/i915/i915_params.c
-@@ -169,7 +169,7 @@ i915_param_named_unsafe(edp_vswing, int, 0400,
- i915_param_named_unsafe(enable_guc, int, 0400,
- 	"Enable GuC load for GuC submission and/or HuC load. "
- 	"Required functionality can be selected using bitmask values. "
--	"(-1=auto, 0=disable [default], 1=GuC submission, 2=HuC load)");
-+	"(-1=auto, 0=disable [default], 1=GuC submission, 2=HuC load) ");
- 
- i915_param_named(guc_log_level, int, 0400,
- 	"GuC firmware logging level. Requires GuC to be loaded. "
diff --git a/0001-INTEL_DII-NOT_UPSTREAM-drm-i915-guc-Dump-error-captu.patch b/0001-INTEL_DII-NOT_UPSTREAM-drm-i915-guc-Dump-error-captu.patch
index 464182594c7d..328f9f411b35 100644
--- a/0001-INTEL_DII-NOT_UPSTREAM-drm-i915-guc-Dump-error-captu.patch
+++ b/0001-INTEL_DII-NOT_UPSTREAM-drm-i915-guc-Dump-error-captu.patch
@@ -18,17 +18,17 @@ error is detected.
 Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
 Reviewed-by: Matthew Brost <matthew.brost@intel.com>
 ---
- drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 51 ++++++++++++++++++-
+ drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 53 +++++++++++++++++--
  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |  4 ++
  .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  8 +--
- 3 files changed, 57 insertions(+), 6 deletions(-)
+ 3 files changed, 58 insertions(+), 7 deletions(-)
 
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
-@@ -12,6 +12,17 @@
- #include "intel_pagefault.h"
+@@ -13,6 +13,17 @@
  #include "gt/intel_gt.h"
+ #include "gem/i915_gem_lmem.h"
  
 +enum {
 +	CT_DEAD_ALIVE = 0,
@@ -44,16 +44,16 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  static inline struct intel_guc *ct_to_guc(struct intel_guc_ct *ct)
  {
  	return container_of(ct, struct intel_guc, ct);
-@@ -109,6 +120,7 @@ void intel_guc_ct_init_early(struct intel_guc_ct *ct)
+@@ -108,6 +119,7 @@ void intel_guc_ct_init_early(struct intel_guc_ct *ct)
  	spin_lock_init(&ct->requests.lock);
  	INIT_LIST_HEAD(&ct->requests.pending);
  	INIT_LIST_HEAD(&ct->requests.incoming);
 +	INIT_WORK(&ct->dead_ct_worker, ct_dead_ct_worker_func);
  	INIT_WORK(&ct->requests.worker, ct_incoming_request_worker_func);
- 	tasklet_init(&ct->receive_tasklet, ct_receive_tasklet_func, (unsigned long)ct);
+ 	tasklet_setup(&ct->receive_tasklet, ct_receive_tasklet_func);
  	init_waitqueue_head(&ct->wq);
-@@ -344,6 +356,8 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
- 	ct->requests.last_fence = 1;
+@@ -342,6 +354,8 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
+ 
  	ct->enabled = true;
  	ct->stall_time = KTIME_MAX;
 +	ct->dead_ct_reported = false;
@@ -61,7 +61,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  
  	return 0;
  
-@@ -351,6 +365,10 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
+@@ -349,6 +363,10 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
  	ct_deregister_buffer(ct, GUC_CTB_TYPE_GUC2HOST);
  err_out:
  	CT_PROBE_ERROR(ct, "Failed to enable CTB (%pe)\n", ERR_PTR(err));
@@ -72,7 +72,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  	return err;
  }
  
-@@ -478,9 +496,12 @@ static int ct_write(struct intel_guc_ct *ct,
+@@ -494,9 +512,12 @@ static int ct_write(struct intel_guc_ct *ct,
  	if (I915_SELFTEST_ONLY(ct_to_guc(ct)->bad_desc_expected))
  		CT_DEBUG(ct, "Corrupted descriptor head=%u tail=%u status=%#x\n",
  			 desc->head, desc->tail, desc->status);
@@ -84,31 +84,38 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
 +		queue_work(system_unbound_wq, &ct->dead_ct_worker);
 +	}
  	ctb->broken = true;
- 	return -EIO;
+ 	return -EPIPE;
  }
-@@ -539,8 +560,11 @@ static inline bool ct_deadlocked(struct intel_guc_ct *ct)
+@@ -557,14 +578,17 @@ static inline bool ct_deadlocked(struct intel_guc_ct *ct)
+ 		 * CI doesn't like error messages, demote to debug if deadlock was
+ 		 * intentionally hit.
  		 */
- 		if (I915_SELFTEST_ONLY(ct_to_guc(ct)->deadlock_expected))
- 			CT_DEBUG(ct, "CT deadlocked\n");
+-		if (I915_SELFTEST_ONLY(ct_to_guc(ct)->deadlock_expected))
++		if (I915_SELFTEST_ONLY(ct_to_guc(ct)->deadlock_expected)) {
+ 			CT_DEBUG(ct, "Communication stalled for %lld ms, desc status=%#x,%#x\n",
+ 				 ktime_ms_delta(ktime_get(), ct->stall_time),
+ 				 send->status, recv->status);
 -		else
-+		else {
- 			CT_ERROR(ct, "CT deadlocked\n");
++		} else {
+ 			CT_ERROR(ct, "Communication stalled for %lld ms, desc status=%#x,%#x\n",
+ 				 ktime_ms_delta(ktime_get(), ct->stall_time),
+ 				 send->status, recv->status);
 +			ct->dead_ct_reason |= 1 << CT_DEAD_DEADLOCK;
 +			queue_work(system_unbound_wq, &ct->dead_ct_worker);
 +		}
+ 		ct->ctbs.send.broken = true;
  	}
  
- 	return ret;
-@@ -582,6 +606,8 @@ static inline bool h2g_has_room(struct intel_guc_ct *ct, u32 len_dw)
- 			  ctb->desc->head, ctb->desc->tail, ctb->size);
- 		ctb->desc->status |= GUC_CTB_STATUS_OVERFLOW;
+@@ -608,6 +632,8 @@ static inline bool h2g_has_room(struct intel_guc_ct *ct, u32 len_dw)
+ 			 head, ctb->size);
+ 		desc->status |= GUC_CTB_STATUS_OVERFLOW;
  		ctb->broken = true;
 +		ct->dead_ct_reason |= 1 << CT_DEAD_H2G_HAS_ROOM;
 +		queue_work(system_unbound_wq, &ct->dead_ct_worker);
  		return false;
  	}
  
-@@ -881,6 +907,8 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
+@@ -917,6 +943,8 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
  	CT_ERROR(ct, "Corrupted descriptor head=%u tail=%u status=%#x\n",
  		 desc->head, desc->tail, desc->status);
  	ctb->broken = true;
@@ -117,7 +124,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  	return -EPIPE;
  }
  
-@@ -1029,6 +1057,10 @@ static bool ct_process_incoming_requests(struct intel_guc_ct *ct)
+@@ -1065,6 +1093,10 @@ static bool ct_process_incoming_requests(struct intel_guc_ct *ct)
  	if (unlikely(err)) {
  		CT_ERROR(ct, "Failed to process CT message (%pe) %*ph\n",
  			 ERR_PTR(err), 4 * request->size, request->msg);
@@ -128,7 +135,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  		ct_free_msg(request);
  	}
  
-@@ -1204,3 +1236,18 @@ void intel_guc_log_ct_info(struct intel_guc_ct *ct,
+@@ -1240,3 +1272,18 @@ void intel_guc_log_ct_info(struct intel_guc_ct *ct,
  	drm_printf(p, "Tail: %u\n",
  		   ct->ctbs.recv.desc->tail);
  }
diff --git a/0001-INTEL_DII-drm-i915-huc-Update-firmware-to-v7.9.3-for.patch b/0001-INTEL_DII-drm-i915-huc-Update-firmware-to-v7.9.3-for.patch
index 4f9dff2e84cc..2802979f103b 100644
--- a/0001-INTEL_DII-drm-i915-huc-Update-firmware-to-v7.9.3-for.patch
+++ b/0001-INTEL_DII-drm-i915-huc-Update-firmware-to-v7.9.3-for.patch
@@ -14,7 +14,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/
 --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
 @@ -65,10 +65,10 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
- 	fw_def(SKYLAKE,      0, guc_def(skl,  61, 1, 1))
+ 	fw_def(SKYLAKE,      0, guc_def(skl,  62, 0, 0))
  
  #define INTEL_HUC_FIRMWARE_DEFS(fw_def, huc_def) \
 -	fw_def(ALDERLAKE_S,  0, huc_def(tgl,  7, 5, 0)) \
diff --git a/0001-INTEL_DII-drm-i915-guc-Update-GuC-to-63.0.0.patch b/0001-INTEL_DII-drm-i915-guc-Update-GuC-to-63.0.0.patch
index bee0627f2ffc..3558cc5477d7 100644
--- a/0001-INTEL_DII-drm-i915-guc-Update-GuC-to-63.0.0.patch
+++ b/0001-INTEL_DII-drm-i915-guc-Update-GuC-to-63.0.0.patch
@@ -23,20 +23,20 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/
   * firmware as TGL.
   */
  #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_def) \
--	fw_def(ALDERLAKE_S,  0, guc_def(tgl,  61, 1, 1)) \
--	fw_def(DG1,          0, guc_def(dg1,  61, 1, 1)) \
--	fw_def(ROCKETLAKE,   0, guc_def(tgl,  61, 1, 1)) \
--	fw_def(TIGERLAKE,    0, guc_def(tgl,  61, 1, 1)) \
--	fw_def(JASPERLAKE,   0, guc_def(ehl,  61, 1, 1)) \
--	fw_def(ELKHARTLAKE,  0, guc_def(ehl,  61, 1, 1)) \
--	fw_def(ICELAKE,      0, guc_def(icl,  61, 1, 1)) \
--	fw_def(COMETLAKE,    5, guc_def(cml,  61, 1, 1)) \
--	fw_def(COMETLAKE,    0, guc_def(kbl,  61, 1, 1)) \
--	fw_def(COFFEELAKE,   0, guc_def(kbl,  61, 1, 1)) \
--	fw_def(GEMINILAKE,   0, guc_def(glk,  61, 1, 1)) \
--	fw_def(KABYLAKE,     0, guc_def(kbl,  61, 1, 1)) \
--	fw_def(BROXTON,      0, guc_def(bxt,  61, 1, 1)) \
--	fw_def(SKYLAKE,      0, guc_def(skl,  61, 1, 1))
+-	fw_def(ALDERLAKE_S,  0, guc_def(tgl,  62, 0, 0)) \
+-	fw_def(DG1,          0, guc_def(dg1,  62, 0, 0)) \
+-	fw_def(ROCKETLAKE,   0, guc_def(tgl,  62, 0, 0)) \
+-	fw_def(TIGERLAKE,    0, guc_def(tgl,  62, 0, 0)) \
+-	fw_def(JASPERLAKE,   0, guc_def(ehl,  62, 0, 0)) \
+-	fw_def(ELKHARTLAKE,  0, guc_def(ehl,  62, 0, 0)) \
+-	fw_def(ICELAKE,      0, guc_def(icl,  62, 0, 0)) \
+-	fw_def(COMETLAKE,    5, guc_def(cml,  62, 0, 0)) \
+-	fw_def(COMETLAKE,    0, guc_def(kbl,  62, 0, 0)) \
+-	fw_def(COFFEELAKE,   0, guc_def(kbl,  62, 0, 0)) \
+-	fw_def(GEMINILAKE,   0, guc_def(glk,  62, 0, 0)) \
+-	fw_def(KABYLAKE,     0, guc_def(kbl,  62, 0, 0)) \
+-	fw_def(BROXTON,      0, guc_def(bxt,  62, 0, 0)) \
+-	fw_def(SKYLAKE,      0, guc_def(skl,  62, 0, 0))
 +	fw_def(ALDERLAKE_S,  0, guc_def(tgl,  63, 0, 0)) \
 +	fw_def(DG1,          0, guc_def(dg1,  63, 0, 0)) \
 +	fw_def(ROCKETLAKE,   0, guc_def(tgl,  63, 0, 0)) \
diff --git a/0001-INTEL_DII-drm-i915-guc-Add-support-for-CTB-RETRY-mes.patch b/0001-INTEL_DII-drm-i915-guc-Add-support-for-CTB-RETRY-mes.patch
index b7e291351e64..f1cdfe98fdaf 100644
--- a/0001-INTEL_DII-drm-i915-guc-Add-support-for-CTB-RETRY-mes.patch
+++ b/0001-INTEL_DII-drm-i915-guc-Add-support-for-CTB-RETRY-mes.patch
@@ -15,15 +15,15 @@ Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
-@@ -677,6 +677,7 @@ static int ct_send(struct intel_guc_ct *ct,
- 	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
+@@ -704,6 +704,7 @@ static int ct_send(struct intel_guc_ct *ct,
  	struct ct_request request;
  	unsigned long flags;
+ 	unsigned int sleep_period_ms = 1;
 +	bool send_again;
  	u32 fence;
  	int err;
  
-@@ -686,6 +687,9 @@ static int ct_send(struct intel_guc_ct *ct,
+@@ -713,6 +714,9 @@ static int ct_send(struct intel_guc_ct *ct,
  	GEM_BUG_ON(!response_buf && response_buf_size);
  	might_sleep();
  
@@ -33,7 +33,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  	/*
  	 * We use a lazy spin wait loop here as we believe that if the CT
  	 * buffers are sized correctly the flow control condition should be
-@@ -730,6 +734,13 @@ static int ct_send(struct intel_guc_ct *ct,
+@@ -760,6 +764,13 @@ static int ct_send(struct intel_guc_ct *ct,
  	if (unlikely(err))
  		goto unlink;
  
@@ -47,7 +47,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, *status) != GUC_HXG_TYPE_RESPONSE_SUCCESS) {
  		err = -EIO;
  		goto unlink;
-@@ -752,6 +763,9 @@ static int ct_send(struct intel_guc_ct *ct,
+@@ -782,6 +793,9 @@ static int ct_send(struct intel_guc_ct *ct,
  	list_del(&request.link);
  	spin_unlock_irqrestore(&ct->requests.lock, flags);
  
@@ -57,7 +57,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  	return err;
  }
  
-@@ -927,6 +941,7 @@ static int ct_handle_response(struct intel_guc_ct *ct, struct ct_incoming_msg *r
+@@ -963,6 +977,7 @@ static int ct_handle_response(struct intel_guc_ct *ct, struct ct_incoming_msg *r
  	GEM_BUG_ON(len < GUC_HXG_MSG_MIN_LEN);
  	GEM_BUG_ON(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg[0]) != GUC_HXG_ORIGIN_GUC);
  	GEM_BUG_ON(FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]) != GUC_HXG_TYPE_RESPONSE_SUCCESS &&
@@ -65,7 +65,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  		   FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]) != GUC_HXG_TYPE_RESPONSE_FAILURE);
  
  	CT_DEBUG(ct, "response fence %u status %#x\n", fence, hxg[0]);
-@@ -1129,6 +1144,7 @@ static int ct_handle_hxg(struct intel_guc_ct *ct, struct ct_incoming_msg *msg)
+@@ -1165,6 +1180,7 @@ static int ct_handle_hxg(struct intel_guc_ct *ct, struct ct_incoming_msg *msg)
  		break;
  	case GUC_HXG_TYPE_RESPONSE_SUCCESS:
  	case GUC_HXG_TYPE_RESPONSE_FAILURE:
diff --git a/0001-INTEL_DII-drm-i915-guc-Use-new-CTB-config-control-ac.patch b/0001-INTEL_DII-drm-i915-guc-Use-new-CTB-config-control-ac.patch
index 9ba387fc66b8..fe9fb44f8ad8 100644
--- a/0001-INTEL_DII-drm-i915-guc-Use-new-CTB-config-control-ac.patch
+++ b/0001-INTEL_DII-drm-i915-guc-Use-new-CTB-config-control-ac.patch
@@ -75,7 +75,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
-@@ -126,18 +126,6 @@ void intel_guc_ct_init_early(struct intel_guc_ct *ct)
+@@ -125,18 +125,6 @@ void intel_guc_ct_init_early(struct intel_guc_ct *ct)
  	init_waitqueue_head(&ct->wq);
  }
  
@@ -94,7 +94,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  static void guc_ct_buffer_desc_init(struct guc_ct_buffer_desc *desc)
  {
  	memset(desc, 0, sizeof(*desc));
-@@ -170,65 +158,65 @@ static void guc_ct_buffer_init(struct intel_guc_ct_buffer *ctb,
+@@ -169,65 +157,65 @@ static void guc_ct_buffer_init(struct intel_guc_ct_buffer *ctb,
  	guc_ct_buffer_reset(ctb);
  }
  
@@ -198,7 +198,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  	return err;
  }
  
-@@ -314,7 +302,7 @@ void intel_guc_ct_fini(struct intel_guc_ct *ct)
+@@ -313,7 +301,7 @@ void intel_guc_ct_fini(struct intel_guc_ct *ct)
  int intel_guc_ct_enable(struct intel_guc_ct *ct)
  {
  	struct intel_guc *guc = ct_to_guc(ct);
@@ -207,7 +207,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  	void *blob;
  	int err;
  
-@@ -339,19 +327,21 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
+@@ -338,19 +326,21 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
  	 */
  	desc = base + ptrdiff(ct->ctbs.recv.desc, blob);
  	cmds = base + ptrdiff(ct->ctbs.recv.cmds, blob);
@@ -233,9 +233,9 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
 -		goto err_deregister;
 +		goto err_out;
  
- 	ct->requests.last_fence = 1;
  	ct->enabled = true;
-@@ -361,8 +351,6 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
+ 	ct->stall_time = KTIME_MAX;
+@@ -359,8 +349,6 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
  
  	return 0;
  
@@ -244,7 +244,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  err_out:
  	CT_PROBE_ERROR(ct, "Failed to enable CTB (%pe)\n", ERR_PTR(err));
  	if (!ct->dead_ct_reported) {
-@@ -385,8 +373,7 @@ void intel_guc_ct_disable(struct intel_guc_ct *ct)
+@@ -383,8 +371,7 @@ void intel_guc_ct_disable(struct intel_guc_ct *ct)
  	ct->enabled = false;
  
  	if (intel_guc_is_fw_running(guc)) {
diff --git a/0001-INTEL_DII-drm-i915-guc-Drop-obsolete-CTB-registratio.patch b/0001-INTEL_DII-drm-i915-guc-Drop-obsolete-CTB-registratio.patch
index 3cb0bcbe5156..3347e67f2bf0 100644
--- a/0001-INTEL_DII-drm-i915-guc-Drop-obsolete-CTB-registratio.patch
+++ b/0001-INTEL_DII-drm-i915-guc-Drop-obsolete-CTB-registratio.patch
@@ -38,7 +38,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/
 - *  |   +-------+--------------------------------------------------------------+
 - *  |   | 27:16 | DATA0 = MBZ                                                  |
 - *  |   +-------+--------------------------------------------------------------+
-- *  |   |  15:0 | ACTION = _`GUC_ACTION_HOST2GUC_REGISTER_CTB` = 0x5200        |
+- *  |   |  15:0 | ACTION = _`GUC_ACTION_HOST2GUC_REGISTER_CTB` = 0x4505        |
 - *  +---+-------+--------------------------------------------------------------+
 - *  | 1 | 31:12 | RESERVED = MBZ                                               |
 - *  |   +-------+--------------------------------------------------------------+
@@ -53,7 +53,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/
 - *  +---+-------+--------------------------------------------------------------+
 - *  | 3 |  31:0 | **BUFF_ADDF** - GGTT address of the `CT Buffer`_             |
 - *  +---+-------+--------------------------------------------------------------+
--*
+- *
 - *  +---+-------+--------------------------------------------------------------+
 - *  |   | Bits  | Description                                                  |
 - *  +===+=======+==============================================================+
@@ -64,7 +64,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/
 - *  |   |  27:0 | DATA0 = MBZ                                                  |
 - *  +---+-------+--------------------------------------------------------------+
 - */
--#define GUC_ACTION_HOST2GUC_REGISTER_CTB		0x4505 // FIXME 0x5200
+-#define GUC_ACTION_HOST2GUC_REGISTER_CTB		0x4505
 -
 -#define HOST2GUC_REGISTER_CTB_REQUEST_MSG_LEN		(GUC_HXG_REQUEST_MSG_MIN_LEN + 3u)
 -#define HOST2GUC_REGISTER_CTB_REQUEST_MSG_0_MBZ		GUC_HXG_REQUEST_MSG_0_DATA0
@@ -95,7 +95,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/
 - *  |   +-------+--------------------------------------------------------------+
 - *  |   | 27:16 | DATA0 = MBZ                                                  |
 - *  |   +-------+--------------------------------------------------------------+
-- *  |   |  15:0 | ACTION = _`GUC_ACTION_HOST2GUC_DEREGISTER_CTB` = 0x5201      |
+- *  |   |  15:0 | ACTION = _`GUC_ACTION_HOST2GUC_DEREGISTER_CTB` = 0x4506      |
 - *  +---+-------+--------------------------------------------------------------+
 - *  | 1 | 31:12 | RESERVED = MBZ                                               |
 - *  |   +-------+--------------------------------------------------------------+
@@ -105,7 +105,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/
 - *  |   +-------+--------------------------------------------------------------+
 - *  |   |   7:0 | RESERVED = MBZ                                               |
 - *  +---+-------+--------------------------------------------------------------+
--*
+- *
 - *  +---+-------+--------------------------------------------------------------+
 - *  |   | Bits  | Description                                                  |
 - *  +===+=======+==============================================================+
@@ -116,7 +116,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/
 - *  |   |  27:0 | DATA0 = MBZ                                                  |
 - *  +---+-------+--------------------------------------------------------------+
 - */
--#define GUC_ACTION_HOST2GUC_DEREGISTER_CTB		0x4506 // FIXME 0x5201
+-#define GUC_ACTION_HOST2GUC_DEREGISTER_CTB		0x4506
 -
 -#define HOST2GUC_DEREGISTER_CTB_REQUEST_MSG_LEN		(GUC_HXG_REQUEST_MSG_MIN_LEN + 1u)
 -#define HOST2GUC_DEREGISTER_CTB_REQUEST_MSG_0_MBZ	GUC_HXG_REQUEST_MSG_0_DATA0
diff --git a/0001-INTEL_DII-drm-i915-guc-Add-query-of-hwconfig-tables.patch b/0001-INTEL_DII-drm-i915-guc-Add-query-of-hwconfig-tables.patch
index 6b97d7ce271c..6a267923c9d6 100644
--- a/0001-INTEL_DII-drm-i915-guc-Add-query-of-hwconfig-tables.patch
+++ b/0001-INTEL_DII-drm-i915-guc-Add-query-of-hwconfig-tables.patch
@@ -38,7 +38,7 @@ Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
 diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
 --- a/drivers/gpu/drm/i915/Makefile
 +++ b/drivers/gpu/drm/i915/Makefile
-@@ -197,6 +197,7 @@ i915-y += gt/uc/intel_uc.o \
+@@ -196,6 +196,7 @@ i915-y += gt/uc/intel_uc.o \
  	  gt/uc/intel_guc_rc.o \
  	  gt/uc/intel_guc_slpc.o \
  	  gt/uc/intel_guc_submission.o \
@@ -60,10 +60,10 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/
 diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
 --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
 +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
-@@ -7,6 +7,10 @@
- #define _ABI_GUC_ERRORS_ABI_H
+@@ -8,6 +8,10 @@
  
  enum intel_guc_response_status {
+ 	INTEL_GUC_RESPONSE_STATUS_SUCCESS = 0x0,
 +	INTEL_GUC_RESPONSE_NOT_SUPPORTED = 0x20,
 +	INTEL_GUC_RESPONSE_NO_ATTRIBUTE_TABLE = 0x201,
 +	INTEL_GUC_RESPONSE_NO_DECRYPTION_KEY = 0x202,
@@ -74,7 +74,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h b/drivers/gpu/drm/i
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
-@@ -455,13 +455,14 @@ int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
+@@ -443,13 +443,14 @@ int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
  	/*
  	 * No GuC command should ever take longer than 10ms.
  	 * Fast commands should still complete in 10us.
diff --git a/0001-INTEL_DII-drm-i915-guc-Define-CTB-based-TLB-invalida.patch b/0001-INTEL_DII-drm-i915-guc-Define-CTB-based-TLB-invalida.patch
index b20178ffa0b5..819ad2c9f13d 100644
--- a/0001-INTEL_DII-drm-i915-guc-Define-CTB-based-TLB-invalida.patch
+++ b/0001-INTEL_DII-drm-i915-guc-Define-CTB-based-TLB-invalida.patch
@@ -66,7 +66,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
-@@ -832,6 +832,77 @@ int intel_guc_self_cfg64(struct intel_guc *guc, u16 key, u64 value)
+@@ -820,6 +820,77 @@ int intel_guc_self_cfg64(struct intel_guc *guc, u16 key, u64 value)
  	return __guc_self_cfg(guc, key, 2, value);
  }
  
@@ -155,9 +155,9 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc
 +	u32 next_seqno;
 +
  	struct {
- 		bool enabled;
  		void (*reset)(struct intel_guc *guc);
-@@ -117,6 +120,11 @@ struct intel_guc {
+ 		void (*enable)(struct intel_guc *guc);
+@@ -116,6 +119,11 @@ struct intel_guc {
  	I915_SELFTEST_DECLARE(bool inject_corrupt_h2g;)
  };
  
@@ -169,7 +169,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc
  static inline struct intel_guc *log_to_guc(struct intel_guc_log *log)
  {
  	return container_of(log, struct intel_guc, log);
-@@ -226,6 +234,9 @@ int intel_guc_allocate_and_map_vma(struct intel_guc *guc, u32 size,
+@@ -219,6 +227,9 @@ int intel_guc_allocate_and_map_vma(struct intel_guc *guc, u32 size,
  int intel_guc_self_cfg32(struct intel_guc *guc, u16 key, u32 value);
  int intel_guc_self_cfg64(struct intel_guc *guc, u16 key, u64 value);
  
@@ -179,7 +179,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc
  static inline bool intel_guc_is_supported(const struct intel_guc *guc)
  {
  	return intel_uc_fw_is_supported(&guc->fw);
-@@ -303,6 +314,7 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
+@@ -296,6 +307,7 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
  					 const u32 *msg, u32 len);
  int intel_guc_error_capture_process_msg(struct intel_guc *guc,
  					 const u32 *msg, u32 len);
@@ -190,7 +190,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
-@@ -1043,7 +1043,7 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
+@@ -1079,7 +1079,7 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
  	return 0;
  }
  
@@ -199,7 +199,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  {
  	unsigned long flags;
  	struct ct_incoming_msg *request;
-@@ -1051,11 +1051,11 @@ static bool ct_process_incoming_requests(struct intel_guc_ct *ct)
+@@ -1087,11 +1087,11 @@ static bool ct_process_incoming_requests(struct intel_guc_ct *ct)
  	int err;
  
  	spin_lock_irqsave(&ct->requests.lock, flags);
@@ -213,7 +213,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  	spin_unlock_irqrestore(&ct->requests.lock, flags);
  
  	if (!request)
-@@ -1081,7 +1081,7 @@ static void ct_incoming_request_worker_func(struct work_struct *w)
+@@ -1117,7 +1117,7 @@ static void ct_incoming_request_worker_func(struct work_struct *w)
  		container_of(w, struct intel_guc_ct, requests.worker);
  	bool done;
  
@@ -222,7 +222,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  	if (!done)
  		queue_work(system_unbound_wq, &ct->requests.worker);
  }
-@@ -1102,14 +1102,30 @@ static int ct_handle_event(struct intel_guc_ct *ct, struct ct_incoming_msg *requ
+@@ -1138,14 +1138,30 @@ static int ct_handle_event(struct intel_guc_ct *ct, struct ct_incoming_msg *requ
  	switch (action) {
  	case INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_DONE:
  	case INTEL_GUC_ACTION_DEREGISTER_CONTEXT_DONE:
diff --git a/0001-INTEL_DII-drm-i915-pf-Allow-controlling-PF-functiona.patch b/0001-INTEL_DII-drm-i915-pf-Allow-controlling-PF-functiona.patch
index 8759706f5d46..029b1eb5b0ec 100644
--- a/0001-INTEL_DII-drm-i915-pf-Allow-controlling-PF-functiona.patch
+++ b/0001-INTEL_DII-drm-i915-pf-Allow-controlling-PF-functiona.patch
@@ -46,8 +46,8 @@ diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_para
  i915_param_named_unsafe(enable_guc, int, 0400,
  	"Enable GuC load for GuC submission and/or HuC load. "
  	"Required functionality can be selected using bitmask values. "
--	"(-1=auto, 0=disable [default], 1=GuC submission, 2=HuC load) ");
-+	"(-1=auto, 0=disable [default], 1=GuC submission, 2=HuC load, "
+-	"(-1=auto [default], 0=disable, 1=GuC submission, 2=HuC load)");
++	"(-1=auto [default], 0=disable, 1=GuC submission, 2=HuC load, "
 +	"4=SR-IOV PF)");
  
  i915_param_named(guc_log_level, int, 0400,
diff --git a/0001-INTEL_DII-drm-i915-pf-Support-for-VFPF-relay-message.patch b/0001-INTEL_DII-drm-i915-pf-Support-for-VFPF-relay-message.patch
index c025843412fb..012271345fd9 100644
--- a/0001-INTEL_DII-drm-i915-pf-Support-for-VFPF-relay-message.patch
+++ b/0001-INTEL_DII-drm-i915-pf-Support-for-VFPF-relay-message.patch
@@ -65,7 +65,7 @@ Acked-by: Piotr Piórkowski <piotr.piorkowski@intel.com> #16
 diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
 --- a/drivers/gpu/drm/i915/Makefile
 +++ b/drivers/gpu/drm/i915/Makefile
-@@ -215,6 +215,7 @@ iov-y += \
+@@ -214,6 +214,7 @@ iov-y += \
  	gt/iov/intel_iov.o \
  	gt/iov/intel_iov_debugfs.o \
  	gt/iov/intel_iov_provisioning.o \
@@ -996,15 +996,15 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_pf_abi.h b/drivers/gpu/d
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
-@@ -11,6 +11,7 @@
- #include "intel_guc_ct.h"
+@@ -12,6 +12,7 @@
  #include "intel_pagefault.h"
  #include "gt/intel_gt.h"
+ #include "gem/i915_gem_lmem.h"
 +#include "gt/iov/intel_iov_relay.h"
  
  enum {
  	CT_DEAD_ALIVE = 0,
-@@ -974,6 +975,8 @@ static int ct_handle_response(struct intel_guc_ct *ct, struct ct_incoming_msg *r
+@@ -1010,6 +1011,8 @@ static int ct_handle_response(struct intel_guc_ct *ct, struct ct_incoming_msg *r
  static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *request)
  {
  	struct intel_guc *guc = ct_to_guc(ct);
@@ -1013,7 +1013,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  	const u32 *hxg;
  	const u32 *payload;
  	u32 hxg_len, action, len;
-@@ -1028,6 +1031,9 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
+@@ -1064,6 +1067,9 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
  	case INTEL_GUC_ACTION_PAGE_FAULT_NOTIFICATION:
  		ret = intel_pagefault_process_page_fault_msg(guc, payload, len);
  		break;
diff --git a/0001-INTEL_DII-drm-i915-pf-Support-for-MMIO-relay-message.patch b/0001-INTEL_DII-drm-i915-pf-Support-for-MMIO-relay-message.patch
index 9943f42a022c..260c97cd5c8a 100644
--- a/0001-INTEL_DII-drm-i915-pf-Support-for-MMIO-relay-message.patch
+++ b/0001-INTEL_DII-drm-i915-pf-Support-for-MMIO-relay-message.patch
@@ -294,15 +294,15 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
-@@ -12,6 +12,7 @@
- #include "intel_pagefault.h"
+@@ -13,6 +13,7 @@
  #include "gt/intel_gt.h"
+ #include "gem/i915_gem_lmem.h"
  #include "gt/iov/intel_iov_relay.h"
 +#include "gt/iov/intel_iov_service.h"
  
  enum {
  	CT_DEAD_ALIVE = 0,
-@@ -1034,6 +1035,9 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
+@@ -1070,6 +1071,9 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
  	case GUC_ACTION_GUC2PF_RELAY_FROM_VF:
  		ret = intel_iov_relay_process_guc2pf(&iov->relay, hxg, hxg_len);
  		break;
diff --git a/0001-INTEL_DII-drm-i915-pf-Support-GuC-VF-state-notificat.patch b/0001-INTEL_DII-drm-i915-pf-Support-GuC-VF-state-notificat.patch
index c8393deac78c..2332cfd84f2b 100644
--- a/0001-INTEL_DII-drm-i915-pf-Support-GuC-VF-state-notificat.patch
+++ b/0001-INTEL_DII-drm-i915-pf-Support-GuC-VF-state-notificat.patch
@@ -27,7 +27,7 @@ Acked-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
 diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
 --- a/drivers/gpu/drm/i915/Makefile
 +++ b/drivers/gpu/drm/i915/Makefile
-@@ -217,6 +217,7 @@ iov-y += \
+@@ -216,6 +216,7 @@ iov-y += \
  	gt/iov/intel_iov_provisioning.o \
  	gt/iov/intel_iov_relay.o \
  	gt/iov/intel_iov_service.o \
@@ -181,15 +181,15 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_pf_abi.h b/drivers/gpu/d
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
-@@ -13,6 +13,7 @@
- #include "gt/intel_gt.h"
+@@ -14,6 +14,7 @@
+ #include "gem/i915_gem_lmem.h"
  #include "gt/iov/intel_iov_relay.h"
  #include "gt/iov/intel_iov_service.h"
 +#include "gt/iov/intel_iov_state.h"
  
  enum {
  	CT_DEAD_ALIVE = 0,
-@@ -1032,6 +1033,9 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
+@@ -1068,6 +1069,9 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
  	case INTEL_GUC_ACTION_PAGE_FAULT_NOTIFICATION:
  		ret = intel_pagefault_process_page_fault_msg(guc, payload, len);
  		break;
diff --git a/0001-INTEL_DII-drm-i915-pf-Adverse-events-notifications.patch b/0001-INTEL_DII-drm-i915-pf-Adverse-events-notifications.patch
index bbc8a05cb421..de2189322554 100644
--- a/0001-INTEL_DII-drm-i915-pf-Adverse-events-notifications.patch
+++ b/0001-INTEL_DII-drm-i915-pf-Adverse-events-notifications.patch
@@ -21,7 +21,7 @@ Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
 diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
 --- a/drivers/gpu/drm/i915/Makefile
 +++ b/drivers/gpu/drm/i915/Makefile
-@@ -214,6 +214,7 @@ iov-y += \
+@@ -213,6 +213,7 @@ iov-y += \
  	i915_sriov_sysfs.o \
  	gt/iov/intel_iov.o \
  	gt/iov/intel_iov_debugfs.o \
@@ -152,15 +152,15 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_pf_abi.h b/drivers/gpu/d
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
-@@ -11,6 +11,7 @@
- #include "intel_guc_ct.h"
+@@ -12,6 +12,7 @@
  #include "intel_pagefault.h"
  #include "gt/intel_gt.h"
+ #include "gem/i915_gem_lmem.h"
 +#include "gt/iov/intel_iov_event.h"
  #include "gt/iov/intel_iov_relay.h"
  #include "gt/iov/intel_iov_service.h"
  #include "gt/iov/intel_iov_state.h"
-@@ -1036,6 +1037,9 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
+@@ -1072,6 +1073,9 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
  	case GUC_ACTION_GUC2PF_VF_STATE_NOTIFY:
  		ret = intel_iov_state_process_guc2pf(iov, hxg, hxg_len);
  		break;
diff --git a/0001-INTEL_DII-drm-i915-pf-Process-VF-memory-CAT-fault-no.patch b/0001-INTEL_DII-drm-i915-pf-Process-VF-memory-CAT-fault-no.patch
index 849946344e63..3280dff26aa6 100644
--- a/0001-INTEL_DII-drm-i915-pf-Process-VF-memory-CAT-fault-no.patch
+++ b/0001-INTEL_DII-drm-i915-pf-Process-VF-memory-CAT-fault-no.patch
@@ -181,15 +181,15 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_pf_abi.h b/drivers/gpu/d
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
-@@ -12,6 +12,7 @@
- #include "intel_pagefault.h"
+@@ -13,6 +13,7 @@
  #include "gt/intel_gt.h"
+ #include "gem/i915_gem_lmem.h"
  #include "gt/iov/intel_iov_event.h"
 +#include "gt/iov/intel_iov_fault.h"
  #include "gt/iov/intel_iov_relay.h"
  #include "gt/iov/intel_iov_service.h"
  #include "gt/iov/intel_iov_state.h"
-@@ -1043,6 +1044,9 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
+@@ -1079,6 +1080,9 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
  	case GUC_ACTION_GUC2PF_RELAY_FROM_VF:
  		ret = intel_iov_relay_process_guc2pf(&iov->relay, hxg, hxg_len);
  		break;
diff --git a/0001-INTEL_DII-NOT_UPSTREAM-drm-i915-guc-Allow-to-control.patch b/0001-INTEL_DII-NOT_UPSTREAM-drm-i915-guc-Allow-to-control.patch
index 886b3d5614cd..dc28776e4398 100644
--- a/0001-INTEL_DII-NOT_UPSTREAM-drm-i915-guc-Allow-to-control.patch
+++ b/0001-INTEL_DII-NOT_UPSTREAM-drm-i915-guc-Allow-to-control.patch
@@ -21,7 +21,7 @@ Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
-@@ -232,6 +232,8 @@ static u32 guc_ctl_feature_flags(struct intel_guc *guc)
+@@ -220,6 +220,8 @@ static u32 guc_ctl_feature_flags(struct intel_guc *guc)
  	if (intel_uc_uses_guc_slpc(&gt->uc))
  		flags |= GUC_CTL_ENABLE_SLPC;
  
@@ -34,7 +34,7 @@ diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_para
 --- a/drivers/gpu/drm/i915/i915_params.c
 +++ b/drivers/gpu/drm/i915/i915_params.c
 @@ -172,6 +172,9 @@ i915_param_named_unsafe(enable_guc, int, 0400,
- 	"(-1=auto, 0=disable [default], 1=GuC submission, 2=HuC load, "
+ 	"(-1=auto [default], 0=disable, 1=GuC submission, 2=HuC load, "
  	"4=SR-IOV PF)");
  
 +i915_param_named_unsafe(guc_feature_flags, uint, 0400,
diff --git a/0001-INTEL_DII-drm-i915-vf-Ignore-GuC-CT-event-from-memIR.patch b/0001-INTEL_DII-drm-i915-vf-Ignore-GuC-CT-event-from-memIR.patch
index 3f813040a9d8..325172357ee8 100644
--- a/0001-INTEL_DII-drm-i915-vf-Ignore-GuC-CT-event-from-memIR.patch
+++ b/0001-INTEL_DII-drm-i915-vf-Ignore-GuC-CT-event-from-memIR.patch
@@ -29,7 +29,7 @@ Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
-@@ -1255,7 +1255,15 @@ static void ct_receive_tasklet_func(unsigned long data)
+@@ -1295,7 +1295,15 @@ static void ct_receive_tasklet_func(struct tasklet_struct *t)
  void intel_guc_ct_event_handler(struct intel_guc_ct *ct)
  {
  	if (unlikely(!ct->enabled)) {
diff --git a/0001-INTEL_DII-FIXME-drm-i915-gt-Fake-interrupts-for-Wa-1.patch b/0001-INTEL_DII-FIXME-drm-i915-gt-Fake-interrupts-for-Wa-1.patch
index 1b9516bda0d7..bd15730875fe 100644
--- a/0001-INTEL_DII-FIXME-drm-i915-gt-Fake-interrupts-for-Wa-1.patch
+++ b/0001-INTEL_DII-FIXME-drm-i915-gt-Fake-interrupts-for-Wa-1.patch
@@ -41,14 +41,14 @@ Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
  drivers/gpu/drm/i915/gt/intel_gt_debugfs.c    | 52 +++++++++++++
  drivers/gpu/drm/i915/gt/intel_gt_irq.c        | 35 +++++++++
  drivers/gpu/drm/i915/gt/intel_gt_types.h      |  9 +++
- drivers/gpu/drm/i915/gt/uc/intel_guc.c        | 66 +++++++++++++++-
+ drivers/gpu/drm/i915/gt/uc/intel_guc.c        | 57 +++++++++++++-
  drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  2 +
- drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 10 ++-
+ drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  9 ++-
  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 76 ++++++++++++++-----
  drivers/gpu/drm/i915/i915_drv.c               | 48 ++++++++++++
  drivers/gpu/drm/i915/i915_params.c            |  3 +
  drivers/gpu/drm/i915/i915_params.h            |  1 +
- 11 files changed, 283 insertions(+), 21 deletions(-)
+ 11 files changed, 273 insertions(+), 21 deletions(-)
 
 diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
 --- a/drivers/gpu/drm/i915/gt/intel_gt.h
@@ -197,7 +197,7 @@ diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
-@@ -143,6 +143,64 @@ static void gen11_reset_guc_interrupts(struct intel_guc *guc)
+@@ -139,6 +139,55 @@ static void gen11_reset_guc_interrupts(struct intel_guc *guc)
  	spin_unlock_irq(&gt->irq_lock);
  }
  
@@ -223,13 +223,10 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc
 +	struct intel_gt *gt = guc_to_gt(guc);
 +
 +	spin_lock_irq(&gt->irq_lock);
-+	if (!guc->interrupts.enabled) {
-+		WARN_ON_ONCE(gen11_gt_reset_one_iir(gt, 0, GEN11_GUC));
++	WARN_ON_ONCE(gen11_gt_reset_one_iir(gt, 0, GEN11_GUC));
 +
-+		/* FIXME: Connect timer to GT PM */
-+		fake_int_timer_start(gt);
-+		guc->interrupts.enabled = true;
-+	}
++	/* FIXME: Connect timer to GT PM */
++	fake_int_timer_start(gt);
 +	spin_unlock_irq(&gt->irq_lock);
 +}
 +
@@ -237,11 +234,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc
 +{
 +	struct intel_gt *gt = guc_to_gt(guc);
 +
-+	if (!guc->interrupts.enabled)
-+		return;
-+
 +	spin_lock_irq(&gt->irq_lock);
-+	guc->interrupts.enabled = false;
 +
 +	fake_int_timer_stop(gt);
 +
@@ -253,8 +246,6 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc
 +
 +void intel_guc_init_fake_interrupts(struct intel_guc *guc)
 +{
-+	GEM_BUG_ON(guc->interrupts.enabled);
-+
 +	guc->interrupts.enable = gen11_enable_fake_interrupts;
 +	guc->interrupts.disable = gen11_disable_fake_interrupts;
 +}
@@ -262,7 +253,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc
  static void gen11_enable_guc_interrupts(struct intel_guc *guc)
  {
  	struct intel_gt *gt = guc_to_gt(guc);
-@@ -182,7 +240,8 @@ static void gen11_disable_guc_interrupts(struct intel_guc *guc)
+@@ -170,7 +219,8 @@ static void gen11_disable_guc_interrupts(struct intel_guc *guc)
  
  void intel_guc_init_early(struct intel_guc *guc)
  {
@@ -272,7 +263,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc
  
  	intel_uc_fw_init_early(&guc->fw, INTEL_UC_FW_TYPE_GUC);
  	intel_guc_ct_init_early(&guc->ct);
-@@ -201,7 +260,6 @@ void intel_guc_init_early(struct intel_guc *guc)
+@@ -189,7 +239,6 @@ void intel_guc_init_early(struct intel_guc *guc)
  		guc->send_regs.base =
  			i915_mmio_reg_offset(GEN11_SOFT_SCRATCH(0));
  		guc->send_regs.count = GEN11_SOFT_SCRATCH_COUNT;
@@ -280,7 +271,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc
  	} else {
  		guc->notify_reg = GUC_SEND_INTERRUPT;
  		guc->interrupts.reset = gen9_reset_guc_interrupts;
-@@ -1157,6 +1215,8 @@ static int guc_send_invalidate_tlb(struct intel_guc *guc, u32 *action, u32 size)
+@@ -1145,6 +1194,8 @@ static int guc_send_invalidate_tlb(struct intel_guc *guc, u32 *action, u32 size)
  		return err;
  	}
  
@@ -289,7 +280,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc
  #define OUTSTANDING_GUC_TIMEOUT_PERIOD  (HZ / 10)
  	timeout = OUTSTANDING_GUC_TIMEOUT_PERIOD;
  	for (;;) {
-@@ -1181,6 +1241,8 @@ static int guc_send_invalidate_tlb(struct intel_guc *guc, u32 *action, u32 size)
+@@ -1169,6 +1220,8 @@ static int guc_send_invalidate_tlb(struct intel_guc *guc, u32 *action, u32 size)
  	if (timeout == -ETIME)
  		drm_err(&guc_to_gt(guc)->i915->drm, "tlb invalidation response timed out for seqno %u\n", seqno);
  
@@ -301,7 +292,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
-@@ -362,4 +362,6 @@ void intel_guc_load_status(struct intel_guc *guc, struct drm_printer *p);
+@@ -355,4 +355,6 @@ void intel_guc_load_status(struct intel_guc *guc, struct drm_printer *p);
  
  void intel_guc_dump_time_info(struct intel_guc *guc, struct drm_printer *p);
  
@@ -311,7 +302,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
-@@ -500,6 +500,7 @@ static int ct_write(struct intel_guc_ct *ct,
+@@ -516,6 +516,7 @@ static int ct_write(struct intel_guc_ct *ct,
  
  /**
   * wait_for_ct_request_update - Wait for CT request state update.
@@ -319,7 +310,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
   * @req:	pointer to pending request
   * @status:	placeholder for status
   *
-@@ -512,7 +513,8 @@ static int ct_write(struct intel_guc_ct *ct,
+@@ -528,7 +529,8 @@ static int ct_write(struct intel_guc_ct *ct,
   * *	0 response received (status is valid)
   * *	-ETIMEDOUT no response within hardcoded timeout
   */
@@ -327,18 +318,17 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
 +static int wait_for_ct_request_update(struct intel_guc_ct *ct,
 +				      struct ct_request *req, u32 *status)
  {
- 	long timeout;
  	int err;
-@@ -527,6 +529,8 @@ static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
- 	 */
- 	timeout = max(10, CONFIG_DRM_I915_HEARTBEAT_INTERVAL);
  
+@@ -544,6 +546,7 @@ static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
+ #define done \
+ 	(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, READ_ONCE(req->status)) == \
+ 	 GUC_HXG_ORIGIN_GUC)
 +	intel_boost_fake_int_timer(ct_to_gt(ct), true);
-+
- #define done (FIELD_GET(GUC_HXG_MSG_0_ORIGIN, READ_ONCE(req->status)) == GUC_HXG_ORIGIN_GUC)
- 	err = wait_for_us(done, 10);
+ 	err = wait_for_us(done, GUC_CTB_RESPONSE_TIMEOUT_SHORT_MS);
  	if (err)
-@@ -536,6 +540,8 @@ static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
+ 		err = wait_for(done, GUC_CTB_RESPONSE_TIMEOUT_LONG_MS);
+@@ -552,6 +555,8 @@ static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
  	if (unlikely(err))
  		DRM_ERROR("CT: fence %u err %d\n", req->fence, err);
  
@@ -347,7 +337,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  	*status = req->status;
  	return err;
  }
-@@ -722,7 +728,7 @@ static int ct_send(struct intel_guc_ct *ct,
+@@ -752,7 +757,7 @@ static int ct_send(struct intel_guc_ct *ct,
  
  	intel_guc_notify(ct_to_guc(ct));
  
diff --git a/0001-INTEL_DII-drm-i915-guc-Add-function-engine-disable-G.patch b/0001-INTEL_DII-drm-i915-guc-Add-function-engine-disable-G.patch
index 8ff18d477a73..52d63ed25a60 100644
--- a/0001-INTEL_DII-drm-i915-guc-Add-function-engine-disable-G.patch
+++ b/0001-INTEL_DII-drm-i915-guc-Add-function-engine-disable-G.patch
@@ -124,9 +124,9 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc
 +	int sched_enable_ref;
 +
  	struct {
- 		bool enabled;
  		void (*reset)(struct intel_guc *guc);
-@@ -356,6 +359,8 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
+ 		void (*enable)(struct intel_guc *guc);
+@@ -349,6 +352,8 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
  int intel_guc_error_capture_process_msg(struct intel_guc *guc,
  					 const u32 *msg, u32 len);
  void intel_guc_tlb_invalidation_done_process_msg(struct intel_guc *guc, u32 seqno);
@@ -138,7 +138,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
-@@ -1018,6 +1018,13 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
+@@ -1053,6 +1053,13 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
  			CT_ERROR(ct, "schedule context failed %x %*ph\n",
  				  action, 4 * len, payload);
  		break;
@@ -152,7 +152,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  	case INTEL_GUC_ACTION_CONTEXT_RESET_NOTIFICATION:
  		ret = intel_guc_context_reset_process_msg(guc, payload, len);
  		if (unlikely(ret))
-@@ -1132,6 +1139,7 @@ static int ct_handle_event(struct intel_guc_ct *ct, struct ct_incoming_msg *requ
+@@ -1167,6 +1174,7 @@ static int ct_handle_event(struct intel_guc_ct *ct, struct ct_incoming_msg *requ
  	 * circular dependency if the space was returned there.
  	 */
  	switch (action) {
diff --git a/0001-INTEL_DII-drm-i915-mtl-Use-primary-GT-s-irq-lock-for.patch b/0001-INTEL_DII-drm-i915-mtl-Use-primary-GT-s-irq-lock-for.patch
index 0bd765d33cb2..4ed47372e80f 100644
--- a/0001-INTEL_DII-drm-i915-mtl-Use-primary-GT-s-irq-lock-for.patch
+++ b/0001-INTEL_DII-drm-i915-mtl-Use-primary-GT-s-irq-lock-for.patch
@@ -464,30 +464,26 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc
  }
  
  static void gen9_enable_guc_interrupts(struct intel_guc *guc)
-@@ -107,14 +107,14 @@ static void gen9_enable_guc_interrupts(struct intel_guc *guc)
+@@ -107,11 +107,11 @@ static void gen9_enable_guc_interrupts(struct intel_guc *guc)
  
  	assert_rpm_wakelock_held(&gt->i915->runtime_pm);
  
 -	spin_lock_irq(&gt->irq_lock);
 +	spin_lock_irq(gt->irq_lock);
- 	if (!guc->interrupts.enabled) {
- 		WARN_ON_ONCE(intel_uncore_read(gt->uncore, GEN8_GT_IIR(2)) &
- 			     gt->pm_guc_events);
- 		guc->interrupts.enabled = true;
- 		gen6_gt_pm_enable_irq(gt, gt->pm_guc_events);
- 	}
+ 	WARN_ON_ONCE(intel_uncore_read(gt->uncore, GEN8_GT_IIR(2)) &
+ 		     gt->pm_guc_events);
+ 	gen6_gt_pm_enable_irq(gt, gt->pm_guc_events);
 -	spin_unlock_irq(&gt->irq_lock);
 +	spin_unlock_irq(gt->irq_lock);
  }
  
  static void gen9_disable_guc_interrupts(struct intel_guc *guc)
-@@ -123,12 +123,12 @@ static void gen9_disable_guc_interrupts(struct intel_guc *guc)
+@@ -120,11 +120,11 @@ static void gen9_disable_guc_interrupts(struct intel_guc *guc)
  
  	assert_rpm_wakelock_held(&gt->i915->runtime_pm);
  
 -	spin_lock_irq(&gt->irq_lock);
 +	spin_lock_irq(gt->irq_lock);
- 	guc->interrupts.enabled = false;
  
  	gen6_gt_pm_disable_irq(gt, gt->pm_guc_events);
  
@@ -496,7 +492,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc
  	intel_synchronize_irq(gt->i915);
  
  	gen9_reset_guc_interrupts(guc);
-@@ -138,9 +138,9 @@ static void gen11_reset_guc_interrupts(struct intel_guc *guc)
+@@ -134,9 +134,9 @@ static void gen11_reset_guc_interrupts(struct intel_guc *guc)
  {
  	struct intel_gt *gt = guc_to_gt(guc);
  
@@ -508,31 +504,26 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc
  }
  
  /* Wa:16014207253 */
-@@ -164,7 +164,7 @@ static void gen11_enable_fake_interrupts(struct intel_guc *guc)
+@@ -160,23 +160,23 @@ static void gen11_enable_fake_interrupts(struct intel_guc *guc)
  {
  	struct intel_gt *gt = guc_to_gt(guc);
  
 -	spin_lock_irq(&gt->irq_lock);
 +	spin_lock_irq(gt->irq_lock);
- 	if (!guc->interrupts.enabled) {
- 		WARN_ON_ONCE(gen11_gt_reset_one_iir(gt, 0, GEN11_GUC));
+ 	WARN_ON_ONCE(gen11_gt_reset_one_iir(gt, 0, GEN11_GUC));
  
-@@ -172,7 +172,7 @@ static void gen11_enable_fake_interrupts(struct intel_guc *guc)
- 		fake_int_timer_start(gt);
- 		guc->interrupts.enabled = true;
- 	}
+ 	/* FIXME: Connect timer to GT PM */
+ 	fake_int_timer_start(gt);
 -	spin_unlock_irq(&gt->irq_lock);
 +	spin_unlock_irq(gt->irq_lock);
  }
  
  static void gen11_disable_fake_interrupts(struct intel_guc *guc)
-@@ -182,12 +182,12 @@ static void gen11_disable_fake_interrupts(struct intel_guc *guc)
- 	if (!guc->interrupts.enabled)
- 		return;
+ {
+ 	struct intel_gt *gt = guc_to_gt(guc);
  
 -	spin_lock_irq(&gt->irq_lock);
 +	spin_lock_irq(gt->irq_lock);
- 	guc->interrupts.enabled = false;
  
  	fake_int_timer_stop(gt);
  
@@ -541,31 +532,27 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc
  	intel_synchronize_irq(gt->i915);
  
  	gen11_reset_guc_interrupts(guc);
-@@ -205,7 +205,7 @@ static void gen11_enable_guc_interrupts(struct intel_guc *guc)
- {
+@@ -193,25 +193,25 @@ static void gen11_enable_guc_interrupts(struct intel_guc *guc)
  	struct intel_gt *gt = guc_to_gt(guc);
+ 	u32 events = REG_FIELD_PREP(ENGINE1_MASK, GUC_INTR_GUC2HOST);
  
 -	spin_lock_irq(&gt->irq_lock);
 +	spin_lock_irq(gt->irq_lock);
- 	if (!guc->interrupts.enabled) {
- 		u32 events = REG_FIELD_PREP(ENGINE1_MASK, GUC_INTR_GUC2HOST);
- 
-@@ -216,7 +216,7 @@ static void gen11_enable_guc_interrupts(struct intel_guc *guc)
- 				   GEN11_GUC_SG_INTR_MASK, ~events);
- 		guc->interrupts.enabled = true;
- 	}
+ 	WARN_ON_ONCE(gen11_gt_reset_one_iir(gt, 0, GEN11_GUC));
+ 	intel_uncore_write(gt->uncore,
+ 			   GEN11_GUC_SG_INTR_ENABLE, events);
+ 	intel_uncore_write(gt->uncore,
+ 			   GEN11_GUC_SG_INTR_MASK, ~events);
 -	spin_unlock_irq(&gt->irq_lock);
 +	spin_unlock_irq(gt->irq_lock);
  }
  
  static void gen11_disable_guc_interrupts(struct intel_guc *guc)
-@@ -226,13 +226,13 @@ static void gen11_disable_guc_interrupts(struct intel_guc *guc)
- 	if (!guc->interrupts.enabled)
- 		return;
+ {
+ 	struct intel_gt *gt = guc_to_gt(guc);
  
 -	spin_lock_irq(&gt->irq_lock);
 +	spin_lock_irq(gt->irq_lock);
- 	guc->interrupts.enabled = false;
  
  	intel_uncore_write(gt->uncore, GEN11_GUC_SG_INTR_MASK, ~0);
  	intel_uncore_write(gt->uncore, GEN11_GUC_SG_INTR_ENABLE, 0);
@@ -578,7 +565,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
-@@ -1332,8 +1332,8 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
+@@ -1331,8 +1331,8 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
  	guc->interrupts.disable(guc);
  
  	/* Flush IRQ handler */
@@ -589,7 +576,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm
  
  	guc_flush_submissions(guc);
  	guc_flush_destroyed_contexts(guc);
-@@ -4142,7 +4142,7 @@ static void guc_fake_irq_enable(struct intel_engine_cs *engine)
+@@ -4141,7 +4141,7 @@ static void guc_fake_irq_enable(struct intel_engine_cs *engine)
  {
  	struct intel_gt *gt = engine->gt;
  
@@ -598,7 +585,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm
  
  	if (!gt->fake_int.int_enabled) {
  		gt->fake_int.int_enabled = true;
-@@ -4154,7 +4154,7 @@ static void guc_fake_irq_disable(struct intel_engine_cs *engine)
+@@ -4153,7 +4153,7 @@ static void guc_fake_irq_disable(struct intel_engine_cs *engine)
  {
  	struct intel_gt *gt = engine->gt;
  
@@ -625,7 +612,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/
 diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
 --- a/drivers/gpu/drm/i915/i915_drv.c
 +++ b/drivers/gpu/drm/i915/i915_drv.c
-@@ -593,7 +593,9 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv,
+@@ -594,7 +594,9 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv,
  
  	intel_wopcm_init_early(&dev_priv->wopcm);
  
diff --git a/0001-INTEL_DII-drm-i915-guc-handle-interrupts-from-media-.patch b/0001-INTEL_DII-drm-i915-guc-handle-interrupts-from-media-.patch
index c31b6a4b559b..a558096d4a18 100644
--- a/0001-INTEL_DII-drm-i915-guc-handle-interrupts-from-media-.patch
+++ b/0001-INTEL_DII-drm-i915-guc-handle-interrupts-from-media-.patch
@@ -12,6 +12,7 @@ interrupts or not.
 
 v2: correctly handle non-irq CT handling (Alan), rebase on proper media
 gt irq_lock implementation
+v3: Add guc->interrupts.enabled back in (Matthew Brost)
 
 Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
 Cc: Matt Roper <matthew.d.roper@intel.com>
@@ -20,13 +21,14 @@ Cc: John Harrison <John.C.Harrison@Intel.com>
 Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
 Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
 ---
- drivers/gpu/drm/i915/gt/intel_gt_irq.c        | 25 +++++++++++++++----
- drivers/gpu/drm/i915/gt/uc/intel_guc.c        | 22 ++++++++--------
- drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  4 ++-
- .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 11 ++++----
+ drivers/gpu/drm/i915/gt/intel_gt_irq.c        | 25 ++++++++++++---
+ drivers/gpu/drm/i915/gt/uc/intel_guc.c        | 32 +++++++++++--------
+ drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  5 ++-
+ .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 11 ++++---
+ drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  8 +++--
  drivers/gpu/drm/i915/i915_drv.c               |  2 +-
  drivers/gpu/drm/i915/i915_reg.h               |  2 ++
- 6 files changed, 42 insertions(+), 24 deletions(-)
+ 7 files changed, 58 insertions(+), 27 deletions(-)
 
 diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
 --- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
@@ -95,7 +97,23 @@ diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/in
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
-@@ -134,12 +134,20 @@ static void gen9_disable_guc_interrupts(struct intel_guc *guc)
+@@ -106,6 +106,7 @@ static void gen9_enable_guc_interrupts(struct intel_guc *guc)
+ 	struct intel_gt *gt = guc_to_gt(guc);
+ 
+ 	assert_rpm_wakelock_held(&gt->i915->runtime_pm);
++	guc->interrupts.enabled = true;
+ 
+ 	spin_lock_irq(gt->irq_lock);
+ 	WARN_ON_ONCE(intel_uncore_read(gt->uncore, GEN8_GT_IIR(2)) &
+@@ -119,6 +120,7 @@ static void gen9_disable_guc_interrupts(struct intel_guc *guc)
+ 	struct intel_gt *gt = guc_to_gt(guc);
+ 
+ 	assert_rpm_wakelock_held(&gt->i915->runtime_pm);
++	guc->interrupts.enabled = false;
+ 
+ 	spin_lock_irq(gt->irq_lock);
+ 
+@@ -130,12 +132,20 @@ static void gen9_disable_guc_interrupts(struct intel_guc *guc)
  	gen9_reset_guc_interrupts(guc);
  }
  
@@ -117,36 +135,68 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc
  	spin_unlock_irq(gt->irq_lock);
  }
  
-@@ -207,13 +215,7 @@ static void gen11_enable_guc_interrupts(struct intel_guc *guc)
+@@ -160,6 +170,8 @@ static void gen11_enable_fake_interrupts(struct intel_guc *guc)
+ {
+ 	struct intel_gt *gt = guc_to_gt(guc);
  
++	guc->interrupts.enabled = true;
++
  	spin_lock_irq(gt->irq_lock);
- 	if (!guc->interrupts.enabled) {
--		u32 events = REG_FIELD_PREP(ENGINE1_MASK, GUC_INTR_GUC2HOST);
--
--		WARN_ON_ONCE(gen11_gt_reset_one_iir(gt, 0, GEN11_GUC));
--		intel_uncore_write(gt->uncore,
--				   GEN11_GUC_SG_INTR_ENABLE, events);
--		intel_uncore_write(gt->uncore,
--				   GEN11_GUC_SG_INTR_MASK, ~events);
-+		__gen11_reset_guc_interrupts(gt);
- 		guc->interrupts.enabled = true;
- 	}
- 	spin_unlock_irq(gt->irq_lock);
-@@ -228,10 +230,6 @@ static void gen11_disable_guc_interrupts(struct intel_guc *guc)
+ 	WARN_ON_ONCE(gen11_gt_reset_one_iir(gt, 0, GEN11_GUC));
+ 
+@@ -172,6 +184,8 @@ static void gen11_disable_fake_interrupts(struct intel_guc *guc)
+ {
+ 	struct intel_gt *gt = guc_to_gt(guc);
  
++	guc->interrupts.enabled = false;
++
  	spin_lock_irq(gt->irq_lock);
- 	guc->interrupts.enabled = false;
+ 
+ 	fake_int_timer_stop(gt);
+@@ -191,14 +205,11 @@ void intel_guc_init_fake_interrupts(struct intel_guc *guc)
+ static void gen11_enable_guc_interrupts(struct intel_guc *guc)
+ {
+ 	struct intel_gt *gt = guc_to_gt(guc);
+-	u32 events = REG_FIELD_PREP(ENGINE1_MASK, GUC_INTR_GUC2HOST);
++
++	guc->interrupts.enabled = true;
+ 
+ 	spin_lock_irq(gt->irq_lock);
+-	WARN_ON_ONCE(gen11_gt_reset_one_iir(gt, 0, GEN11_GUC));
+-	intel_uncore_write(gt->uncore,
+-			   GEN11_GUC_SG_INTR_ENABLE, events);
+-	intel_uncore_write(gt->uncore,
+-			   GEN11_GUC_SG_INTR_MASK, ~events);
++	__gen11_reset_guc_interrupts(gt);
+ 	spin_unlock_irq(gt->irq_lock);
+ }
+ 
+@@ -206,12 +217,7 @@ static void gen11_disable_guc_interrupts(struct intel_guc *guc)
+ {
+ 	struct intel_gt *gt = guc_to_gt(guc);
+ 
+-	spin_lock_irq(gt->irq_lock);
 -
 -	intel_uncore_write(gt->uncore, GEN11_GUC_SG_INTR_MASK, ~0);
 -	intel_uncore_write(gt->uncore, GEN11_GUC_SG_INTR_ENABLE, 0);
 -
- 	spin_unlock_irq(gt->irq_lock);
+-	spin_unlock_irq(gt->irq_lock);
++	guc->interrupts.enabled = false;
  	intel_synchronize_irq(gt->i915);
  
+ 	gen11_reset_guc_interrupts(guc);
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
-@@ -201,9 +201,11 @@ static inline int intel_guc_send_busy_loop(struct intel_guc* guc,
+@@ -61,6 +61,7 @@ struct intel_guc {
+ 	int sched_enable_ref;
+ 
+ 	struct {
++		bool enabled;
+ 		void (*reset)(struct intel_guc *guc);
+ 		void (*enable)(struct intel_guc *guc);
+ 		void (*disable)(struct intel_guc *guc);
+@@ -194,9 +195,11 @@ static inline int intel_guc_send_busy_loop(struct intel_guc* guc,
  	return err;
  }
  
@@ -162,7 +212,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
-@@ -1339,13 +1339,14 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
+@@ -1338,13 +1338,14 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
  	guc_flush_destroyed_contexts(guc);
  
  	/*
@@ -182,10 +232,37 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm
  #define wait_for_reset(guc, wait_var) \
  		intel_guc_wait_for_pending_msg(guc, wait_var, false, (HZ / 20))
  		do {
+diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
++++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+@@ -779,8 +779,10 @@ void intel_uc_runtime_suspend(struct intel_uc *uc)
+ {
+ 	struct intel_guc *guc = &uc->guc;
+ 
+-	if (!intel_guc_is_ready(guc))
++	if (!intel_guc_is_ready(guc)) {
++		guc->interrupts.enabled = false;
+ 		return;
++	}
+ 
+ 	/*
+ 	 * Wait for any outstanding CTB before tearing down communication /w the
+@@ -800,8 +802,10 @@ void intel_uc_suspend(struct intel_uc *uc)
+ 	intel_wakeref_t wakeref;
+ 	int err;
+ 
+-	if (!intel_guc_is_ready(guc))
++	if (!intel_guc_is_ready(guc)) {
++		guc->interrupts.enabled = false;
+ 		return;
++	}
+ 
+ 	with_intel_runtime_pm(&uc_to_gt(uc)->i915->runtime_pm, wakeref) {
+ 		err = intel_guc_suspend(guc);
 diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
 --- a/drivers/gpu/drm/i915/i915_drv.c
 +++ b/drivers/gpu/drm/i915/i915_drv.c
-@@ -764,7 +764,7 @@ static enum hrtimer_restart fake_int_timer_callback(struct hrtimer *hrtimer)
+@@ -765,7 +765,7 @@ static enum hrtimer_restart fake_int_timer_callback(struct hrtimer *hrtimer)
  	enum intel_engine_id id;
  
  	if (guc->ct.enabled)
diff --git a/0001-INTEL_DII-drm-i915-sim-Adjust-timeouts-for-presilico.patch b/0001-INTEL_DII-drm-i915-sim-Adjust-timeouts-for-presilico.patch
index ebb85ac8c8d7..7e5237457c04 100644
--- a/0001-INTEL_DII-drm-i915-sim-Adjust-timeouts-for-presilico.patch
+++ b/0001-INTEL_DII-drm-i915-sim-Adjust-timeouts-for-presilico.patch
@@ -83,7 +83,7 @@ Acked-by: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
  drivers/gpu/drm/i915/gt/selftest_execlists.c  |  2 +-
  drivers/gpu/drm/i915/gt/selftest_timeline.c   |  4 +--
  drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  4 +--
- drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  8 +++--
+ drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  6 ++--
  drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     |  4 ++-
  .../gpu/drm/i915/gt/uc/selftest_doorbells.c   |  6 ++--
  drivers/gpu/drm/i915/i915_debugfs.c           |  3 +-
@@ -95,7 +95,7 @@ Acked-by: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
  drivers/gpu/drm/i915/selftests/i915_request.c |  8 +++--
  drivers/gpu/drm/i915/selftests/igt_spinner.c  |  2 +-
  .../drm/i915/selftests/intel_semaphore_hw.c   |  3 +-
- 21 files changed, 121 insertions(+), 47 deletions(-)
+ 21 files changed, 119 insertions(+), 47 deletions(-)
 
 diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
 --- a/drivers/gpu/drm/i915/display/intel_de.h
@@ -245,7 +245,7 @@ diff --git a/drivers/gpu/drm/i915/gt/selftest_timeline.c b/drivers/gpu/drm/i915/
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
-@@ -868,7 +868,7 @@ int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
+@@ -855,7 +855,7 @@ int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
  		FIELD_GET(GUC_HXG_MSG_0_TYPE, header) != GUC_HXG_TYPE_NO_RESPONSE_BUSY; })
  
  busy_loop:
@@ -254,7 +254,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc
  		if (unlikely(ret && --loop)) {
  			drm_dbg(&i915->drm, "mmio request %#x: still busy, countdown %u\n",
  				request[0], loop);
-@@ -1322,7 +1322,7 @@ static int guc_send_invalidate_tlb(struct intel_guc *guc, u32 *action, u32 size)
+@@ -1309,7 +1309,7 @@ static int guc_send_invalidate_tlb(struct intel_guc *guc, u32 *action, u32 size)
  	intel_boost_fake_int_timer(guc_to_gt(guc), true);
  
  #define OUTSTANDING_GUC_TIMEOUT_PERIOD  (HZ / 10)
@@ -266,12 +266,12 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
-@@ -538,11 +538,11 @@ static int wait_for_ct_request_update(struct intel_guc_ct *ct,
- #define done (FIELD_GET(GUC_HXG_MSG_0_ORIGIN, READ_ONCE(req->status)) == GUC_HXG_ORIGIN_GUC)
- 	err = wait_for_us(done, 10);
+@@ -554,11 +554,11 @@ static int wait_for_ct_request_update(struct intel_guc_ct *ct,
+ 	intel_boost_fake_int_timer(ct_to_gt(ct), true);
+ 	err = wait_for_us(done, GUC_CTB_RESPONSE_TIMEOUT_SHORT_MS);
  	if (err)
--		err = wait_for(done, timeout);
-+		err = wait_for(done, timeout * PRESI_GET_MULTIPLIER(1));
+-		err = wait_for(done, GUC_CTB_RESPONSE_TIMEOUT_LONG_MS);
++		err = wait_for(done, GUC_CTB_RESPONSE_TIMEOUT_LONG_MS * PRESI_GET_MULTIPLIER(1));
  #undef done
  
  	if (unlikely(err))
@@ -280,20 +280,15 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  
  	intel_boost_fake_int_timer(ct_to_gt(ct), false);
  
-@@ -550,10 +550,12 @@ static int wait_for_ct_request_update(struct intel_guc_ct *ct,
- 	return err;
- }
- 
-+#define PRESI_CTB_TIMEOUT \
-+	(((s64)MAX_US_STALL_CTB) * PRESI_GET_MULTIPLIER(MAX_US_STALL_CTB))
+@@ -569,7 +569,7 @@ static int wait_for_ct_request_update(struct intel_guc_ct *ct,
+ #define GUC_CTB_TIMEOUT_MS	1500
  static inline bool ct_deadlocked(struct intel_guc_ct *ct)
  {
- 	bool ret = ktime_us_delta(ktime_get(), ct->stall_time) >
--		MAX_US_STALL_CTB;
-+		PRESI_CTB_TIMEOUT;
+-	long timeout = GUC_CTB_TIMEOUT_MS;
++	long timeout = GUC_CTB_TIMEOUT_MS * PRESI_GET_MULTIPLIER(1);
+ 	bool ret = ktime_ms_delta(ktime_get(), ct->stall_time) > timeout;
  
  	if (unlikely(ret)) {
- 		/*
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
@@ -334,7 +329,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_doorbells.c b/drivers/gpu/drm/i
 diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
 --- a/drivers/gpu/drm/i915/i915_debugfs.c
 +++ b/drivers/gpu/drm/i915/i915_debugfs.c
-@@ -789,7 +789,8 @@ gt_drop_caches(struct intel_gt *gt, u64 val)
+@@ -772,7 +772,8 @@ gt_drop_caches(struct intel_gt *gt, u64 val)
  		intel_gt_retire_requests(gt);
  
  	if (val & DROP_RESET_ACTIVE &&
diff --git a/0001-INTEL_DII-drm-i915-guc-Remove-sample_forcewake-h2g-a.patch b/0001-drm-i915-guc-Remove-sample_forcewake-h2g-action.patch
similarity index 82%
rename from 0001-INTEL_DII-drm-i915-guc-Remove-sample_forcewake-h2g-a.patch
rename to 0001-drm-i915-guc-Remove-sample_forcewake-h2g-action.patch
index 04595295e11e..deaf6fa4a3dd 100644
--- a/0001-INTEL_DII-drm-i915-guc-Remove-sample_forcewake-h2g-a.patch
+++ b/0001-drm-i915-guc-Remove-sample_forcewake-h2g-action.patch
@@ -1,16 +1,21 @@
 From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Rodrigo Vivi <rodrigo.vivi@intel.com>
-Date: Fri, 16 Oct 2020 12:20:42 -0400
-Subject: [PATCH] INTEL_DII: drm/i915/guc: Remove sample_forcewake h2g action
+Date: Wed, 2 Jun 2021 22:16:14 -0700
+Subject: [PATCH] drm/i915/guc: Remove sample_forcewake h2g action
 
 This action is no-op in the GuC side for a few versions already
 and it is getting entirely removed soon, in an upcoming version.
 
 Time to remove before we face communication issues.
 
-Cc:  Vinay Belgaumkar <vinay.belgaumkar@intel.com>
+Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
 Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
-Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
+Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+Acked-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Link: https://patchwork.freedesktop.org/patch/msgid/20210603051630.2635-5-matthew.brost@intel.com
+(cherry picked from commit 28bef5bc559ab211ef3306a850c201190518c961)
 ---
  drivers/gpu/drm/i915/gt/uc/intel_guc.c      | 16 ----------------
  drivers/gpu/drm/i915/gt/uc/intel_guc.h      |  1 -
@@ -21,7 +26,7 @@ Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
-@@ -470,22 +470,6 @@ int intel_guc_to_host_process_recv_msg(struct intel_guc *guc,
+@@ -469,22 +469,6 @@ int intel_guc_to_host_process_recv_msg(struct intel_guc *guc,
  	return 0;
  }
  
@@ -58,7 +63,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
-@@ -342,9 +342,6 @@ struct guc_ct_buffer_desc {
+@@ -302,9 +302,6 @@ struct guc_ct_buffer_desc {
  #define GUC_CT_MSG_ACTION_SHIFT			16
  #define GUC_CT_MSG_ACTION_MASK			0xFFFF
  
@@ -68,7 +73,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/
  #define GUC_POWER_UNSPECIFIED	0
  #define GUC_POWER_D0		1
  #define GUC_POWER_D1		2
-@@ -598,7 +595,6 @@ enum intel_guc_action {
+@@ -558,7 +555,6 @@ enum intel_guc_action {
  	INTEL_GUC_ACTION_ENTER_S_STATE = 0x501,
  	INTEL_GUC_ACTION_EXIT_S_STATE = 0x502,
  	INTEL_GUC_ACTION_SLPC_REQUEST = 0x3003,
diff --git a/0001-INTEL_DII-drm-i915-guc-Keep-strict-GuC-ABI-definitio.patch b/0001-drm-i915-guc-Keep-strict-GuC-ABI-definitions.patch
similarity index 97%
rename from 0001-INTEL_DII-drm-i915-guc-Keep-strict-GuC-ABI-definitio.patch
rename to 0001-drm-i915-guc-Keep-strict-GuC-ABI-definitions.patch
index 730208fc3fdb..1efb494298c7 100644
--- a/0001-INTEL_DII-drm-i915-guc-Keep-strict-GuC-ABI-definitio.patch
+++ b/0001-drm-i915-guc-Keep-strict-GuC-ABI-definitions.patch
@@ -1,8 +1,7 @@
 From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Date: Mon, 18 Jan 2021 14:53:07 +0100
-Subject: [PATCH] INTEL_DII: drm/i915/guc: Keep strict GuC ABI definitions
- separate
+Date: Wed, 2 Jun 2021 22:16:15 -0700
+Subject: [PATCH] drm/i915/guc: Keep strict GuC ABI definitions
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -12,7 +11,11 @@ set of our helpers. In anticipation of upcoming changes to the GuC
 interface try to keep them separate in smaller maintainable files.
 
 Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+Signed-off-by: Matthew Brost <matthew.brost@intel.com>
 Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>
+Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Link: https://patchwork.freedesktop.org/patch/msgid/20210603051630.2635-6-matthew.brost@intel.com
+(cherry picked from commit 0a8e247dc1fa7a4b1e91b41f833f2a5f14c6d3f3)
 ---
  .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |  51 +++++
  .../gt/uc/abi/guc_communication_ctb_abi.h     | 106 +++++++++
@@ -299,9 +302,9 @@ new file mode 100644
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
-@@ -11,6 +11,12 @@
+@@ -10,6 +10,12 @@
+ #include <linux/compiler.h>
  #include <linux/types.h>
- #include "gt/intel_engine_types.h"
  
 +#include "abi/guc_actions_abi.h"
 +#include "abi/guc_errors_abi.h"
@@ -312,7 +315,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/
  #define GUC_CLIENT_PRIORITY_KMD_HIGH	0
  #define GUC_CLIENT_PRIORITY_HIGH	1
  #define GUC_CLIENT_PRIORITY_KMD_NORMAL	2
-@@ -247,101 +253,6 @@ struct guc_stage_desc {
+@@ -207,101 +213,6 @@ struct guc_stage_desc {
  	u64 desc_private;
  } __packed;
  
@@ -414,7 +417,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/
  #define GUC_POWER_UNSPECIFIED	0
  #define GUC_POWER_D0		1
  #define GUC_POWER_D1		2
-@@ -517,119 +428,17 @@ struct guc_shared_ctx_data {
+@@ -477,119 +388,17 @@ struct guc_shared_ctx_data {
  	struct guc_ctx_report preempt_ctx_report[GUC_MAX_ENGINES_NUM];
  } __packed;
  
diff --git a/0001-INTEL_DII-drm-i915-guc-Stop-using-fence-status-from-.patch b/0001-drm-i915-guc-Stop-using-fence-status-from-CTB-descri.patch
similarity index 91%
rename from 0001-INTEL_DII-drm-i915-guc-Stop-using-fence-status-from-.patch
rename to 0001-drm-i915-guc-Stop-using-fence-status-from-CTB-descri.patch
index 54b0cdc533cd..0908253cb765 100644
--- a/0001-INTEL_DII-drm-i915-guc-Stop-using-fence-status-from-.patch
+++ b/0001-drm-i915-guc-Stop-using-fence-status-from-CTB-descri.patch
@@ -1,16 +1,17 @@
 From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Date: Sun, 20 Dec 2020 23:38:19 +0100
-Subject: [PATCH] INTEL_DII: drm/i915/guc: Stop using fence/status from CTB
- descriptor
+Date: Wed, 2 Jun 2021 22:16:17 -0700
+Subject: [PATCH] drm/i915/guc: Stop using fence/status from CTB descriptor
 
 Stop using fence/status from CTB descriptor as future GuC ABI will
 no longer support replies over CTB descriptor.
 
-v2: rebased
-
 Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Acked-by: Matthew Brost <matthew.brost@intel.com>
+Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Link: https://patchwork.freedesktop.org/patch/msgid/20210603051630.2635-8-matthew.brost@intel.com
+(cherry picked from commit 882be6e0b705681ec210d80e7abc0e7e4c8aad28)
 ---
  .../gt/uc/abi/guc_communication_ctb_abi.h     |  4 +-
  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 72 ++-----------------
diff --git a/0001-INTEL_DII-drm-i915-Promote-ptrdiff-to-i915_utils.h.patch b/0001-drm-i915-Promote-ptrdiff-to-i915_utils.h.patch
similarity index 71%
rename from 0001-INTEL_DII-drm-i915-Promote-ptrdiff-to-i915_utils.h.patch
rename to 0001-drm-i915-Promote-ptrdiff-to-i915_utils.h.patch
index 63b38add40b5..6c6a61c901a1 100644
--- a/0001-INTEL_DII-drm-i915-Promote-ptrdiff-to-i915_utils.h.patch
+++ b/0001-drm-i915-Promote-ptrdiff-to-i915_utils.h.patch
@@ -1,12 +1,16 @@
 From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Date: Sun, 21 Feb 2021 17:18:16 +0100
-Subject: [PATCH] INTEL_DII: drm/i915: Promote ptrdiff() to i915_utils.h
+Date: Wed, 2 Jun 2021 22:16:18 -0700
+Subject: [PATCH] drm/i915: Promote ptrdiff() to i915_utils.h
 
 Generic helpers should be placed in i915_utils.h.
 
 Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Acked-by: Matthew Brost <matthew.brost@intel.com>
+Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Link: https://patchwork.freedesktop.org/patch/msgid/20210603051630.2635-9-matthew.brost@intel.com
+(cherry picked from commit d6e9c965607c3c51b965b7e804537000332cb666)
 ---
  drivers/gpu/drm/i915/i915_utils.h | 5 +++++
  drivers/gpu/drm/i915/i915_vma.h   | 5 -----
@@ -30,7 +34,7 @@ diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils
 diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
 --- a/drivers/gpu/drm/i915/i915_vma.h
 +++ b/drivers/gpu/drm/i915/i915_vma.h
-@@ -175,11 +175,6 @@ static inline void i915_vma_put(struct i915_vma *vma)
+@@ -148,11 +148,6 @@ static inline void i915_vma_put(struct i915_vma *vma)
  	i915_gem_object_put(vma->obj);
  }
  
diff --git a/0001-INTEL_DII-drm-i915-guc-Only-rely-on-own-CTB-size.patch b/0001-drm-i915-guc-Only-rely-on-own-CTB-size.patch
similarity index 92%
rename from 0001-INTEL_DII-drm-i915-guc-Only-rely-on-own-CTB-size.patch
rename to 0001-drm-i915-guc-Only-rely-on-own-CTB-size.patch
index 51155c87197f..1d79d134827c 100644
--- a/0001-INTEL_DII-drm-i915-guc-Only-rely-on-own-CTB-size.patch
+++ b/0001-drm-i915-guc-Only-rely-on-own-CTB-size.patch
@@ -1,7 +1,7 @@
 From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Date: Sun, 21 Feb 2021 19:44:30 +0100
-Subject: [PATCH] INTEL_DII: drm/i915/guc: Only rely on own CTB size
+Date: Wed, 2 Jun 2021 22:16:19 -0700
+Subject: [PATCH] drm/i915/guc: Only rely on own CTB size
 
 In upcoming GuC firmware, CTB size will be removed from the CTB
 descriptor so we must keep it locally for any calculations.
@@ -9,7 +9,11 @@ descriptor so we must keep it locally for any calculations.
 While around, improve some debug messages and helpers.
 
 Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Acked-by: Matthew Brost <matthew.brost@intel.com>
+Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Link: https://patchwork.freedesktop.org/patch/msgid/20210603051630.2635-10-matthew.brost@intel.com
+(cherry picked from commit 99b2f5f51c6bcf311df2ee992942b6b1b463225d)
 ---
  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 55 +++++++++++++++++------
  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h |  2 +
diff --git a/0001-INTEL_DII-drm-i915-guc-Don-t-repeat-CTB-layout-calcu.patch b/0001-drm-i915-guc-Don-t-repeat-CTB-layout-calculations.patch
similarity index 53%
rename from 0001-INTEL_DII-drm-i915-guc-Don-t-repeat-CTB-layout-calcu.patch
rename to 0001-drm-i915-guc-Don-t-repeat-CTB-layout-calculations.patch
index 0f213a3299f4..891b4196376f 100644
--- a/0001-INTEL_DII-drm-i915-guc-Don-t-repeat-CTB-layout-calcu.patch
+++ b/0001-drm-i915-guc-Don-t-repeat-CTB-layout-calculations.patch
@@ -1,17 +1,57 @@
 From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Date: Sun, 21 Feb 2021 20:45:41 +0100
-Subject: [PATCH] INTEL_DII: drm/i915/guc: Don't repeat CTB layout calculations
+Date: Wed, 2 Jun 2021 22:16:20 -0700
+Subject: [PATCH] drm/i915/guc: Don't repeat CTB layout calculations
 
 We can retrieve offsets to cmds buffers and descriptor from
 actual pointers that we already keep locally.
 
 Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Acked-by: Matthew Brost <matthew.brost@intel.com>
+Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Link: https://patchwork.freedesktop.org/patch/msgid/20210603051630.2635-11-matthew.brost@intel.com
+(cherry picked from commit 480c6fe1209a07f5c816b00b4b70f8f9437df708)
+
+When '529b9ec809a0 drm/i915/gtt: map the PD up front' backported this
+should be cherry-picked again.
 ---
+ drivers/gpu/drm/i915/gt/intel_gtt.c       |  8 ++++++++
+ drivers/gpu/drm/i915/gt/intel_gtt.h       |  3 +++
  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 16 ++++++++++------
- 1 file changed, 10 insertions(+), 6 deletions(-)
+ 3 files changed, 21 insertions(+), 6 deletions(-)
 
+diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
+--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
++++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
+@@ -119,6 +119,14 @@ void clear_pages(struct i915_vma *vma)
+ 	memset(&vma->page_sizes, 0, sizeof(vma->page_sizes));
+ }
+ 
++void *__px_vaddr(struct drm_i915_gem_object *p)
++{
++	enum i915_map_type type;
++
++	GEM_BUG_ON(!i915_gem_object_has_pages(p));
++	return page_unpack_bits(p->mm.mapping, &type);
++}
++
+ dma_addr_t __px_dma(struct drm_i915_gem_object *p)
+ {
+ 	GEM_BUG_ON(!i915_gem_object_has_pages(p));
+diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
+--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
++++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
+@@ -180,6 +180,9 @@ struct page *__px_page(struct drm_i915_gem_object *p);
+ dma_addr_t __px_dma(struct drm_i915_gem_object *p);
+ #define px_dma(px) (__px_dma(px_base(px)))
+ 
++void *__px_vaddr(struct drm_i915_gem_object *p);
++#define px_vaddr(px) (__px_vaddr(px_base(px)))
++
+ #define px_pt(px) \
+ 	__px_choose_expr(px, struct i915_page_table *, __x, \
+ 	__px_choose_expr(px, struct i915_page_directory *, &__x->pt, \
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -34,7 +74,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
 -	 * cmds buffers are in the second half of the blob page
 -	 */
 +	/* blob should start with send descriptor */
-+	blob = __px_vaddr(ct->vma->obj, NULL);
++	blob = __px_vaddr(ct->vma->obj);
 +	GEM_BUG_ON(blob != ct->ctbs[CTB_SEND].desc);
 +
 +	/* (re)initialize descriptors */
diff --git a/0001-INTEL_DII-drm-i915-guc-Replace-CTB-array-with-explic.patch b/0001-drm-i915-guc-Replace-CTB-array-with-explicit-members.patch
similarity index 89%
rename from 0001-INTEL_DII-drm-i915-guc-Replace-CTB-array-with-explic.patch
rename to 0001-drm-i915-guc-Replace-CTB-array-with-explicit-members.patch
index 9de03f4a8a4d..de372342316d 100644
--- a/0001-INTEL_DII-drm-i915-guc-Replace-CTB-array-with-explic.patch
+++ b/0001-drm-i915-guc-Replace-CTB-array-with-explicit-members.patch
@@ -1,15 +1,22 @@
 From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Date: Sun, 21 Feb 2021 21:41:10 +0100
-Subject: [PATCH] INTEL_DII: drm/i915/guc: Replace CTB array with explicit
- members
+Date: Thu, 3 Jun 2021 16:04:07 -0700
+Subject: [PATCH] drm/i915/guc: Replace CTB array with explicit members
 
 Upcoming GuC firmware will always require just two CTBs and we
 also plan to configure them with different sizes, so definining
 them as array is no longer suitable.
 
+v2: Use %p for ptrdiff print
+v3: Use %tx for ptrdiff print
+
 Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Acked-by: Matthew Brost <matthew.brost@intel.com>
+Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+Reported-by: kernel test robot <lkp@intel.com>
+Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Link: https://patchwork.freedesktop.org/patch/msgid/20210603230408.54856-1-matthew.brost@intel.com
+(cherry picked from commit b43f0fc8b8c81e3001526c7205f12d8a931a48dd)
 ---
  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 46 ++++++++++++-----------
  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h |  7 +++-
@@ -72,7 +79,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
 @@ -257,28 +264,25 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
  
  	/* blob should start with send descriptor */
- 	blob = __px_vaddr(ct->vma->obj, NULL);
+ 	blob = __px_vaddr(ct->vma->obj);
 -	GEM_BUG_ON(blob != ct->ctbs[CTB_SEND].desc);
 +	GEM_BUG_ON(blob != ct->ctbs.send.desc);
  
diff --git a/0001-INTEL_DII-drm-i915-guc-Update-sizes-of-CTB-buffers.patch b/0001-drm-i915-guc-Update-sizes-of-CTB-buffers.patch
similarity index 92%
rename from 0001-INTEL_DII-drm-i915-guc-Update-sizes-of-CTB-buffers.patch
rename to 0001-drm-i915-guc-Update-sizes-of-CTB-buffers.patch
index b5b332bff5c7..dabf4af91d78 100644
--- a/0001-INTEL_DII-drm-i915-guc-Update-sizes-of-CTB-buffers.patch
+++ b/0001-drm-i915-guc-Update-sizes-of-CTB-buffers.patch
@@ -1,15 +1,18 @@
 From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Date: Thu, 11 Mar 2021 15:24:51 +0100
-Subject: [PATCH] INTEL_DII: drm/i915/guc: Update sizes of CTB buffers
+Date: Thu, 3 Jun 2021 16:04:08 -0700
+Subject: [PATCH] drm/i915/guc: Update sizes of CTB buffers
 
 Future GuC will require CTB buffers sizes to be multiple of 4K.
 Make these changes now as this shouldn't impact us too much.
 
 Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Cc: John Harrison <john.c.harrison@intel.com>
-Cc: Matthew Brost <matthew.brost@intel.com>
+Signed-off-by: Matthew Brost <matthew.brost@intel.com>
 Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+Cc: John Harrison <john.c.harrison@intel.com>
+Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Link: https://patchwork.freedesktop.org/patch/msgid/20210603230408.54856-2-matthew.brost@intel.com
+(cherry picked from commit df12d1c3014f5a2f37e561a5331cf4bb7563b937)
 ---
  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 60 ++++++++++++-----------
  1 file changed, 32 insertions(+), 28 deletions(-)
diff --git a/0001-INTEL_DII-drm-i915-guc-Start-protecting-access-to-CT.patch b/0001-drm-i915-guc-Start-protecting-access-to-CTB-descript.patch
similarity index 80%
rename from 0001-INTEL_DII-drm-i915-guc-Start-protecting-access-to-CT.patch
rename to 0001-drm-i915-guc-Start-protecting-access-to-CTB-descript.patch
index 16530aa09917..4d2069ce0835 100644
--- a/0001-INTEL_DII-drm-i915-guc-Start-protecting-access-to-CT.patch
+++ b/0001-drm-i915-guc-Start-protecting-access-to-CTB-descript.patch
@@ -1,17 +1,21 @@
 From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Date: Tue, 23 Feb 2021 19:12:55 +0100
-Subject: [PATCH] INTEL_DII: drm/i915/guc: Start protecting access to CTB
- descriptors
+Date: Wed, 2 Jun 2021 22:16:24 -0700
+Subject: [PATCH] drm/i915/guc: Start protecting access to CTB descriptors
 
 We want to stop using guc.send_mutex while sending CTB messages
 so we have to start protecting access to CTB send descriptor.
 
-For completeness protect also CTB send descriptor.
+For completeness protect also CTB receive descriptor.
 
 Add spinlock to struct intel_guc_ct_buffer and start using it.
 
 Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Link: https://patchwork.freedesktop.org/patch/msgid/20210603051630.2635-15-matthew.brost@intel.com
+(cherry picked from commit 7c567bbf6f267c7379ddbba7afba7608d6e8e39f)
 ---
  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 14 ++++++++++++--
  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h |  2 ++
@@ -29,7 +33,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  	spin_lock_init(&ct->requests.lock);
  	INIT_LIST_HEAD(&ct->requests.pending);
  	INIT_LIST_HEAD(&ct->requests.incoming);
-@@ -479,17 +481,22 @@ static int ct_send(struct intel_guc_ct *ct,
+@@ -473,17 +475,22 @@ static int ct_send(struct intel_guc_ct *ct,
  	GEM_BUG_ON(len & ~GUC_CT_MSG_LEN_MASK);
  	GEM_BUG_ON(!response_buf && response_buf_size);
  
@@ -54,7 +58,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  	if (unlikely(err))
  		goto unlink;
  
-@@ -825,6 +832,7 @@ static int ct_handle_request(struct intel_guc_ct *ct, const u32 *msg)
+@@ -819,6 +826,7 @@ static int ct_handle_request(struct intel_guc_ct *ct, const u32 *msg)
  void intel_guc_ct_event_handler(struct intel_guc_ct *ct)
  {
  	u32 msg[GUC_CT_MSG_LEN_MASK + 1]; /* one extra dw for the header */
@@ -62,7 +66,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  	int err = 0;
  
  	if (unlikely(!ct->enabled)) {
-@@ -833,7 +841,9 @@ void intel_guc_ct_event_handler(struct intel_guc_ct *ct)
+@@ -827,7 +835,9 @@ void intel_guc_ct_event_handler(struct intel_guc_ct *ct)
  	}
  
  	do {
diff --git a/0001-INTEL_DII-drm-i915-guc-Stop-using-mutex-while-sendin.patch b/0001-drm-i915-guc-Stop-using-mutex-while-sending-CTB-mess.patch
similarity index 66%
rename from 0001-INTEL_DII-drm-i915-guc-Stop-using-mutex-while-sendin.patch
rename to 0001-drm-i915-guc-Stop-using-mutex-while-sending-CTB-mess.patch
index a124cfb0a18f..ab85f7093447 100644
--- a/0001-INTEL_DII-drm-i915-guc-Stop-using-mutex-while-sendin.patch
+++ b/0001-drm-i915-guc-Stop-using-mutex-while-sending-CTB-mess.patch
@@ -1,14 +1,18 @@
 From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Date: Tue, 23 Feb 2021 19:18:34 +0100
-Subject: [PATCH] INTEL_DII: drm/i915/guc: Stop using mutex while sending CTB
- messages
+Date: Wed, 2 Jun 2021 22:16:26 -0700
+Subject: [PATCH] drm/i915/guc: Stop using mutex while sending CTB messages
 
 We are no longer using descriptor to hold G2H replies and we are
 protecting access to the descriptor and command buffer by the
 separate spinlock, so we can stop using mutex.
 
 Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Link: https://patchwork.freedesktop.org/patch/msgid/20210603051630.2635-17-matthew.brost@intel.com
+(cherry picked from commit 2e496ac200c13ab1de6dc504a2566c612b493a4e)
 ---
  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 4 ----
  1 file changed, 4 deletions(-)
@@ -16,7 +20,7 @@ Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
-@@ -537,7 +537,6 @@ static int ct_send(struct intel_guc_ct *ct,
+@@ -560,7 +560,6 @@ static int ct_send(struct intel_guc_ct *ct,
  int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
  		      u32 *response_buf, u32 response_buf_size)
  {
@@ -24,7 +28,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  	u32 status = ~0; /* undefined */
  	int ret;
  
-@@ -546,8 +545,6 @@ int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
+@@ -569,8 +568,6 @@ int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
  		return -ENODEV;
  	}
  
@@ -33,7 +37,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  	ret = ct_send(ct, action, len, response_buf, response_buf_size, &status);
  	if (unlikely(ret < 0)) {
  		CT_ERROR(ct, "Sending action %#x failed (err=%d status=%#X)\n",
-@@ -557,7 +554,6 @@ int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
+@@ -580,7 +577,6 @@ int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
  			 action[0], ret, ret);
  	}
  
diff --git a/0001-INTEL_DII-drm-i915-guc-Don-t-receive-all-G2H-message.patch b/0001-drm-i915-guc-Don-t-receive-all-G2H-messages-in-irq-h.patch
similarity index 78%
rename from 0001-INTEL_DII-drm-i915-guc-Don-t-receive-all-G2H-message.patch
rename to 0001-drm-i915-guc-Don-t-receive-all-G2H-messages-in-irq-h.patch
index d0399380e738..47c67cab8496 100644
--- a/0001-INTEL_DII-drm-i915-guc-Don-t-receive-all-G2H-message.patch
+++ b/0001-drm-i915-guc-Don-t-receive-all-G2H-messages-in-irq-h.patch
@@ -1,13 +1,17 @@
 From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Date: Thu, 1 Apr 2021 22:01:40 +0200
-Subject: [PATCH] INTEL_DII: drm/i915/guc: Don't receive all G2H messages in
- irq handler
+Date: Wed, 2 Jun 2021 22:16:27 -0700
+Subject: [PATCH] drm/i915/guc: Don't receive all G2H messages in irq handler
 
 In irq handler try to receive just single G2H message, let other
 messages to be received from tasklet.
 
 Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Link: https://patchwork.freedesktop.org/patch/msgid/20210603051630.2635-18-matthew.brost@intel.com
+(cherry picked from commit 65dd4ed0f4e1ce2ccf8ddc66a6ee026b20f0c24c)
 ---
  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 67 ++++++++++++++++-------
  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h |  3 +
@@ -16,23 +20,23 @@ Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
-@@ -81,6 +81,7 @@ enum { CTB_SEND = 0, CTB_RECV = 1 };
+@@ -82,6 +82,7 @@ enum { CTB_SEND = 0, CTB_RECV = 1 };
  
  enum { CTB_OWNER_HOST = 0 };
  
-+static void ct_receive_tasklet_func(unsigned long data);
++static void ct_receive_tasklet_func(struct tasklet_struct *t);
  static void ct_incoming_request_worker_func(struct work_struct *w);
  
  /**
-@@ -95,6 +96,7 @@ void intel_guc_ct_init_early(struct intel_guc_ct *ct)
+@@ -96,6 +97,7 @@ void intel_guc_ct_init_early(struct intel_guc_ct *ct)
  	INIT_LIST_HEAD(&ct->requests.pending);
  	INIT_LIST_HEAD(&ct->requests.incoming);
  	INIT_WORK(&ct->requests.worker, ct_incoming_request_worker_func);
-+	tasklet_init(&ct->receive_tasklet, ct_receive_tasklet_func, (unsigned long)ct);
++	tasklet_setup(&ct->receive_tasklet, ct_receive_tasklet_func);
  }
  
  static inline const char *guc_ct_buffer_type_to_str(u32 type)
-@@ -244,6 +246,7 @@ void intel_guc_ct_fini(struct intel_guc_ct *ct)
+@@ -245,6 +247,7 @@ void intel_guc_ct_fini(struct intel_guc_ct *ct)
  {
  	GEM_BUG_ON(ct->enabled);
  
@@ -40,7 +44,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  	i915_vma_unpin_and_release(&ct->vma, I915_VMA_RELEASE_MAP);
  	memset(ct, 0, sizeof(*ct));
  }
-@@ -629,7 +632,7 @@ static int ct_read(struct intel_guc_ct *ct, u32 *data)
+@@ -652,7 +655,7 @@ static int ct_read(struct intel_guc_ct *ct, u32 *data)
  	CT_DEBUG(ct, "received %*ph\n", 4 * len, data);
  
  	desc->head = head * 4;
@@ -49,7 +53,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  
  corrupted:
  	CT_ERROR(ct, "Corrupted descriptor addr=%#x head=%u tail=%u size=%u\n",
-@@ -665,10 +668,10 @@ static int ct_handle_response(struct intel_guc_ct *ct, const u32 *msg)
+@@ -688,10 +691,10 @@ static int ct_handle_response(struct intel_guc_ct *ct, const u32 *msg)
  	u32 status;
  	u32 datalen;
  	struct ct_request *req;
@@ -61,7 +65,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  
  	/* Response payload shall at least include fence and status */
  	if (unlikely(len < 2)) {
-@@ -688,7 +691,7 @@ static int ct_handle_response(struct intel_guc_ct *ct, const u32 *msg)
+@@ -711,7 +714,7 @@ static int ct_handle_response(struct intel_guc_ct *ct, const u32 *msg)
  
  	CT_DEBUG(ct, "response fence %u status %#x\n", fence, status);
  
@@ -70,7 +74,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  	list_for_each_entry(req, &ct->requests.pending, link) {
  		if (unlikely(fence != req->fence)) {
  			CT_DEBUG(ct, "request %u awaits response\n",
-@@ -707,7 +710,7 @@ static int ct_handle_response(struct intel_guc_ct *ct, const u32 *msg)
+@@ -730,7 +733,7 @@ static int ct_handle_response(struct intel_guc_ct *ct, const u32 *msg)
  		found = true;
  		break;
  	}
@@ -79,7 +83,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  
  	if (!found)
  		CT_ERROR(ct, "Unsolicited response %*ph\n", msgsize, msg);
-@@ -821,31 +824,55 @@ static int ct_handle_request(struct intel_guc_ct *ct, const u32 *msg)
+@@ -844,31 +847,55 @@ static int ct_handle_request(struct intel_guc_ct *ct, const u32 *msg)
  	return 0;
  }
  
@@ -115,9 +119,9 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
 +		tasklet_hi_schedule(&ct->receive_tasklet);
 +}
 +
-+static void ct_receive_tasklet_func(unsigned long data)
++static void ct_receive_tasklet_func(struct tasklet_struct *t)
 +{
-+	struct intel_guc_ct *ct = (struct intel_guc_ct *)data;
++	struct intel_guc_ct *ct = from_tasklet(ct, t, receive_tasklet);
 +
 +	ct_try_receive_message(ct);
 +}
diff --git a/0001-INTEL_DII-drm-i915-guc-Always-copy-CT-message-to-new.patch b/0001-drm-i915-guc-Always-copy-CT-message-to-new-allocatio.patch
similarity index 88%
rename from 0001-INTEL_DII-drm-i915-guc-Always-copy-CT-message-to-new.patch
rename to 0001-drm-i915-guc-Always-copy-CT-message-to-new-allocatio.patch
index 7d0ee4c1855d..1b69952c4590 100644
--- a/0001-INTEL_DII-drm-i915-guc-Always-copy-CT-message-to-new.patch
+++ b/0001-drm-i915-guc-Always-copy-CT-message-to-new-allocatio.patch
@@ -1,8 +1,7 @@
 From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Date: Wed, 7 Apr 2021 21:32:18 +0200
-Subject: [PATCH] INTEL_DII: drm/i915/guc: Always copy CT message to new
- allocation
+Date: Wed, 2 Jun 2021 22:16:28 -0700
+Subject: [PATCH] drm/i915/guc: Always copy CT message to new allocation
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -13,10 +12,13 @@ create new allocation for such request, always copy incoming CT
 message to new allocation. Also by doing it while reading CT
 header, we can safely fallback if that atomic allocation fails.
 
-v2: add comments, improve ct_process_request
-
 Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Acked-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
+Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
+Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Link: https://patchwork.freedesktop.org/patch/msgid/20210603051630.2635-19-matthew.brost@intel.com
+(cherry picked from commit 8d99e09c5d1c20a3763e84d5f09619fa33e33186)
 ---
  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 180 ++++++++++++++--------
  1 file changed, 120 insertions(+), 60 deletions(-)
@@ -24,7 +26,7 @@ Acked-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
-@@ -72,8 +72,9 @@ struct ct_request {
+@@ -73,8 +73,9 @@ struct ct_request {
  	u32 *response_buf;
  };
  
@@ -35,7 +37,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  	u32 msg[];
  };
  
-@@ -575,7 +576,26 @@ static inline bool ct_header_is_response(u32 header)
+@@ -598,7 +599,26 @@ static inline bool ct_header_is_response(u32 header)
  	return !!(header & GUC_CT_MSG_IS_RESPONSE);
  }
  
@@ -63,7 +65,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  {
  	struct intel_guc_ct_buffer *ctb = &ct->ctbs.recv;
  	struct guc_ct_buffer_desc *desc = ctb->desc;
-@@ -586,6 +606,7 @@ static int ct_read(struct intel_guc_ct *ct, u32 *data)
+@@ -609,6 +629,7 @@ static int ct_read(struct intel_guc_ct *ct, u32 *data)
  	s32 available;
  	unsigned int len;
  	unsigned int i;
@@ -71,7 +73,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  
  	if (unlikely(desc->is_in_error))
  		return -EPIPE;
-@@ -601,8 +622,10 @@ static int ct_read(struct intel_guc_ct *ct, u32 *data)
+@@ -624,8 +645,10 @@ static int ct_read(struct intel_guc_ct *ct, u32 *data)
  
  	/* tail == head condition indicates empty */
  	available = tail - head;
@@ -84,7 +86,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  
  	/* beware of buffer wrap case */
  	if (unlikely(available < 0))
-@@ -610,14 +633,14 @@ static int ct_read(struct intel_guc_ct *ct, u32 *data)
+@@ -633,14 +656,14 @@ static int ct_read(struct intel_guc_ct *ct, u32 *data)
  	CT_DEBUG(ct, "available %d (%u:%u)\n", available, head, tail);
  	GEM_BUG_ON(available < 0);
  
@@ -102,7 +104,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  			 4 * (head + available - 1 > size ?
  			      size - head : available - 1), &cmds[head],
  			 4 * (head + available - 1 > size ?
-@@ -625,11 +648,24 @@ static int ct_read(struct intel_guc_ct *ct, u32 *data)
+@@ -648,11 +671,24 @@ static int ct_read(struct intel_guc_ct *ct, u32 *data)
  		goto corrupted;
  	}
  
@@ -129,7 +131,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  
  	desc->head = head * 4;
  	return available - len;
-@@ -659,33 +695,33 @@ static int ct_read(struct intel_guc_ct *ct, u32 *data)
+@@ -682,33 +718,33 @@ static int ct_read(struct intel_guc_ct *ct, u32 *data)
   *                   ^-----------------------len-----------------------^
   */
  
@@ -170,7 +172,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  		return -EPROTO;
  	}
  
-@@ -699,12 +735,13 @@ static int ct_handle_response(struct intel_guc_ct *ct, const u32 *msg)
+@@ -722,12 +758,13 @@ static int ct_handle_response(struct intel_guc_ct *ct, const u32 *msg)
  			continue;
  		}
  		if (unlikely(datalen > req->response_len)) {
@@ -188,7 +190,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  		req->response_len = datalen;
  		WRITE_ONCE(req->status, status);
  		found = true;
-@@ -712,45 +749,61 @@ static int ct_handle_response(struct intel_guc_ct *ct, const u32 *msg)
+@@ -735,45 +772,61 @@ static int ct_handle_response(struct intel_guc_ct *ct, const u32 *msg)
  	}
  	spin_unlock_irqrestore(&ct->requests.lock, flags);
  
@@ -264,7 +266,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  	if (request)
  		list_del(&request->link);
  	done = !!list_empty(&ct->requests.incoming);
-@@ -759,14 +812,13 @@ static bool ct_process_incoming_requests(struct intel_guc_ct *ct)
+@@ -782,14 +835,13 @@ static bool ct_process_incoming_requests(struct intel_guc_ct *ct)
  	if (!request)
  		return true;
  
@@ -285,7 +287,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  	return done;
  }
  
-@@ -799,22 +851,11 @@ static void ct_incoming_request_worker_func(struct work_struct *w)
+@@ -822,22 +874,11 @@ static void ct_incoming_request_worker_func(struct work_struct *w)
   *                   ^-----------------------len-----------------------^
   */
  
@@ -310,7 +312,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  
  	spin_lock_irqsave(&ct->requests.lock, flags);
  	list_add_tail(&request->link, &ct->requests.incoming);
-@@ -824,22 +865,41 @@ static int ct_handle_request(struct intel_guc_ct *ct, const u32 *msg)
+@@ -847,22 +888,41 @@ static int ct_handle_request(struct intel_guc_ct *ct, const u32 *msg)
  	return 0;
  }
  
diff --git a/0001-INTEL_DII-drm-i915-guc-Early-initialization-of-GuC-s.patch b/0001-drm-i915-guc-Early-initialization-of-GuC-send-regist.patch
similarity index 74%
rename from 0001-INTEL_DII-drm-i915-guc-Early-initialization-of-GuC-s.patch
rename to 0001-drm-i915-guc-Early-initialization-of-GuC-send-regist.patch
index fd87433c2cb2..6dfc0461d776 100644
--- a/0001-INTEL_DII-drm-i915-guc-Early-initialization-of-GuC-s.patch
+++ b/0001-drm-i915-guc-Early-initialization-of-GuC-send-regist.patch
@@ -1,15 +1,19 @@
 From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Date: Sun, 2 Aug 2020 17:51:56 +0200
-Subject: [PATCH] INTEL_DII: drm/i915/guc: Early initialization of GuC send
- registers
+Date: Wed, 2 Jun 2021 22:16:29 -0700
+Subject: [PATCH] drm/i915/guc: Early initialization of GuC send registers
 
 Base offset and count of the GuC scratch registers, used for
 sending MMIO messages to GuC, can be initialized earlier with
 other GuC members that also depends on platform.
 
 Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
+Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
+Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Link: https://patchwork.freedesktop.org/patch/msgid/20210603051630.2635-20-matthew.brost@intel.com
+(cherry picked from commit e09be87af54f703a67f6b573f6a12b8349c5c8f5)
 ---
  drivers/gpu/drm/i915/gt/uc/intel_guc.c | 18 +++++++++---------
  1 file changed, 9 insertions(+), 9 deletions(-)
@@ -17,11 +21,11 @@ Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
-@@ -61,15 +61,8 @@ void intel_guc_init_send_regs(struct intel_guc *guc)
+@@ -60,15 +60,8 @@ void intel_guc_init_send_regs(struct intel_guc *guc)
  	enum forcewake_domains fw_domains = 0;
  	unsigned int i;
  
--	if (GRAPHICS_VER(gt->i915) >= 11) {
+-	if (INTEL_GEN(gt->i915) >= 11) {
 -		guc->send_regs.base =
 -				i915_mmio_reg_offset(GEN11_SOFT_SCRATCH(0));
 -		guc->send_regs.count = GEN11_SOFT_SCRATCH_COUNT;
@@ -35,7 +39,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc
  
  	for (i = 0; i < guc->send_regs.count; i++) {
  		fw_domains |= intel_uncore_forcewake_for_reg(gt->uncore,
-@@ -182,11 +175,18 @@ void intel_guc_init_early(struct intel_guc *guc)
+@@ -172,11 +165,18 @@ void intel_guc_init_early(struct intel_guc *guc)
  		guc->interrupts.reset = gen11_reset_guc_interrupts;
  		guc->interrupts.enable = gen11_enable_guc_interrupts;
  		guc->interrupts.disable = gen11_disable_guc_interrupts;
diff --git a/0001-drm-i915-uc-Use-platform-specific-defaults-for-GuC-H.patch b/0001-drm-i915-uc-Use-platform-specific-defaults-for-GuC-H.patch
new file mode 100644
index 000000000000..32cc7e8ed2ff
--- /dev/null
+++ b/0001-drm-i915-uc-Use-platform-specific-defaults-for-GuC-H.patch
@@ -0,0 +1,47 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: John Harrison <John.C.Harrison@Intel.com>
+Date: Thu, 3 Jun 2021 09:48:12 -0700
+Subject: [PATCH] drm/i915/uc: Use platform specific defaults for GuC/HuC
+ enabling
+
+The meaning of 'default' for the enable_guc module parameter has been
+updated to accurately reflect what is supported on current platforms.
+So start using the defaults instead of forcing everything off.
+Although, note that right now, the default is for everything to be off
+anyway. So this is not a change for current platforms.
+
+Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
+Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
+Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
+Link: https://patchwork.freedesktop.org/patch/msgid/20210603164812.19045-2-matthew.brost@intel.com
+(cherry picked from commit 47c65b3853f88d105017ef512a521794db51bfeb)
+---
+ drivers/gpu/drm/i915/i915_params.c | 2 +-
+ drivers/gpu/drm/i915/i915_params.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
+--- a/drivers/gpu/drm/i915/i915_params.c
++++ b/drivers/gpu/drm/i915/i915_params.c
+@@ -160,7 +160,7 @@ i915_param_named_unsafe(edp_vswing, int, 0400,
+ i915_param_named_unsafe(enable_guc, int, 0400,
+ 	"Enable GuC load for GuC submission and/or HuC load. "
+ 	"Required functionality can be selected using bitmask values. "
+-	"(-1=auto, 0=disable [default], 1=GuC submission, 2=HuC load)");
++	"(-1=auto [default], 0=disable, 1=GuC submission, 2=HuC load)");
+ 
+ i915_param_named(guc_log_level, int, 0400,
+ 	"GuC firmware logging level. Requires GuC to be loaded. "
+diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
+--- a/drivers/gpu/drm/i915/i915_params.h
++++ b/drivers/gpu/drm/i915/i915_params.h
+@@ -59,7 +59,7 @@ struct drm_printer;
+ 	param(int, disable_power_well, -1, 0400) \
+ 	param(int, enable_ips, 1, 0600) \
+ 	param(int, invert_brightness, 0, 0600) \
+-	param(int, enable_guc, 0, 0400) \
++	param(int, enable_guc, -1, 0400) \
+ 	param(int, guc_log_level, -1, 0400) \
+ 	param(char *, guc_firmware_path, NULL, 0400) \
+ 	param(char *, huc_firmware_path, NULL, 0400) \
diff --git a/0001-INTEL_DII-drm-i915-guc-Introduce-unified-HXG-message.patch b/0001-drm-i915-guc-Introduce-unified-HXG-messages.patch
similarity index 96%
rename from 0001-INTEL_DII-drm-i915-guc-Introduce-unified-HXG-message.patch
rename to 0001-drm-i915-guc-Introduce-unified-HXG-messages.patch
index e22cdaf867ee..de9ded8d2adb 100644
--- a/0001-INTEL_DII-drm-i915-guc-Introduce-unified-HXG-message.patch
+++ b/0001-drm-i915-guc-Introduce-unified-HXG-messages.patch
@@ -1,7 +1,7 @@
 From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Date: Mon, 18 Jan 2021 17:23:16 +0100
-Subject: [PATCH] INTEL_DII: drm/i915/guc: Introduce unified HXG messages
+Date: Tue, 15 Jun 2021 17:13:00 -0700
+Subject: [PATCH] drm/i915/guc: Introduce unified HXG messages
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -10,10 +10,13 @@ New GuC firmware will unify format of MMIO and CTB H2G messages.
 Introduce their definitions now to allow gradual transition of
 our code to match new changes.
 
-v2: minor kernel-doc fixes
-
+Signed-off-by: Matthew Brost <matthew.brost@intel.com>
 Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>
+Cc: Michał Winiarski <michal.winiarski@intel.com>
+Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
+Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+Link: https://patchwork.freedesktop.org/patch/msgid/20210616001302.84233-2-matthew.brost@intel.com
+(cherry picked from commit 088b4d4a48ee97e993fc6b4381d23776f0782bc6)
 ---
  .../gpu/drm/i915/gt/uc/abi/guc_messages_abi.h | 213 ++++++++++++++++++
  1 file changed, 213 insertions(+)
diff --git a/0001-INTEL_DII-drm-i915-doc-Include-GuC-ABI-documentation.patch b/0001-drm-i915-doc-Include-GuC-ABI-documentation.patch
similarity index 66%
rename from 0001-INTEL_DII-drm-i915-doc-Include-GuC-ABI-documentation.patch
rename to 0001-drm-i915-doc-Include-GuC-ABI-documentation.patch
index e92174655c75..905a541837b5 100644
--- a/0001-INTEL_DII-drm-i915-doc-Include-GuC-ABI-documentation.patch
+++ b/0001-drm-i915-doc-Include-GuC-ABI-documentation.patch
@@ -1,7 +1,7 @@
 From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Date: Wed, 12 May 2021 20:00:09 +0200
-Subject: [PATCH] INTEL_DII: drm/i915/doc: Include GuC ABI documentation
+Date: Tue, 15 Jun 2021 17:13:02 -0700
+Subject: [PATCH] drm/i915/doc: Include GuC ABI documentation
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -9,7 +9,12 @@ Content-Transfer-Encoding: 8bit
 GuC ABI documentation is now ready to be included in i915.rst
 
 Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Acked-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
+Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
+Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+Link: https://patchwork.freedesktop.org/patch/msgid/20210616001302.84233-4-matthew.brost@intel.com
+(cherry picked from commit bfde26df7af4e8ea894008dfda1d7d54a834dcd4)
 ---
  Documentation/gpu/i915.rst | 8 ++++++++
  1 file changed, 8 insertions(+)
@@ -17,7 +22,7 @@ Acked-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
 diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
 --- a/Documentation/gpu/i915.rst
 +++ b/Documentation/gpu/i915.rst
-@@ -515,6 +515,14 @@ GuC-based command submission
+@@ -518,6 +518,14 @@ GuC-based command submission
  .. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
     :doc: GuC-based command submission
  
diff --git a/0001-INTEL_DII-drm-i915-guc-Improve-error-message-for-uns.patch b/0001-drm-i915-guc-Improve-error-message-for-unsolicited-C.patch
similarity index 72%
rename from 0001-INTEL_DII-drm-i915-guc-Improve-error-message-for-uns.patch
rename to 0001-drm-i915-guc-Improve-error-message-for-unsolicited-C.patch
index e1377f5d49ed..a64e751d3f03 100644
--- a/0001-INTEL_DII-drm-i915-guc-Improve-error-message-for-uns.patch
+++ b/0001-drm-i915-guc-Improve-error-message-for-unsolicited-C.patch
@@ -1,14 +1,18 @@
 From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Matthew Brost <matthew.brost@intel.com>
-Date: Thu, 18 Feb 2021 12:17:01 -0800
-Subject: [PATCH] INTEL_DII: drm/i915/guc: Improve error message for
- unsolicited CT response
+Date: Thu, 8 Jul 2021 09:20:50 -0700
+Subject: [PATCH] drm/i915/guc: Improve error message for unsolicited CT
+ response
 
 Improve the error message when a unsolicited CT response is received by
 printing fence that couldn't be found, the last fence, and all requests
 with a response outstanding.
 
 Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
+Link: https://patchwork.freedesktop.org/patch/msgid/20210708162055.129996-3-matthew.brost@intel.com
+(cherry picked from commit dd9c0f3cbbe6fdfe7402b9c6ea35f04b260901bf)
 ---
  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 10 +++++++---
  1 file changed, 7 insertions(+), 3 deletions(-)
@@ -16,7 +20,7 @@ Signed-off-by: Matthew Brost <matthew.brost@intel.com>
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
-@@ -711,12 +711,16 @@ static int ct_handle_response(struct intel_guc_ct *ct, struct ct_incoming_msg *r
+@@ -733,12 +733,16 @@ static int ct_handle_response(struct intel_guc_ct *ct, struct ct_incoming_msg *r
  		found = true;
  		break;
  	}
diff --git a/0001-INTEL_DII-drm-i915-guc-Increase-size-of-CTB-buffers.patch b/0001-drm-i915-guc-Increase-size-of-CTB-buffers.patch
similarity index 74%
rename from 0001-INTEL_DII-drm-i915-guc-Increase-size-of-CTB-buffers.patch
rename to 0001-drm-i915-guc-Increase-size-of-CTB-buffers.patch
index ff5b38d8da27..dacd1a360a47 100644
--- a/0001-INTEL_DII-drm-i915-guc-Increase-size-of-CTB-buffers.patch
+++ b/0001-drm-i915-guc-Increase-size-of-CTB-buffers.patch
@@ -1,21 +1,19 @@
 From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Matthew Brost <matthew.brost@intel.com>
-Date: Wed, 1 May 2019 09:12:00 -0700
-Subject: [PATCH] INTEL_DII: drm/i915/guc: Increase size of CTB buffers
+Date: Thu, 8 Jul 2021 09:20:51 -0700
+Subject: [PATCH] drm/i915/guc: Increase size of CTB buffers
 
 With the introduction of non-blocking CTBs more than one CTB can be in
 flight at a time. Increasing the size of the CTBs should reduce how
 often software hits the case where no space is available in the CTB
 buffer.
 
-v3: Fixed comment about layout of CTB memory, increased size of G2H
-memory.
-v4: Rebased after porting CTB updates from upstream (JohnH).
-v5: rebased on ctbs improvements (Michal)
-v6: rebased on 4k ctbs (Michal)
-
 Cc: John Harrison <john.c.harrison@intel.com>
 Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
+Link: https://patchwork.freedesktop.org/patch/msgid/20210708162055.129996-4-matthew.brost@intel.com
+(cherry picked from commit c26e289f1d8d5b8716f825ac5d798897aca5a124)
 ---
  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 11 ++++++++---
  1 file changed, 8 insertions(+), 3 deletions(-)
@@ -23,14 +21,14 @@ Signed-off-by: Matthew Brost <matthew.brost@intel.com>
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
-@@ -63,11 +63,16 @@ static inline struct drm_device *ct_to_drm(struct intel_guc_ct *ct)
+@@ -59,11 +59,16 @@ static inline struct drm_device *ct_to_drm(struct intel_guc_ct *ct)
   *      +--------+-----------------------------------------------+------+
   *
   * Size of each `CT Buffer`_ must be multiple of 4K.
 - * As we don't expect too many messages, for now use minimum sizes.
 + * We don't expect too many messages in flight at any time, unless we are
 + * using the GuC submission. In that case each request requires a minimum
-+ * 16 bytes which gives us a maximum 256 queue'd requests. Hopefully this
++ * 2 dwords which gives us a maximum 256 queue'd requests. Hopefully this
 + * enough space to avoid backpressure on the driver. We increase the size
 + * of the receive buffer (relative to the send) to ensure a G2H response
 + * CTB has a landing spot.
@@ -40,9 +38,9 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
 -#define CTB_G2H_BUFFER_SIZE	(SZ_4K)
 +#define CTB_G2H_BUFFER_SIZE	(4 * CTB_H2G_BUFFER_SIZE)
  
- #define MAX_US_STALL_CTB	1000000
- 
-@@ -761,7 +766,7 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
+ struct ct_request {
+ 	struct list_head link;
+@@ -644,7 +649,7 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
  	/* beware of buffer wrap case */
  	if (unlikely(available < 0))
  		available += size;
diff --git a/0001-INTEL_DII-drm-i915-guc-Add-non-blocking-CTB-send-fun.patch b/0001-drm-i915-guc-Add-non-blocking-CTB-send-function.patch
similarity index 53%
rename from 0001-INTEL_DII-drm-i915-guc-Add-non-blocking-CTB-send-fun.patch
rename to 0001-drm-i915-guc-Add-non-blocking-CTB-send-function.patch
index e17a09f6d138..f92329377a31 100644
--- a/0001-INTEL_DII-drm-i915-guc-Add-non-blocking-CTB-send-fun.patch
+++ b/0001-drm-i915-guc-Add-non-blocking-CTB-send-function.patch
@@ -1,46 +1,63 @@
 From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Matthew Brost <matthew.brost@intel.com>
-Date: Thu, 14 Nov 2019 11:12:46 -0800
-Subject: [PATCH] INTEL_DII: drm/i915/guc: Add non blocking CTB send function
+Date: Thu, 8 Jul 2021 09:20:52 -0700
+Subject: [PATCH] drm/i915/guc: Add non blocking CTB send function
 
-Add non blocking CTB send function, intel_guc_send_nb. In order to
-support a non blocking CTB send function a spin lock is needed to
-protect the CTB descriptors fields. Also the non blocking call must not
-update the fence value as this value is owned by the blocking call
-(intel_guc_send).
+Add non blocking CTB send function, intel_guc_send_nb. GuC submission
+will send CTBs in the critical path and does not need to wait for these
+CTBs to complete before moving on, hence the need for this new function.
 
-The blocking CTB now must have a flow control mechanism to ensure the
-buffer isn't overrun. A lazy spin wait is used as we believe the flow
-control condition should be rare with properly sized buffer.
+The non-blocking CTB now must have a flow control mechanism to ensure
+the buffer isn't overrun. A lazy spin wait is used as we believe the
+flow control condition should be rare with a properly sized buffer.
 
 The function, intel_guc_send_nb, is exported in this patch but unused.
 Several patches later in the series make use of this function.
 
-v3: Updated intel_guc_send_nb to acquire the spin lock. Added function
-intel_guc_send_nb_lock in which the caller owns the lock.
-v4: Split stall code into separate patch as per review feedback. (JohnH)
-v5: Rebased after porting CTB updates from upstream (JohnH).
-v6: Add write_barrier() + WRITE_ONCE to ct_write (Matthew Brost)
-v7: rebase (Michal)
-v8: Cleanups (Matthew Brost)
-v9: rebase on ctbs.send (Michal)
-v10: rebase on ctbs.lock (Michal)
-v11: rebased on new ctb.descriptor format (Michal)
-v12: rebased on new ctb message (Michal)
-v13: Use DWs in ctb_has_room (Matthew Brost)
+v2:
+ (Michal)
+  - Use define for H2G room calculations
+  - Move INTEL_GUC_SEND_NB define
+ (Daniel Vetter)
+  - Use msleep_interruptible rather than cond_resched
+v3:
+ (Michal)
+  - Move includes to following patch
+  - s/INTEL_GUC_SEND_NB/INTEL_GUC_CT_SEND_NB/g
+v4:
+ (John H)
+  - Update comment, add type local variable
 
 Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
 Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
+Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
+Link: https://patchwork.freedesktop.org/patch/msgid/20210708162055.129996-5-matthew.brost@intel.com
+(cherry picked from commit 1681924d8bdeb248451fd1d47c18648ffaeed625)
 ---
- drivers/gpu/drm/i915/gt/uc/intel_guc.h    | 12 ++-
- drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 96 +++++++++++++++++++++--
- drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h |  7 +-
- 3 files changed, 105 insertions(+), 10 deletions(-)
+ .../gt/uc/abi/guc_communication_ctb_abi.h     |  3 +-
+ drivers/gpu/drm/i915/gt/uc/intel_guc.h        | 11 ++-
+ drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 88 ++++++++++++++++---
+ drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |  4 +-
+ 4 files changed, 91 insertions(+), 15 deletions(-)
 
+diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
+--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
++++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
+@@ -79,7 +79,8 @@ static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
+  *  +---+-------+--------------------------------------------------------------+
+  */
+ 
+-#define GUC_CTB_MSG_MIN_LEN			1u
++#define GUC_CTB_HDR_LEN				1u
++#define GUC_CTB_MSG_MIN_LEN			GUC_CTB_HDR_LEN
+ #define GUC_CTB_MSG_MAX_LEN			256u
+ #define GUC_CTB_MSG_0_FENCE			(0xffff << 16)
+ #define GUC_CTB_MSG_0_FORMAT			(0xf << 12)
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
-@@ -75,7 +75,15 @@ static inline struct intel_guc *log_to_guc(struct intel_guc_log *log)
+@@ -74,7 +74,14 @@ static inline struct intel_guc *log_to_guc(struct intel_guc_log *log)
  static
  inline int intel_guc_send(struct intel_guc *guc, const u32 *action, u32 len)
  {
@@ -48,16 +65,15 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc
 +	return intel_guc_ct_send(&guc->ct, action, len, NULL, 0, 0);
 +}
 +
-+#define INTEL_GUC_SEND_NB		BIT(31)
 +static
 +inline int intel_guc_send_nb(struct intel_guc *guc, const u32 *action, u32 len)
 +{
 +	return intel_guc_ct_send(&guc->ct, action, len, NULL, 0,
-+				 INTEL_GUC_SEND_NB);
++				 INTEL_GUC_CT_SEND_NB);
  }
  
  static inline int
-@@ -83,7 +91,7 @@ intel_guc_send_and_receive(struct intel_guc *guc, const u32 *action, u32 len,
+@@ -82,7 +89,7 @@ intel_guc_send_and_receive(struct intel_guc *guc, const u32 *action, u32 len,
  			   u32 *response_buf, u32 response_buf_size)
  {
  	return intel_guc_ct_send(&guc->ct, action, len,
@@ -69,42 +85,16 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
-@@ -3,6 +3,11 @@
+@@ -3,6 +3,8 @@
   * Copyright © 2016-2019 Intel Corporation
   */
  
 +#include <linux/circ_buf.h>
-+#include <linux/ktime.h>
-+#include <linux/time64.h>
-+#include <linux/timekeeping.h>
 +
  #include "i915_drv.h"
  #include "intel_guc_ct.h"
  #include "gt/intel_gt.h"
-@@ -308,6 +313,7 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
- 	if (unlikely(err))
- 		goto err_deregister;
- 
-+	ct->requests.last_fence = 1;
- 	ct->enabled = true;
- 
- 	return 0;
-@@ -343,10 +349,22 @@ static u32 ct_get_next_fence(struct intel_guc_ct *ct)
- 	return ++ct->requests.last_fence;
- }
- 
-+static void write_barrier(struct intel_guc_ct *ct) {
-+	struct intel_guc *guc = ct_to_guc(ct);
-+	struct intel_gt *gt = guc_to_gt(guc);
-+
-+	if (i915_gem_object_is_lmem(guc->ct.vma->obj)) {
-+		GEM_BUG_ON(guc->send_regs.fw_domains);
-+		intel_uncore_write_fw(gt->uncore, GEN11_SOFT_SCRATCH(0), 0);
-+	} else {
-+		wmb();
-+	}
-+}
-+
+@@ -374,7 +376,7 @@ static void write_barrier(struct intel_guc_ct *ct)
  static int ct_write(struct intel_guc_ct *ct,
  		    const u32 *action,
  		    u32 len /* in dwords */,
@@ -113,41 +103,45 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  {
  	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
  	struct guc_ct_buffer_desc *desc = ctb->desc;
-@@ -393,9 +411,13 @@ static int ct_write(struct intel_guc_ct *ct,
+@@ -384,6 +386,7 @@ static int ct_write(struct intel_guc_ct *ct,
+ 	u32 used;
+ 	u32 header;
+ 	u32 hxg;
++	u32 type;
+ 	u32 *cmds = ctb->cmds;
+ 	unsigned int i;
+ 
+@@ -409,8 +412,8 @@ static int ct_write(struct intel_guc_ct *ct,
+ 	else
+ 		used = tail - head;
+ 
+-	/* make sure there is a space including extra dw for the fence */
+-	if (unlikely(used + len + 1 >= size))
++	/* make sure there is a space including extra dw for the header */
++	if (unlikely(used + len + GUC_CTB_HDR_LEN >= size))
+ 		return -ENOSPC;
+ 
+ 	/*
+@@ -422,9 +425,11 @@ static int ct_write(struct intel_guc_ct *ct,
  		 FIELD_PREP(GUC_CTB_MSG_0_NUM_DWORDS, len) |
  		 FIELD_PREP(GUC_CTB_MSG_0_FENCE, fence);
  
 -	hxg = FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
 -	      FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION |
 -			 GUC_HXG_REQUEST_MSG_0_DATA0, action[0]);
-+	hxg = (flags & INTEL_GUC_SEND_NB) ?
-+		(FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_EVENT) |
-+		 FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
-+			    GUC_HXG_EVENT_MSG_0_DATA0, action[0])) :
-+		(FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
-+		 FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION |
-+			    GUC_HXG_REQUEST_MSG_0_DATA0, action[0]));
++	type = (flags & INTEL_GUC_CT_SEND_NB) ? GUC_HXG_TYPE_EVENT :
++		GUC_HXG_TYPE_REQUEST;
++	hxg = FIELD_PREP(GUC_HXG_MSG_0_TYPE, type) |
++		FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
++			   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
  
  	CT_DEBUG(ct, "writing (tail %u) %*ph %*ph %*ph\n",
  		 tail, 4, &header, 4, &hxg, 4 * (len - 1), &action[1]);
-@@ -412,6 +434,12 @@ static int ct_write(struct intel_guc_ct *ct,
- 	}
- 	GEM_BUG_ON(tail > size);
- 
-+	/*
-+	 * make sure H2G buffer update and LRC tail update (if this triggering a
-+	 * submission) are visable before updating the descriptor tail
-+	 */
-+	write_barrier(ct);
-+
- 	/* now update descriptor */
- 	WRITE_ONCE(desc->tail, tail);
- 
-@@ -466,6 +494,46 @@ static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
+@@ -501,6 +506,48 @@ static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
  	return err;
  }
  
-+static inline bool ctb_has_room(struct intel_guc_ct_buffer *ctb, u32 len_dw)
++static inline bool h2g_has_room(struct intel_guc_ct_buffer *ctb, u32 len_dw)
 +{
 +	struct guc_ct_buffer_desc *desc = ctb->desc;
 +	u32 head = READ_ONCE(desc->head);
@@ -170,9 +164,11 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
 +
 +	spin_lock_irqsave(&ctb->lock, spin_flags);
 +
-+	ret = ctb_has_room(ctb, len + 1);
-+	if (unlikely(ret))
++	ret = h2g_has_room(ctb, len + GUC_CTB_HDR_LEN);
++	if (unlikely(!ret)) {
++		ret = -EBUSY;
 +		goto out;
++	}
 +
 +	fence = ct_get_next_fence(ct);
 +	ret = ct_write(ct, action, len, fence, flags);
@@ -190,45 +186,56 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  static int ct_send(struct intel_guc_ct *ct,
  		   const u32 *action,
  		   u32 len,
-@@ -473,6 +541,7 @@ static int ct_send(struct intel_guc_ct *ct,
+@@ -508,8 +555,10 @@ static int ct_send(struct intel_guc_ct *ct,
  		   u32 response_buf_size,
  		   u32 *status)
  {
 +	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
  	struct ct_request request;
  	unsigned long flags;
++	unsigned int sleep_period_ms = 1;
  	u32 fence;
-@@ -482,8 +551,20 @@ static int ct_send(struct intel_guc_ct *ct,
+ 	int err;
+ 
+@@ -517,8 +566,24 @@ static int ct_send(struct intel_guc_ct *ct,
  	GEM_BUG_ON(!len);
  	GEM_BUG_ON(len & ~GUC_CT_MSG_LEN_MASK);
  	GEM_BUG_ON(!response_buf && response_buf_size);
 +	might_sleep();
- 
++
 +	/*
 +	 * We use a lazy spin wait loop here as we believe that if the CT
 +	 * buffers are sized correctly the flow control condition should be
 +	 * rare.
 +	 */
 +retry:
- 	spin_lock_irqsave(&ct->ctbs.send.lock, flags);
-+	if (unlikely(!ctb_has_room(ctb, len + 1))) {
-+		spin_unlock_irqrestore(&ct->ctbs.send.lock, flags);
-+		cond_resched();
++	spin_lock_irqsave(&ctb->lock, flags);
++	if (unlikely(!h2g_has_room(ctb, len + GUC_CTB_HDR_LEN))) {
++		spin_unlock_irqrestore(&ctb->lock, flags);
+ 
+-	spin_lock_irqsave(&ct->ctbs.send.lock, flags);
++		if (msleep_interruptible(sleep_period_ms))
++			return -EINTR;
++		sleep_period_ms = sleep_period_ms << 1;
++
 +		goto retry;
 +	}
  
  	fence = ct_get_next_fence(ct);
  	request.fence = fence;
-@@ -495,7 +576,7 @@ static int ct_send(struct intel_guc_ct *ct,
+@@ -530,9 +595,9 @@ static int ct_send(struct intel_guc_ct *ct,
  	list_add_tail(&request.link, &ct->requests.pending);
  	spin_unlock(&ct->requests.lock);
  
 -	err = ct_write(ct, action, len, fence);
 +	err = ct_write(ct, action, len, fence, 0);
  
- 	spin_unlock_irqrestore(&ct->ctbs.send.lock, flags);
+-	spin_unlock_irqrestore(&ct->ctbs.send.lock, flags);
++	spin_unlock_irqrestore(&ctb->lock, flags);
  
-@@ -537,7 +618,7 @@ static int ct_send(struct intel_guc_ct *ct,
+ 	if (unlikely(err))
+ 		goto unlink;
+@@ -572,7 +637,7 @@ static int ct_send(struct intel_guc_ct *ct,
   * Command Transport (CT) buffer based GuC send function.
   */
  int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
@@ -237,11 +244,11 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  {
  	u32 status = ~0; /* undefined */
  	int ret;
-@@ -555,6 +636,9 @@ int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
+@@ -582,6 +647,9 @@ int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
  		return -ENODEV;
  	}
  
-+	if (flags & INTEL_GUC_SEND_NB)
++	if (flags & INTEL_GUC_CT_SEND_NB)
 +		return ct_send_nb(ct, action, len, flags);
 +
  	ret = ct_send(ct, action, len, response_buf, response_buf_size, &status);
@@ -250,15 +257,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
-@@ -9,6 +9,7 @@
- #include <linux/interrupt.h>
- #include <linux/spinlock.h>
- #include <linux/workqueue.h>
-+#include <linux/ktime.h>
- 
- #include "intel_guc_fwif.h"
- 
-@@ -42,7 +43,6 @@ struct intel_guc_ct_buffer {
+@@ -42,7 +42,6 @@ struct intel_guc_ct_buffer {
  	bool broken;
  };
  
@@ -266,19 +265,11 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt
  /** Top-level structure for Command Transport related data
   *
   * Includes a pair of CT buffers for bi-directional communication and tracking
-@@ -69,6 +69,9 @@ struct intel_guc_ct {
- 		struct list_head incoming; /* incoming requests */
- 		struct work_struct worker; /* handler for incoming requests */
- 	} requests;
-+
-+	/** @stall_time: time of first time a CTB submission is stalled */
-+	ktime_t stall_time;
- };
- 
- void intel_guc_ct_init_early(struct intel_guc_ct *ct);
-@@ -88,7 +91,7 @@ static inline bool intel_guc_ct_enabled(const struct intel_guc_ct *ct)
+@@ -87,8 +86,9 @@ static inline bool intel_guc_ct_enabled(struct intel_guc_ct *ct)
+ 	return ct->enabled;
  }
  
++#define INTEL_GUC_CT_SEND_NB		BIT(31)
  int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
 -		      u32 *response_buf, u32 response_buf_size);
 +		      u32 *response_buf, u32 response_buf_size, u32 flags);
diff --git a/0001-INTEL_DII-drm-i915-guc-Optimize-CTB-writes-and-reads.patch b/0001-drm-i915-guc-Optimize-CTB-writes-and-reads.patch
similarity index 57%
rename from 0001-INTEL_DII-drm-i915-guc-Optimize-CTB-writes-and-reads.patch
rename to 0001-drm-i915-guc-Optimize-CTB-writes-and-reads.patch
index 27637e3b4404..d0735525695f 100644
--- a/0001-INTEL_DII-drm-i915-guc-Optimize-CTB-writes-and-reads.patch
+++ b/0001-drm-i915-guc-Optimize-CTB-writes-and-reads.patch
@@ -1,40 +1,47 @@
 From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Matthew Brost <matthew.brost@intel.com>
-Date: Thu, 14 Nov 2019 11:24:58 -0800
-Subject: [PATCH] INTEL_DII: drm/i915/guc: Optimize CTB writes and reads
+Date: Thu, 8 Jul 2021 09:20:54 -0700
+Subject: [PATCH] drm/i915/guc: Optimize CTB writes and reads
 
 CTB writes are now in the path of command submission and should be
 optimized for performance. Rather than reading CTB descriptor values
-(e.g. head, tail, size) which could result in accesses across the PCIe
-bus, store shadow local copies and only read/write the descriptor
-values when absolutely necessary.
+(e.g. head, tail) which could result in accesses across the PCIe bus,
+store shadow local copies and only read/write the descriptor values when
+absolutely necessary. Also store the current space in the each channel
+locally.
 
-v3: Split guc_ct_buffer_init into an additional function
-guc_ct_buffer_desc_init. Split guc_ct_buffer_reset into an additional
-function guc_ct_buffer_desc_reset.
-v4: Updated shadow copies to use dword rather than byte addressing
-after review feedback (JohnH0.
-v5: Rebased after porting CTB updates from upstream (JohnH).
-v6: Fix '|' vs '||' typo (JohnH).
-v7: Trivial merge (Matthew Brost)
-v8: rebase (Michal)
-v9: CT cleanups (Matthew Brost)
-v10: rebase on ctbs.send (Michal)
-v11: rebase on ctbs.lock (Michal)
-v12: rebase on new ctb.descriptor (Michal)
-v13: rebase on new ctb message (Michal)
+v2:
+ (Michal)
+  - Add additional sanity checks for head / tail pointers
+  - Use GUC_CTB_HDR_LEN rather than magic 1
+v3:
+ (Michal / John H)
+  - Drop redundant check of head value
+v4:
+ (John H)
+  - Drop redundant checks of tail / head values
+v5:
+ (Michal)
+  - Address more nits
+v6:
+ (Michal)
+  - Add GEM_BUG_ON sanity check on ctb->space
 
 Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
 Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
+Link: https://patchwork.freedesktop.org/patch/msgid/20210708162055.129996-7-matthew.brost@intel.com
+(cherry picked from commit 75452167a2794c302c7cfd98d3aaa374ec548fe0)
 ---
- drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 78 +++++++++++++----------
+ drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 93 +++++++++++++++--------
  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h |  6 ++
- 2 files changed, 52 insertions(+), 32 deletions(-)
+ 2 files changed, 67 insertions(+), 32 deletions(-)
 
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
-@@ -127,6 +127,10 @@ static void guc_ct_buffer_desc_init(struct guc_ct_buffer_desc *desc)
+@@ -131,6 +131,10 @@ static void guc_ct_buffer_desc_init(struct guc_ct_buffer_desc *desc)
  static void guc_ct_buffer_reset(struct intel_guc_ct_buffer *ctb)
  {
  	ctb->broken = false;
@@ -45,7 +52,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  	guc_ct_buffer_desc_init(ctb->desc);
  }
  
-@@ -371,10 +375,8 @@ static int ct_write(struct intel_guc_ct *ct,
+@@ -384,10 +388,8 @@ static int ct_write(struct intel_guc_ct *ct,
  {
  	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
  	struct guc_ct_buffer_desc *desc = ctb->desc;
@@ -56,17 +63,26 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
 -	u32 used;
  	u32 header;
  	u32 hxg;
- 	u32 *cmds = ctb->cmds;
-@@ -386,25 +388,14 @@ static int ct_write(struct intel_guc_ct *ct,
+ 	u32 type;
+@@ -397,25 +399,22 @@ static int ct_write(struct intel_guc_ct *ct,
  	if (unlikely(desc->status))
  		goto corrupted;
  
 -	if (unlikely((tail | head) >= size)) {
-+#ifdef CONFIG_DRM_I915_DEBUG_GUC
-+	if (unlikely((desc->tail | desc->head) >= size)) {
- 		CT_ERROR(ct, "Invalid offsets head=%u tail=%u (size=%u)\n",
+-		CT_ERROR(ct, "Invalid offsets head=%u tail=%u (size=%u)\n",
 -			 head, tail, size);
-+			 desc->head, desc->tail, size);
++	GEM_BUG_ON(tail > size);
++
++#ifdef CONFIG_DRM_I915_DEBUG_GUC
++	if (unlikely(tail != READ_ONCE(desc->tail))) {
++		CT_ERROR(ct, "Tail was modified %u != %u\n",
++			 desc->tail, tail);
++		desc->status |= GUC_CTB_STATUS_MISMATCH;
++		goto corrupted;
++	}
++	if (unlikely(READ_ONCE(desc->head) >= size)) {
++		CT_ERROR(ct, "Invalid head offset %u >= %u)\n",
++			 desc->head, size);
  		desc->status |= GUC_CTB_STATUS_OVERFLOW;
  		goto corrupted;
  	}
@@ -80,24 +96,26 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
 -	else
 -		used = tail - head;
 -
--	/* make sure there is a space including extra dw for the fence */
--	if (unlikely(used + len + 1 >= size))
+-	/* make sure there is a space including extra dw for the header */
+-	if (unlikely(used + len + GUC_CTB_HDR_LEN >= size))
 -		return -ENOSPC;
 +#endif
  
  	/*
  	 * dw0: CT header (including fence)
-@@ -444,7 +435,9 @@ static int ct_write(struct intel_guc_ct *ct,
+@@ -453,6 +452,11 @@ static int ct_write(struct intel_guc_ct *ct,
+ 	 */
  	write_barrier(ct);
  
- 	/* now update descriptor */
++	/* update local copies */
 +	ctb->tail = tail;
++	GEM_BUG_ON(ctb->space < len + GUC_CTB_HDR_LEN);
++	ctb->space -= len + GUC_CTB_HDR_LEN;
++
+ 	/* now update descriptor */
  	WRITE_ONCE(desc->tail, tail);
-+	ctb->space -= len + 1;
- 
- 	return 0;
  
-@@ -460,7 +453,7 @@ static int ct_write(struct intel_guc_ct *ct,
+@@ -470,7 +474,7 @@ static int ct_write(struct intel_guc_ct *ct,
   * @req:	pointer to pending request
   * @status:	placeholder for status
   *
@@ -106,16 +124,16 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
   * Our message handler will update status of tracked request once
   * response message with given fence is received. Wait here and
   * check for valid response status value.
-@@ -508,24 +501,35 @@ static inline bool ct_deadlocked(struct intel_guc_ct *ct)
+@@ -526,24 +530,36 @@ static inline bool ct_deadlocked(struct intel_guc_ct *ct)
  	return ret;
  }
  
--static inline bool ctb_has_room(struct intel_guc_ct_buffer *ctb, u32 len_dw)
+-static inline bool h2g_has_room(struct intel_guc_ct_buffer *ctb, u32 len_dw)
 +static inline bool h2g_has_room(struct intel_guc_ct *ct, u32 len_dw)
  {
--	struct guc_ct_buffer_desc *desc = ctb->desc;
--	u32 head = READ_ONCE(desc->head);
 +	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
+ 	struct guc_ct_buffer_desc *desc = ctb->desc;
+-	u32 head = READ_ONCE(desc->head);
 +	u32 head;
  	u32 space;
  
@@ -123,11 +141,11 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
 +	if (ctb->space >= len_dw)
 +		return true;
 +
-+	head = READ_ONCE(ctb->desc->head);
++	head = READ_ONCE(desc->head);
 +	if (unlikely(head > ctb->size)) {
-+		CT_ERROR(ct, "Corrupted descriptor head=%u tail=%u size=%u\n",
-+			  ctb->desc->head, ctb->desc->tail, ctb->size);
-+		ctb->desc->status |= GUC_CTB_STATUS_OVERFLOW;
++		CT_ERROR(ct, "Invalid head offset %u >= %u)\n",
++			 head, ctb->size);
++		desc->status |= GUC_CTB_STATUS_OVERFLOW;
 +		ctb->broken = true;
 +		return false;
 +	}
@@ -144,72 +162,61 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
 -
  	lockdep_assert_held(&ct->ctbs.send.lock);
  
--	if (unlikely(!ctb_has_room(ctb, len_dw))) {
+-	if (unlikely(!h2g_has_room(ctb, len_dw))) {
 +	if (unlikely(!h2g_has_room(ct, len_dw))) {
  		if (ct->stall_time == KTIME_MAX)
  			ct->stall_time = ktime_get();
  
-@@ -593,11 +597,11 @@ static int ct_send(struct intel_guc_ct *ct,
- 	 * rare.
+@@ -613,7 +629,7 @@ static int ct_send(struct intel_guc_ct *ct,
  	 */
  retry:
--	spin_lock_irqsave(&ct->ctbs.send.lock, flags);
--	if (unlikely(!ctb_has_room(ctb, len + 1))) {
-+	spin_lock_irqsave(&ctb->lock, flags);
-+	if (unlikely(!h2g_has_room(ct, len + 1))) {
+ 	spin_lock_irqsave(&ctb->lock, flags);
+-	if (unlikely(!h2g_has_room(ctb, len + GUC_CTB_HDR_LEN))) {
++	if (unlikely(!h2g_has_room(ct, len + GUC_CTB_HDR_LEN))) {
  		if (ct->stall_time == KTIME_MAX)
  			ct->stall_time = ktime_get();
--		spin_unlock_irqrestore(&ct->ctbs.send.lock, flags);
-+		spin_unlock_irqrestore(&ctb->lock, flags);
- 
- 		if (unlikely(ct_deadlocked(ct)))
- 			return -EIO;
-@@ -620,7 +624,7 @@ static int ct_send(struct intel_guc_ct *ct,
- 
- 	err = ct_write(ct, action, len, fence, 0);
- 
--	spin_unlock_irqrestore(&ct->ctbs.send.lock, flags);
-+	spin_unlock_irqrestore(&ctb->lock, flags);
- 
- 	if (unlikely(err))
- 		goto unlink;
-@@ -716,7 +720,7 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
+ 		spin_unlock_irqrestore(&ctb->lock, flags);
+@@ -733,8 +749,8 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
  {
  	struct intel_guc_ct_buffer *ctb = &ct->ctbs.recv;
  	struct guc_ct_buffer_desc *desc = ctb->desc;
 -	u32 head = desc->head;
+-	u32 tail = desc->tail;
 +	u32 head = ctb->head;
- 	u32 tail = desc->tail;
++	u32 tail = READ_ONCE(desc->tail);
  	u32 size = ctb->size;
  	u32 *cmds = ctb->cmds;
-@@ -731,12 +735,21 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
+ 	s32 available;
+@@ -748,9 +764,19 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
  	if (unlikely(desc->status))
  		goto corrupted;
  
 -	if (unlikely((tail | head) >= size)) {
+-		CT_ERROR(ct, "Invalid offsets head=%u tail=%u (size=%u)\n",
+-			 head, tail, size);
++	GEM_BUG_ON(head > size);
++
 +#ifdef CONFIG_DRM_I915_DEBUG_GUC
-+	if (unlikely((desc->tail | desc->head) >= size)) {
- 		CT_ERROR(ct, "Invalid offsets head=%u tail=%u (size=%u)\n",
- 			 head, tail, size);
- 		desc->status |= GUC_CTB_STATUS_OVERFLOW;
- 		goto corrupted;
- 	}
-+#else
-+	if (unlikely((tail | ctb->head) >= size)) {
-+		CT_ERROR(ct, "Invalid offsets head=%u tail=%u (size=%u)\n",
-+			 head, tail, size);
-+		desc->status |= GUC_CTB_STATUS_OVERFLOW;
++	if (unlikely(head != READ_ONCE(desc->head))) {
++		CT_ERROR(ct, "Head was modified %u != %u\n",
++			 desc->head, head);
++		desc->status |= GUC_CTB_STATUS_MISMATCH;
 +		goto corrupted;
 +	}
 +#endif
- 
- 	/* tail == head condition indicates empty */
- 	available = tail - head;
-@@ -786,6 +799,7 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
++	if (unlikely(tail >= size)) {
++		CT_ERROR(ct, "Invalid tail offset %u >= %u)\n",
++			 tail, size);
+ 		desc->status |= GUC_CTB_STATUS_OVERFLOW;
+ 		goto corrupted;
+ 	}
+@@ -803,6 +829,9 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
  	}
  	CT_DEBUG(ct, "received %*ph\n", 4 * len, (*msg)->msg);
  
++	/* update local copies */
 +	ctb->head = head;
++
  	/* now update descriptor */
  	WRITE_ONCE(desc->head, head);
  
diff --git a/0001-INTEL_DII-drm-i915-guc-Module-load-failure-test-for-.patch b/0001-drm-i915-guc-Module-load-failure-test-for-CT-buffer-.patch
similarity index 55%
rename from 0001-INTEL_DII-drm-i915-guc-Module-load-failure-test-for-.patch
rename to 0001-drm-i915-guc-Module-load-failure-test-for-CT-buffer-.patch
index 80f918632cb7..cb7f341e0cbc 100644
--- a/0001-INTEL_DII-drm-i915-guc-Module-load-failure-test-for-.patch
+++ b/0001-drm-i915-guc-Module-load-failure-test-for-CT-buffer-.patch
@@ -1,9 +1,17 @@
 From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: John Harrison <John.C.Harrison@Intel.com>
-Date: Thu, 23 Jul 2020 13:04:58 -0700
-Subject: [PATCH] INTEL_DII: drm/i915/guc: Module load failure test for CT
- buffer creation
+Date: Thu, 8 Jul 2021 09:20:55 -0700
+Subject: [PATCH] drm/i915/guc: Module load failure test for CT buffer creation
 
+Add several module failure load inject points in the CT buffer creation
+code path.
+
+Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
+Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
+Link: https://patchwork.freedesktop.org/patch/msgid/20210708162055.129996-8-matthew.brost@intel.com
+(cherry picked from commit 3101e9952bd6fbe9b2ba8bf46d153dcfad77e579)
 ---
  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 8 ++++++++
  1 file changed, 8 insertions(+)
@@ -11,7 +19,7 @@ Subject: [PATCH] INTEL_DII: drm/i915/guc: Module load failure test for CT
 diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
 +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
-@@ -177,6 +177,10 @@ static int ct_register_buffer(struct intel_guc_ct *ct, u32 type,
+@@ -176,6 +176,10 @@ static int ct_register_buffer(struct intel_guc_ct *ct, u32 type,
  {
  	int err;
  
@@ -22,7 +30,7 @@ diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt
  	err = guc_action_register_ct_buffer(ct_to_guc(ct), type,
  					    desc_addr, buff_addr, size);
  	if (unlikely(err))
-@@ -228,6 +232,10 @@ int intel_guc_ct_init(struct intel_guc_ct *ct)
+@@ -227,6 +231,10 @@ int intel_guc_ct_init(struct intel_guc_ct *ct)
  	u32 *cmds;
  	int err;
  
diff --git a/0001-drm-i915-guc-Drop-guc-interrupts.enabled.patch b/0001-drm-i915-guc-Drop-guc-interrupts.enabled.patch
new file mode 100644
index 000000000000..759c9919f79e
--- /dev/null
+++ b/0001-drm-i915-guc-Drop-guc-interrupts.enabled.patch
@@ -0,0 +1,96 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Matthew Brost <matthew.brost@intel.com>
+Date: Wed, 2 Jun 2021 22:16:16 -0700
+Subject: [PATCH] drm/i915/guc: Drop guc->interrupts.enabled
+
+Drop the variable guc->interrupts.enabled as this variable is just
+leading to bugs creeping into the code.
+
+e.g. A full GPU reset disables the GuC interrupts but forgot to clear
+guc->interrupts.enabled, guc->interrupts.enabled being true suppresses
+interrupts from getting re-enabled and now we are broken.
+
+It is harmless to enable interrupt while already enabled so let's just
+delete this variable to avoid bugs like this going forward.
+
+Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
+Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Link: https://patchwork.freedesktop.org/patch/msgid/20210603051630.2635-7-matthew.brost@intel.com
+(cherry picked from commit ded32d381cbb06e9cc8915dbcb92be941e195cda)
+---
+ drivers/gpu/drm/i915/gt/uc/intel_guc.c | 27 +++++++++-----------------
+ drivers/gpu/drm/i915/gt/uc/intel_guc.h |  1 -
+ 2 files changed, 9 insertions(+), 19 deletions(-)
+
+diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
++++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+@@ -96,12 +96,9 @@ static void gen9_enable_guc_interrupts(struct intel_guc *guc)
+ 	assert_rpm_wakelock_held(&gt->i915->runtime_pm);
+ 
+ 	spin_lock_irq(&gt->irq_lock);
+-	if (!guc->interrupts.enabled) {
+-		WARN_ON_ONCE(intel_uncore_read(gt->uncore, GEN8_GT_IIR(2)) &
+-			     gt->pm_guc_events);
+-		guc->interrupts.enabled = true;
+-		gen6_gt_pm_enable_irq(gt, gt->pm_guc_events);
+-	}
++	WARN_ON_ONCE(intel_uncore_read(gt->uncore, GEN8_GT_IIR(2)) &
++		     gt->pm_guc_events);
++	gen6_gt_pm_enable_irq(gt, gt->pm_guc_events);
+ 	spin_unlock_irq(&gt->irq_lock);
+ }
+ 
+@@ -112,7 +109,6 @@ static void gen9_disable_guc_interrupts(struct intel_guc *guc)
+ 	assert_rpm_wakelock_held(&gt->i915->runtime_pm);
+ 
+ 	spin_lock_irq(&gt->irq_lock);
+-	guc->interrupts.enabled = false;
+ 
+ 	gen6_gt_pm_disable_irq(gt, gt->pm_guc_events);
+ 
+@@ -134,18 +130,14 @@ static void gen11_reset_guc_interrupts(struct intel_guc *guc)
+ static void gen11_enable_guc_interrupts(struct intel_guc *guc)
+ {
+ 	struct intel_gt *gt = guc_to_gt(guc);
++	u32 events = REG_FIELD_PREP(ENGINE1_MASK, GUC_INTR_GUC2HOST);
+ 
+ 	spin_lock_irq(&gt->irq_lock);
+-	if (!guc->interrupts.enabled) {
+-		u32 events = REG_FIELD_PREP(ENGINE1_MASK, GUC_INTR_GUC2HOST);
+-
+-		WARN_ON_ONCE(gen11_gt_reset_one_iir(gt, 0, GEN11_GUC));
+-		intel_uncore_write(gt->uncore,
+-				   GEN11_GUC_SG_INTR_ENABLE, events);
+-		intel_uncore_write(gt->uncore,
+-				   GEN11_GUC_SG_INTR_MASK, ~events);
+-		guc->interrupts.enabled = true;
+-	}
++	WARN_ON_ONCE(gen11_gt_reset_one_iir(gt, 0, GEN11_GUC));
++	intel_uncore_write(gt->uncore,
++			   GEN11_GUC_SG_INTR_ENABLE, events);
++	intel_uncore_write(gt->uncore,
++			   GEN11_GUC_SG_INTR_MASK, ~events);
+ 	spin_unlock_irq(&gt->irq_lock);
+ }
+ 
+@@ -154,7 +146,6 @@ static void gen11_disable_guc_interrupts(struct intel_guc *guc)
+ 	struct intel_gt *gt = guc_to_gt(guc);
+ 
+ 	spin_lock_irq(&gt->irq_lock);
+-	guc->interrupts.enabled = false;
+ 
+ 	intel_uncore_write(gt->uncore, GEN11_GUC_SG_INTR_MASK, ~0);
+ 	intel_uncore_write(gt->uncore, GEN11_GUC_SG_INTR_ENABLE, 0);
+diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
++++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+@@ -33,7 +33,6 @@ struct intel_guc {
+ 	unsigned int msg_enabled_mask;
+ 
+ 	struct {
+-		bool enabled;
+ 		void (*reset)(struct intel_guc *guc);
+ 		void (*enable)(struct intel_guc *guc);
+ 		void (*disable)(struct intel_guc *guc);
diff --git a/0001-drm-i915-guc-Ensure-H2G-buffer-updates-visible-befor.patch b/0001-drm-i915-guc-Ensure-H2G-buffer-updates-visible-befor.patch
new file mode 100644
index 000000000000..a5151c56ed2a
--- /dev/null
+++ b/0001-drm-i915-guc-Ensure-H2G-buffer-updates-visible-befor.patch
@@ -0,0 +1,79 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Matthew Brost <matthew.brost@intel.com>
+Date: Wed, 2 Jun 2021 22:16:25 -0700
+Subject: [PATCH] drm/i915/guc: Ensure H2G buffer updates visible before tail
+ update
+
+Ensure H2G buffer updates are visible before descriptor tail updates by
+inserting a barrier between the H2G buffer update and the tail. The
+barrier is simple wmb() for SMEM and is register write for LMEM. This is
+needed if more than 1 H2G can be inflight at once.
+
+If this barrier is not inserted it is possible the descriptor tail
+update is scene by the GuC before H2G buffer update which results in the
+GuC reading a corrupt H2G value. This can bring down the H2G channel
+among other bad things.
+
+Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
+Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
+Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Link: https://patchwork.freedesktop.org/patch/msgid/20210603051630.2635-16-matthew.brost@intel.com
+(cherry picked from commit d35ca600873eebceb071af81bdc279fb6ec538db)
+---
+ drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 29 +++++++++++++++++++++++
+ 1 file changed, 29 insertions(+)
+
+diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
++++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+@@ -6,6 +6,7 @@
+ #include "i915_drv.h"
+ #include "intel_guc_ct.h"
+ #include "gt/intel_gt.h"
++#include "gem/i915_gem_lmem.h"
+ 
+ static inline struct intel_guc *ct_to_guc(struct intel_guc_ct *ct)
+ {
+@@ -328,6 +329,28 @@ static u32 ct_get_next_fence(struct intel_guc_ct *ct)
+ 	return ++ct->requests.last_fence;
+ }
+ 
++static void write_barrier(struct intel_guc_ct *ct)
++{
++	struct intel_guc *guc = ct_to_guc(ct);
++	struct intel_gt *gt = guc_to_gt(guc);
++
++	if (i915_gem_object_is_lmem(guc->ct.vma->obj)) {
++		GEM_BUG_ON(guc->send_regs.fw_domains);
++		/*
++		 * This register is used by the i915 and GuC for MMIO based
++		 * communication. Once we are in this code CTBs are the only
++		 * method the i915 uses to communicate with the GuC so it is
++		 * safe to write to this register (a value of 0 is NOP for MMIO
++		 * communication). If we ever start mixing CTBs and MMIOs a new
++		 * register will have to be chosen.
++		 */
++		intel_uncore_write_fw(gt->uncore, GEN11_SOFT_SCRATCH(0), 0);
++	} else {
++		/* wmb() sufficient for a barrier if in smem */
++		wmb();
++	}
++}
++
+ /**
+  * DOC: CTB Host to GuC request
+  *
+@@ -411,6 +434,12 @@ static int ct_write(struct intel_guc_ct *ct,
+ 	}
+ 	GEM_BUG_ON(tail > size);
+ 
++	/*
++	 * make sure H2G buffer update and LRC tail update (if this triggering a
++	 * submission) are visible before updating the descriptor tail
++	 */
++	write_barrier(ct);
++
+ 	/* now update desc tail (back in bytes) */
+ 	desc->tail = tail * 4;
+ 	return 0;
diff --git a/0001-drm-i915-guc-Update-firmware-to-v62.0.0.patch b/0001-drm-i915-guc-Update-firmware-to-v62.0.0.patch
new file mode 100644
index 000000000000..f734b7822730
--- /dev/null
+++ b/0001-drm-i915-guc-Update-firmware-to-v62.0.0.patch
@@ -0,0 +1,1510 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Michal Wajdeczko <michal.wajdeczko@intel.com>
+Date: Tue, 15 Jun 2021 17:13:01 -0700
+Subject: [PATCH] drm/i915/guc: Update firmware to v62.0.0
+
+Most of the changes to the 62.0.0 firmware revolved around CTB
+communication channel. Conform to the new (stable) CTB protocol.
+
+v2:
+ (Michal)
+  Add values back to kernel DOC for actions
+ (Docs)
+  Add 'CT buffer' back in to fix warning
+
+Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
+Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
+[mattrope: Tweaked kerneldoc while pushing as suggested by Daniele/Michal]
+Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+Link: https://patchwork.freedesktop.org/patch/msgid/20210616001302.84233-3-matthew.brost@intel.com
+(cherry picked from commit 572f2a5cd9742c52f6d4d659409180168a169a24)
+---
+ .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  | 107 ++++++
+ .../gt/uc/abi/guc_communication_ctb_abi.h     | 126 +++++--
+ .../gt/uc/abi/guc_communication_mmio_abi.h    |  65 ++--
+ drivers/gpu/drm/i915/gt/uc/intel_guc.c        | 107 ++++--
+ drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  45 +--
+ drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 356 +++++++++---------
+ drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |   6 +-
+ drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  75 +---
+ drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    |  29 +-
+ drivers/gpu/drm/i915/gt/uc/intel_guc_log.h    |   6 +-
+ drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  26 +-
+ 11 files changed, 527 insertions(+), 421 deletions(-)
+
+diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
+--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
++++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
+@@ -6,6 +6,113 @@
+ #ifndef _ABI_GUC_ACTIONS_ABI_H
+ #define _ABI_GUC_ACTIONS_ABI_H
+ 
++/**
++ * DOC: HOST2GUC_REGISTER_CTB
++ *
++ * This message is used as part of the `CTB based communication`_ setup.
++ *
++ * This message must be sent as `MMIO HXG Message`_.
++ *
++ *  +---+-------+--------------------------------------------------------------+
++ *  |   | Bits  | Description                                                  |
++ *  +===+=======+==============================================================+
++ *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
++ *  |   +-------+--------------------------------------------------------------+
++ *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
++ *  |   +-------+--------------------------------------------------------------+
++ *  |   | 27:16 | DATA0 = MBZ                                                  |
++ *  |   +-------+--------------------------------------------------------------+
++ *  |   |  15:0 | ACTION = _`GUC_ACTION_HOST2GUC_REGISTER_CTB` = 0x4505        |
++ *  +---+-------+--------------------------------------------------------------+
++ *  | 1 | 31:12 | RESERVED = MBZ                                               |
++ *  |   +-------+--------------------------------------------------------------+
++ *  |   |  11:8 | **TYPE** - type for the `CT Buffer`_                         |
++ *  |   |       |                                                              |
++ *  |   |       |   - _`GUC_CTB_TYPE_HOST2GUC` = 0                             |
++ *  |   |       |   - _`GUC_CTB_TYPE_GUC2HOST` = 1                             |
++ *  |   +-------+--------------------------------------------------------------+
++ *  |   |   7:0 | **SIZE** - size of the `CT Buffer`_ in 4K units minus 1      |
++ *  +---+-------+--------------------------------------------------------------+
++ *  | 2 |  31:0 | **DESC_ADDR** - GGTT address of the `CTB Descriptor`_        |
++ *  +---+-------+--------------------------------------------------------------+
++ *  | 3 |  31:0 | **BUFF_ADDF** - GGTT address of the `CT Buffer`_             |
++ *  +---+-------+--------------------------------------------------------------+
++ *
++ *  +---+-------+--------------------------------------------------------------+
++ *  |   | Bits  | Description                                                  |
++ *  +===+=======+==============================================================+
++ *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
++ *  |   +-------+--------------------------------------------------------------+
++ *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
++ *  |   +-------+--------------------------------------------------------------+
++ *  |   |  27:0 | DATA0 = MBZ                                                  |
++ *  +---+-------+--------------------------------------------------------------+
++ */
++#define GUC_ACTION_HOST2GUC_REGISTER_CTB		0x4505
++
++#define HOST2GUC_REGISTER_CTB_REQUEST_MSG_LEN		(GUC_HXG_REQUEST_MSG_MIN_LEN + 3u)
++#define HOST2GUC_REGISTER_CTB_REQUEST_MSG_0_MBZ		GUC_HXG_REQUEST_MSG_0_DATA0
++#define HOST2GUC_REGISTER_CTB_REQUEST_MSG_1_MBZ		(0xfffff << 12)
++#define HOST2GUC_REGISTER_CTB_REQUEST_MSG_1_TYPE	(0xf << 8)
++#define   GUC_CTB_TYPE_HOST2GUC				0u
++#define   GUC_CTB_TYPE_GUC2HOST				1u
++#define HOST2GUC_REGISTER_CTB_REQUEST_MSG_1_SIZE	(0xff << 0)
++#define HOST2GUC_REGISTER_CTB_REQUEST_MSG_2_DESC_ADDR	GUC_HXG_REQUEST_MSG_n_DATAn
++#define HOST2GUC_REGISTER_CTB_REQUEST_MSG_3_BUFF_ADDR	GUC_HXG_REQUEST_MSG_n_DATAn
++
++#define HOST2GUC_REGISTER_CTB_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
++#define HOST2GUC_REGISTER_CTB_RESPONSE_MSG_0_MBZ	GUC_HXG_RESPONSE_MSG_0_DATA0
++
++/**
++ * DOC: HOST2GUC_DEREGISTER_CTB
++ *
++ * This message is used as part of the `CTB based communication`_ teardown.
++ *
++ * This message must be sent as `MMIO HXG Message`_.
++ *
++ *  +---+-------+--------------------------------------------------------------+
++ *  |   | Bits  | Description                                                  |
++ *  +===+=======+==============================================================+
++ *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
++ *  |   +-------+--------------------------------------------------------------+
++ *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
++ *  |   +-------+--------------------------------------------------------------+
++ *  |   | 27:16 | DATA0 = MBZ                                                  |
++ *  |   +-------+--------------------------------------------------------------+
++ *  |   |  15:0 | ACTION = _`GUC_ACTION_HOST2GUC_DEREGISTER_CTB` = 0x4506      |
++ *  +---+-------+--------------------------------------------------------------+
++ *  | 1 | 31:12 | RESERVED = MBZ                                               |
++ *  |   +-------+--------------------------------------------------------------+
++ *  |   |  11:8 | **TYPE** - type of the `CT Buffer`_                          |
++ *  |   |       |                                                              |
++ *  |   |       | see `GUC_ACTION_HOST2GUC_REGISTER_CTB`_                      |
++ *  |   +-------+--------------------------------------------------------------+
++ *  |   |   7:0 | RESERVED = MBZ                                               |
++ *  +---+-------+--------------------------------------------------------------+
++ *
++ *  +---+-------+--------------------------------------------------------------+
++ *  |   | Bits  | Description                                                  |
++ *  +===+=======+==============================================================+
++ *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
++ *  |   +-------+--------------------------------------------------------------+
++ *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
++ *  |   +-------+--------------------------------------------------------------+
++ *  |   |  27:0 | DATA0 = MBZ                                                  |
++ *  +---+-------+--------------------------------------------------------------+
++ */
++#define GUC_ACTION_HOST2GUC_DEREGISTER_CTB		0x4506
++
++#define HOST2GUC_DEREGISTER_CTB_REQUEST_MSG_LEN		(GUC_HXG_REQUEST_MSG_MIN_LEN + 1u)
++#define HOST2GUC_DEREGISTER_CTB_REQUEST_MSG_0_MBZ	GUC_HXG_REQUEST_MSG_0_DATA0
++#define HOST2GUC_DEREGISTER_CTB_REQUEST_MSG_1_MBZ	(0xfffff << 12)
++#define HOST2GUC_DEREGISTER_CTB_REQUEST_MSG_1_TYPE	(0xf << 8)
++#define HOST2GUC_DEREGISTER_CTB_REQUEST_MSG_1_MBZ2	(0xff << 0)
++
++#define HOST2GUC_DEREGISTER_CTB_RESPONSE_MSG_LEN	GUC_HXG_RESPONSE_MSG_MIN_LEN
++#define HOST2GUC_DEREGISTER_CTB_RESPONSE_MSG_0_MBZ	GUC_HXG_RESPONSE_MSG_0_DATA0
++
++/* legacy definitions */
++
+ enum intel_guc_action {
+ 	INTEL_GUC_ACTION_DEFAULT = 0x0,
+ 	INTEL_GUC_ACTION_REQUEST_PREEMPTION = 0x2,
+diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
+--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
++++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
+@@ -7,6 +7,110 @@
+ #define _ABI_GUC_COMMUNICATION_CTB_ABI_H
+ 
+ #include <linux/types.h>
++#include <linux/build_bug.h>
++
++#include "guc_messages_abi.h"
++
++/**
++ * DOC: CT Buffer
++ *
++ * Circular buffer used to send `CTB Message`_
++ */
++
++/**
++ * DOC: CTB Descriptor
++ *
++ *  +---+-------+--------------------------------------------------------------+
++ *  |   | Bits  | Description                                                  |
++ *  +===+=======+==============================================================+
++ *  | 0 |  31:0 | **HEAD** - offset (in dwords) to the last dword that was     |
++ *  |   |       | read from the `CT Buffer`_.                                  |
++ *  |   |       | It can only be updated by the receiver.                      |
++ *  +---+-------+--------------------------------------------------------------+
++ *  | 1 |  31:0 | **TAIL** - offset (in dwords) to the last dword that was     |
++ *  |   |       | written to the `CT Buffer`_.                                 |
++ *  |   |       | It can only be updated by the sender.                        |
++ *  +---+-------+--------------------------------------------------------------+
++ *  | 2 |  31:0 | **STATUS** - status of the CTB                               |
++ *  |   |       |                                                              |
++ *  |   |       |   - _`GUC_CTB_STATUS_NO_ERROR` = 0 (normal operation)        |
++ *  |   |       |   - _`GUC_CTB_STATUS_OVERFLOW` = 1 (head/tail too large)     |
++ *  |   |       |   - _`GUC_CTB_STATUS_UNDERFLOW` = 2 (truncated message)      |
++ *  |   |       |   - _`GUC_CTB_STATUS_MISMATCH` = 4 (head/tail modified)      |
++ *  +---+-------+--------------------------------------------------------------+
++ *  |...|       | RESERVED = MBZ                                               |
++ *  +---+-------+--------------------------------------------------------------+
++ *  | 15|  31:0 | RESERVED = MBZ                                               |
++ *  +---+-------+--------------------------------------------------------------+
++ */
++
++struct guc_ct_buffer_desc {
++	u32 head;
++	u32 tail;
++	u32 status;
++#define GUC_CTB_STATUS_NO_ERROR				0
++#define GUC_CTB_STATUS_OVERFLOW				(1 << 0)
++#define GUC_CTB_STATUS_UNDERFLOW			(1 << 1)
++#define GUC_CTB_STATUS_MISMATCH				(1 << 2)
++	u32 reserved[13];
++} __packed;
++static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
++
++/**
++ * DOC: CTB Message
++ *
++ *  +---+-------+--------------------------------------------------------------+
++ *  |   | Bits  | Description                                                  |
++ *  +===+=======+==============================================================+
++ *  | 0 | 31:16 | **FENCE** - message identifier                               |
++ *  |   +-------+--------------------------------------------------------------+
++ *  |   | 15:12 | **FORMAT** - format of the CTB message                       |
++ *  |   |       |  - _`GUC_CTB_FORMAT_HXG` = 0 - see `CTB HXG Message`_        |
++ *  |   +-------+--------------------------------------------------------------+
++ *  |   |  11:8 | **RESERVED**                                                 |
++ *  |   +-------+--------------------------------------------------------------+
++ *  |   |   7:0 | **NUM_DWORDS** - length of the CTB message (w/o header)      |
++ *  +---+-------+--------------------------------------------------------------+
++ *  | 1 |  31:0 | optional (depends on FORMAT)                                 |
++ *  +---+-------+                                                              |
++ *  |...|       |                                                              |
++ *  +---+-------+                                                              |
++ *  | n |  31:0 |                                                              |
++ *  +---+-------+--------------------------------------------------------------+
++ */
++
++#define GUC_CTB_MSG_MIN_LEN			1u
++#define GUC_CTB_MSG_MAX_LEN			256u
++#define GUC_CTB_MSG_0_FENCE			(0xffff << 16)
++#define GUC_CTB_MSG_0_FORMAT			(0xf << 12)
++#define   GUC_CTB_FORMAT_HXG			0u
++#define GUC_CTB_MSG_0_RESERVED			(0xf << 8)
++#define GUC_CTB_MSG_0_NUM_DWORDS		(0xff << 0)
++
++/**
++ * DOC: CTB HXG Message
++ *
++ *  +---+-------+--------------------------------------------------------------+
++ *  |   | Bits  | Description                                                  |
++ *  +===+=======+==============================================================+
++ *  | 0 | 31:16 | FENCE                                                        |
++ *  |   +-------+--------------------------------------------------------------+
++ *  |   | 15:12 | FORMAT = GUC_CTB_FORMAT_HXG_                                 |
++ *  |   +-------+--------------------------------------------------------------+
++ *  |   |  11:8 | RESERVED = MBZ                                               |
++ *  |   +-------+--------------------------------------------------------------+
++ *  |   |   7:0 | NUM_DWORDS = length (in dwords) of the embedded HXG message  |
++ *  +---+-------+--------------------------------------------------------------+
++ *  | 1 |  31:0 |  +--------------------------------------------------------+  |
++ *  +---+-------+  |                                                        |  |
++ *  |...|       |  |  Embedded `HXG Message`_                               |  |
++ *  +---+-------+  |                                                        |  |
++ *  | n |  31:0 |  +--------------------------------------------------------+  |
++ *  +---+-------+--------------------------------------------------------------+
++ */
++
++#define GUC_CTB_HXG_MSG_MIN_LEN		(GUC_CTB_MSG_MIN_LEN + GUC_HXG_MSG_MIN_LEN)
++#define GUC_CTB_HXG_MSG_MAX_LEN		GUC_CTB_MSG_MAX_LEN
+ 
+ /**
+  * DOC: CTB based communication
+@@ -60,28 +164,6 @@
+  * - **flags**, holds various bits to control message handling
+  */
+ 
+-/*
+- * Describes single command transport buffer.
+- * Used by both guc-master and clients.
+- */
+-struct guc_ct_buffer_desc {
+-	u32 addr;		/* gfx address */
+-	u64 host_private;	/* host private data */
+-	u32 size;		/* size in bytes */
+-	u32 head;		/* offset updated by GuC*/
+-	u32 tail;		/* offset updated by owner */
+-	u32 is_in_error;	/* error indicator */
+-	u32 reserved1;
+-	u32 reserved2;
+-	u32 owner;		/* id of the channel owner */
+-	u32 owner_sub_id;	/* owner-defined field for extra tracking */
+-	u32 reserved[5];
+-} __packed;
+-
+-/* Type of command transport buffer */
+-#define INTEL_GUC_CT_BUFFER_TYPE_SEND	0x0u
+-#define INTEL_GUC_CT_BUFFER_TYPE_RECV	0x1u
+-
+ /*
+  * Definition of the command transport message header (DW0)
+  *
+diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h
+--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h
++++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h
+@@ -7,46 +7,43 @@
+ #define _ABI_GUC_COMMUNICATION_MMIO_ABI_H
+ 
+ /**
+- * DOC: MMIO based communication
++ * DOC: GuC MMIO based communication
+  *
+- * The MMIO based communication between Host and GuC uses software scratch
+- * registers, where first register holds data treated as message header,
+- * and other registers are used to hold message payload.
++ * The MMIO based communication between Host and GuC relies on special
++ * hardware registers which format could be defined by the software
++ * (so called scratch registers).
+  *
+- * For Gen9+, GuC uses software scratch registers 0xC180-0xC1B8,
+- * but no H2G command takes more than 8 parameters and the GuC FW
+- * itself uses an 8-element array to store the H2G message.
++ * Each MMIO based message, both Host to GuC (H2G) and GuC to Host (G2H)
++ * messages, which maximum length depends on number of available scratch
++ * registers, is directly written into those scratch registers.
+  *
+- *      +-----------+---------+---------+---------+
+- *      |  MMIO[0]  | MMIO[1] |   ...   | MMIO[n] |
+- *      +-----------+---------+---------+---------+
+- *      | header    |      optional payload       |
+- *      +======+====+=========+=========+=========+
+- *      | 31:28|type|         |         |         |
+- *      +------+----+         |         |         |
+- *      | 27:16|data|         |         |         |
+- *      +------+----+         |         |         |
+- *      |  15:0|code|         |         |         |
+- *      +------+----+---------+---------+---------+
++ * For Gen9+, there are 16 software scratch registers 0xC180-0xC1B8,
++ * but no H2G command takes more than 4 parameters and the GuC firmware
++ * itself uses an 4-element array to store the H2G message.
+  *
+- * The message header consists of:
++ * For Gen11+, there are additional 4 registers 0x190240-0x19024C, which
++ * are, regardless on lower count, preferred over legacy ones.
+  *
+- * - **type**, indicates message type
+- * - **code**, indicates message code, is specific for **type**
+- * - **data**, indicates message data, optional, depends on **code**
+- *
+- * The following message **types** are supported:
+- *
+- * - **REQUEST**, indicates Host-to-GuC request, requested GuC action code
+- *   must be priovided in **code** field. Optional action specific parameters
+- *   can be provided in remaining payload registers or **data** field.
+- *
+- * - **RESPONSE**, indicates GuC-to-Host response from earlier GuC request,
+- *   action response status will be provided in **code** field. Optional
+- *   response data can be returned in remaining payload registers or **data**
+- *   field.
++ * The MMIO based communication is mainly used during driver initialization
++ * phase to setup the `CTB based communication`_ that will be used afterwards.
+  */
+ 
+-#define GUC_MAX_MMIO_MSG_LEN		8
++#define GUC_MAX_MMIO_MSG_LEN		4
++
++/**
++ * DOC: MMIO HXG Message
++ *
++ * Format of the MMIO messages follows definitions of `HXG Message`_.
++ *
++ *  +---+-------+--------------------------------------------------------------+
++ *  |   | Bits  | Description                                                  |
++ *  +===+=======+==============================================================+
++ *  | 0 |  31:0 |  +--------------------------------------------------------+  |
++ *  +---+-------+  |                                                        |  |
++ *  |...|       |  |  Embedded `HXG Message`_                               |  |
++ *  +---+-------+  |                                                        |  |
++ *  | n |  31:0 |  +--------------------------------------------------------+  |
++ *  +---+-------+--------------------------------------------------------------+
++ */
+ 
+ #endif /* _ABI_GUC_COMMUNICATION_MMIO_ABI_H */
+diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
++++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+@@ -219,24 +219,19 @@ static u32 guc_ctl_log_params_flags(struct intel_guc *guc)
+ 
+ 	BUILD_BUG_ON(!CRASH_BUFFER_SIZE);
+ 	BUILD_BUG_ON(!IS_ALIGNED(CRASH_BUFFER_SIZE, UNIT));
+-	BUILD_BUG_ON(!DPC_BUFFER_SIZE);
+-	BUILD_BUG_ON(!IS_ALIGNED(DPC_BUFFER_SIZE, UNIT));
+-	BUILD_BUG_ON(!ISR_BUFFER_SIZE);
+-	BUILD_BUG_ON(!IS_ALIGNED(ISR_BUFFER_SIZE, UNIT));
++	BUILD_BUG_ON(!DEBUG_BUFFER_SIZE);
++	BUILD_BUG_ON(!IS_ALIGNED(DEBUG_BUFFER_SIZE, UNIT));
+ 
+ 	BUILD_BUG_ON((CRASH_BUFFER_SIZE / UNIT - 1) >
+ 			(GUC_LOG_CRASH_MASK >> GUC_LOG_CRASH_SHIFT));
+-	BUILD_BUG_ON((DPC_BUFFER_SIZE / UNIT - 1) >
+-			(GUC_LOG_DPC_MASK >> GUC_LOG_DPC_SHIFT));
+-	BUILD_BUG_ON((ISR_BUFFER_SIZE / UNIT - 1) >
+-			(GUC_LOG_ISR_MASK >> GUC_LOG_ISR_SHIFT));
++	BUILD_BUG_ON((DEBUG_BUFFER_SIZE / UNIT - 1) >
++			(GUC_LOG_DEBUG_MASK >> GUC_LOG_DEBUG_SHIFT));
+ 
+ 	flags = GUC_LOG_VALID |
+ 		GUC_LOG_NOTIFY_ON_HALF_FULL |
+ 		FLAG |
+ 		((CRASH_BUFFER_SIZE / UNIT - 1) << GUC_LOG_CRASH_SHIFT) |
+-		((DPC_BUFFER_SIZE / UNIT - 1) << GUC_LOG_DPC_SHIFT) |
+-		((ISR_BUFFER_SIZE / UNIT - 1) << GUC_LOG_ISR_SHIFT) |
++		((DEBUG_BUFFER_SIZE / UNIT - 1) << GUC_LOG_DEBUG_SHIFT) |
+ 		(offset << GUC_LOG_BUF_ADDR_SHIFT);
+ 
+ 	#undef UNIT
+@@ -376,29 +371,27 @@ void intel_guc_fini(struct intel_guc *guc)
+ /*
+  * This function implements the MMIO based host to GuC interface.
+  */
+-int intel_guc_send_mmio(struct intel_guc *guc, const u32 *action, u32 len,
++int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
+ 			u32 *response_buf, u32 response_buf_size)
+ {
++	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
+ 	struct intel_uncore *uncore = guc_to_gt(guc)->uncore;
+-	u32 status;
++	u32 header;
+ 	int i;
+ 	int ret;
+ 
+ 	GEM_BUG_ON(!len);
+ 	GEM_BUG_ON(len > guc->send_regs.count);
+ 
+-	/* We expect only action code */
+-	GEM_BUG_ON(*action & ~INTEL_GUC_MSG_CODE_MASK);
+-
+-	/* If CT is available, we expect to use MMIO only during init/fini */
+-	GEM_BUG_ON(*action != INTEL_GUC_ACTION_REGISTER_COMMAND_TRANSPORT_BUFFER &&
+-		   *action != INTEL_GUC_ACTION_DEREGISTER_COMMAND_TRANSPORT_BUFFER);
++	GEM_BUG_ON(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, request[0]) != GUC_HXG_ORIGIN_HOST);
++	GEM_BUG_ON(FIELD_GET(GUC_HXG_MSG_0_TYPE, request[0]) != GUC_HXG_TYPE_REQUEST);
+ 
+ 	mutex_lock(&guc->send_mutex);
+ 	intel_uncore_forcewake_get(uncore, guc->send_regs.fw_domains);
+ 
++retry:
+ 	for (i = 0; i < len; i++)
+-		intel_uncore_write(uncore, guc_send_reg(guc, i), action[i]);
++		intel_uncore_write(uncore, guc_send_reg(guc, i), request[i]);
+ 
+ 	intel_uncore_posting_read(uncore, guc_send_reg(guc, i - 1));
+ 
+@@ -410,30 +403,74 @@ int intel_guc_send_mmio(struct intel_guc *guc, const u32 *action, u32 len,
+ 	 */
+ 	ret = __intel_wait_for_register_fw(uncore,
+ 					   guc_send_reg(guc, 0),
+-					   INTEL_GUC_MSG_TYPE_MASK,
+-					   INTEL_GUC_MSG_TYPE_RESPONSE <<
+-					   INTEL_GUC_MSG_TYPE_SHIFT,
+-					   10, 10, &status);
+-	/* If GuC explicitly returned an error, convert it to -EIO */
+-	if (!ret && !INTEL_GUC_MSG_IS_RESPONSE_SUCCESS(status))
+-		ret = -EIO;
++					   GUC_HXG_MSG_0_ORIGIN,
++					   FIELD_PREP(GUC_HXG_MSG_0_ORIGIN,
++						      GUC_HXG_ORIGIN_GUC),
++					   10, 10, &header);
++	if (unlikely(ret)) {
++timeout:
++		drm_err(&i915->drm, "mmio request %#x: no reply %x\n",
++			request[0], header);
++		goto out;
++	}
+ 
+-	if (ret) {
+-		DRM_ERROR("MMIO: GuC action %#x failed with error %d %#x\n",
+-			  action[0], ret, status);
++	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) == GUC_HXG_TYPE_NO_RESPONSE_BUSY) {
++#define done ({ header = intel_uncore_read(uncore, guc_send_reg(guc, 0)); \
++		FIELD_GET(GUC_HXG_MSG_0_ORIGIN, header) != GUC_HXG_ORIGIN_GUC || \
++		FIELD_GET(GUC_HXG_MSG_0_TYPE, header) != GUC_HXG_TYPE_NO_RESPONSE_BUSY; })
++
++		ret = wait_for(done, 1000);
++		if (unlikely(ret))
++			goto timeout;
++		if (unlikely(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, header) !=
++				       GUC_HXG_ORIGIN_GUC))
++			goto proto;
++#undef done
++	}
++
++	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) == GUC_HXG_TYPE_NO_RESPONSE_RETRY) {
++		u32 reason = FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, header);
++
++		drm_dbg(&i915->drm, "mmio request %#x: retrying, reason %u\n",
++			request[0], reason);
++		goto retry;
++	}
++
++	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) == GUC_HXG_TYPE_RESPONSE_FAILURE) {
++		u32 hint = FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, header);
++		u32 error = FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, header);
++
++		drm_err(&i915->drm, "mmio request %#x: failure %x/%u\n",
++			request[0], error, hint);
++		ret = -ENXIO;
++		goto out;
++	}
++
++	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) != GUC_HXG_TYPE_RESPONSE_SUCCESS) {
++proto:
++		drm_err(&i915->drm, "mmio request %#x: unexpected reply %#x\n",
++			request[0], header);
++		ret = -EPROTO;
+ 		goto out;
+ 	}
+ 
+ 	if (response_buf) {
+-		int count = min(response_buf_size, guc->send_regs.count - 1);
++		int count = min(response_buf_size, guc->send_regs.count);
+ 
+-		for (i = 0; i < count; i++)
++		GEM_BUG_ON(!count);
++
++		response_buf[0] = header;
++
++		for (i = 1; i < count; i++)
+ 			response_buf[i] = intel_uncore_read(uncore,
+-							    guc_send_reg(guc, i + 1));
+-	}
++							    guc_send_reg(guc, i));
+ 
+-	/* Use data from the GuC response as our return value */
+-	ret = INTEL_GUC_MSG_TO_DATA(status);
++		/* Use number of copied dwords as our return value */
++		ret = count;
++	} else {
++		/* Use data from the GuC response as our return value */
++		ret = FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, header);
++	}
+ 
+ out:
+ 	intel_uncore_forcewake_put(uncore, guc->send_regs.fw_domains);
+diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
++++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+@@ -24,10 +24,6 @@
+  *      +---------------------------------------+
+  *      | guc_gt_system_info                    |
+  *      +---------------------------------------+
+- *      | guc_clients_info                      |
+- *      +---------------------------------------+
+- *      | guc_ct_pool_entry[size]               |
+- *      +---------------------------------------+
+  *      | padding                               |
+  *      +---------------------------------------+ <== 4K aligned
+  *      | private data                          |
+@@ -39,8 +35,6 @@ struct __guc_ads_blob {
+ 	struct guc_ads ads;
+ 	struct guc_policies policies;
+ 	struct guc_gt_system_info system_info;
+-	struct guc_clients_info clients_info;
+-	struct guc_ct_pool_entry ct_pool[GUC_CT_POOL_SIZE];
+ } __packed;
+ 
+ static u32 guc_ads_private_data_size(struct intel_guc *guc)
+@@ -59,38 +53,15 @@ static u32 guc_ads_blob_size(struct intel_guc *guc)
+ 	       guc_ads_private_data_size(guc);
+ }
+ 
+-static void guc_policy_init(struct guc_policy *policy)
+-{
+-	policy->execution_quantum = POLICY_DEFAULT_EXECUTION_QUANTUM_US;
+-	policy->preemption_time = POLICY_DEFAULT_PREEMPTION_TIME_US;
+-	policy->fault_time = POLICY_DEFAULT_FAULT_TIME_US;
+-	policy->policy_flags = 0;
+-}
+-
+ static void guc_policies_init(struct guc_policies *policies)
+ {
+-	struct guc_policy *policy;
+-	u32 p, i;
+-
+-	policies->dpc_promote_time = POLICY_DEFAULT_DPC_PROMOTE_TIME_US;
+-	policies->max_num_work_items = POLICY_MAX_NUM_WI;
+-
+-	for (p = 0; p < GUC_CLIENT_PRIORITY_NUM; p++) {
+-		for (i = 0; i < GUC_MAX_ENGINE_CLASSES; i++) {
+-			policy = &policies->policy[p][i];
+-
+-			guc_policy_init(policy);
+-		}
+-	}
+-
++	policies->dpc_promote_time = GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US;
++	policies->max_num_work_items = GLOBAL_POLICY_MAX_NUM_WI;
++	/* Disable automatic resets as not yet supported. */
++	policies->global_flags = GLOBAL_POLICY_DISABLE_ENGINE_RESET;
+ 	policies->is_valid = 1;
+ }
+ 
+-static void guc_ct_pool_entries_init(struct guc_ct_pool_entry *pool, u32 num)
+-{
+-	memset(pool, 0, num * sizeof(*pool));
+-}
+-
+ static void guc_mapping_table_init(struct intel_gt *gt,
+ 				   struct guc_gt_system_info *system_info)
+ {
+@@ -178,17 +149,9 @@ static void __guc_ads_init(struct intel_guc *guc)
+ 
+ 	base = intel_guc_ggtt_offset(guc, guc->ads_vma);
+ 
+-	/* Clients info  */
+-	guc_ct_pool_entries_init(blob->ct_pool, ARRAY_SIZE(blob->ct_pool));
+-
+-	blob->clients_info.clients_num = 1;
+-	blob->clients_info.ct_pool_addr = base + ptr_offset(blob, ct_pool);
+-	blob->clients_info.ct_pool_count = ARRAY_SIZE(blob->ct_pool);
+-
+ 	/* ADS */
+ 	blob->ads.scheduler_policies = base + ptr_offset(blob, policies);
+ 	blob->ads.gt_system_info = base + ptr_offset(blob, system_info);
+-	blob->ads.clients_info = base + ptr_offset(blob, clients_info);
+ 
+ 	/* Private Data */
+ 	blob->ads.private_data = base + guc_ads_private_data_offset(guc);
+diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
++++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+@@ -104,61 +104,66 @@ void intel_guc_ct_init_early(struct intel_guc_ct *ct)
+ static inline const char *guc_ct_buffer_type_to_str(u32 type)
+ {
+ 	switch (type) {
+-	case INTEL_GUC_CT_BUFFER_TYPE_SEND:
++	case GUC_CTB_TYPE_HOST2GUC:
+ 		return "SEND";
+-	case INTEL_GUC_CT_BUFFER_TYPE_RECV:
++	case GUC_CTB_TYPE_GUC2HOST:
+ 		return "RECV";
+ 	default:
+ 		return "<invalid>";
+ 	}
+ }
+ 
+-static void guc_ct_buffer_desc_init(struct guc_ct_buffer_desc *desc,
+-				    u32 cmds_addr, u32 size)
++static void guc_ct_buffer_desc_init(struct guc_ct_buffer_desc *desc)
+ {
+ 	memset(desc, 0, sizeof(*desc));
+-	desc->addr = cmds_addr;
+-	desc->size = size;
+-	desc->owner = CTB_OWNER_HOST;
+ }
+ 
+-static void guc_ct_buffer_reset(struct intel_guc_ct_buffer *ctb, u32 cmds_addr)
++static void guc_ct_buffer_reset(struct intel_guc_ct_buffer *ctb)
+ {
+-	guc_ct_buffer_desc_init(ctb->desc, cmds_addr, ctb->size);
++	ctb->broken = false;
++	guc_ct_buffer_desc_init(ctb->desc);
+ }
+ 
+ static void guc_ct_buffer_init(struct intel_guc_ct_buffer *ctb,
+ 			       struct guc_ct_buffer_desc *desc,
+-			       u32 *cmds, u32 size)
++			       u32 *cmds, u32 size_in_bytes)
+ {
+-	GEM_BUG_ON(size % 4);
++	GEM_BUG_ON(size_in_bytes % 4);
+ 
+ 	ctb->desc = desc;
+ 	ctb->cmds = cmds;
+-	ctb->size = size;
++	ctb->size = size_in_bytes / 4;
+ 
+-	guc_ct_buffer_reset(ctb, 0);
++	guc_ct_buffer_reset(ctb);
+ }
+ 
+-static int guc_action_register_ct_buffer(struct intel_guc *guc,
+-					 u32 desc_addr,
+-					 u32 type)
++static int guc_action_register_ct_buffer(struct intel_guc *guc, u32 type,
++					 u32 desc_addr, u32 buff_addr, u32 size)
+ {
+-	u32 action[] = {
+-		INTEL_GUC_ACTION_REGISTER_COMMAND_TRANSPORT_BUFFER,
+-		desc_addr,
+-		sizeof(struct guc_ct_buffer_desc),
+-		type
++	u32 request[HOST2GUC_REGISTER_CTB_REQUEST_MSG_LEN] = {
++		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
++		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
++		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_HOST2GUC_REGISTER_CTB),
++		FIELD_PREP(HOST2GUC_REGISTER_CTB_REQUEST_MSG_1_SIZE, size / SZ_4K - 1) |
++		FIELD_PREP(HOST2GUC_REGISTER_CTB_REQUEST_MSG_1_TYPE, type),
++		FIELD_PREP(HOST2GUC_REGISTER_CTB_REQUEST_MSG_2_DESC_ADDR, desc_addr),
++		FIELD_PREP(HOST2GUC_REGISTER_CTB_REQUEST_MSG_3_BUFF_ADDR, buff_addr),
+ 	};
+ 
+-	/* Can't use generic send(), CT registration must go over MMIO */
+-	return intel_guc_send_mmio(guc, action, ARRAY_SIZE(action), NULL, 0);
++	GEM_BUG_ON(type != GUC_CTB_TYPE_HOST2GUC && type != GUC_CTB_TYPE_GUC2HOST);
++	GEM_BUG_ON(size % SZ_4K);
++
++	/* CT registration must go over MMIO */
++	return intel_guc_send_mmio(guc, request, ARRAY_SIZE(request), NULL, 0);
+ }
+ 
+-static int ct_register_buffer(struct intel_guc_ct *ct, u32 desc_addr, u32 type)
++static int ct_register_buffer(struct intel_guc_ct *ct, u32 type,
++			      u32 desc_addr, u32 buff_addr, u32 size)
+ {
+-	int err = guc_action_register_ct_buffer(ct_to_guc(ct), desc_addr, type);
++	int err;
+ 
++	err = guc_action_register_ct_buffer(ct_to_guc(ct), type,
++					    desc_addr, buff_addr, size);
+ 	if (unlikely(err))
+ 		CT_ERROR(ct, "Failed to register %s buffer (err=%d)\n",
+ 			 guc_ct_buffer_type_to_str(type), err);
+@@ -167,14 +172,17 @@ static int ct_register_buffer(struct intel_guc_ct *ct, u32 desc_addr, u32 type)
+ 
+ static int guc_action_deregister_ct_buffer(struct intel_guc *guc, u32 type)
+ {
+-	u32 action[] = {
+-		INTEL_GUC_ACTION_DEREGISTER_COMMAND_TRANSPORT_BUFFER,
+-		CTB_OWNER_HOST,
+-		type
++	u32 request[HOST2GUC_DEREGISTER_CTB_REQUEST_MSG_LEN] = {
++		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
++		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
++		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_HOST2GUC_DEREGISTER_CTB),
++		FIELD_PREP(HOST2GUC_DEREGISTER_CTB_REQUEST_MSG_1_TYPE, type),
+ 	};
+ 
+-	/* Can't use generic send(), CT deregistration must go over MMIO */
+-	return intel_guc_send_mmio(guc, action, ARRAY_SIZE(action), NULL, 0);
++	GEM_BUG_ON(type != GUC_CTB_TYPE_HOST2GUC && type != GUC_CTB_TYPE_GUC2HOST);
++
++	/* CT deregistration must go over MMIO */
++	return intel_guc_send_mmio(guc, request, ARRAY_SIZE(request), NULL, 0);
+ }
+ 
+ static int ct_deregister_buffer(struct intel_guc_ct *ct, u32 type)
+@@ -262,7 +270,7 @@ void intel_guc_ct_fini(struct intel_guc_ct *ct)
+ int intel_guc_ct_enable(struct intel_guc_ct *ct)
+ {
+ 	struct intel_guc *guc = ct_to_guc(ct);
+-	u32 base, cmds;
++	u32 base, desc, cmds;
+ 	void *blob;
+ 	int err;
+ 
+@@ -278,23 +286,26 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
+ 	GEM_BUG_ON(blob != ct->ctbs.send.desc);
+ 
+ 	/* (re)initialize descriptors */
+-	cmds = base + ptrdiff(ct->ctbs.send.cmds, blob);
+-	guc_ct_buffer_reset(&ct->ctbs.send, cmds);
+-
+-	cmds = base + ptrdiff(ct->ctbs.recv.cmds, blob);
+-	guc_ct_buffer_reset(&ct->ctbs.recv, cmds);
++	guc_ct_buffer_reset(&ct->ctbs.send);
++	guc_ct_buffer_reset(&ct->ctbs.recv);
+ 
+ 	/*
+ 	 * Register both CT buffers starting with RECV buffer.
+ 	 * Descriptors are in first half of the blob.
+ 	 */
+-	err = ct_register_buffer(ct, base + ptrdiff(ct->ctbs.recv.desc, blob),
+-				 INTEL_GUC_CT_BUFFER_TYPE_RECV);
++	desc = base + ptrdiff(ct->ctbs.recv.desc, blob);
++	cmds = base + ptrdiff(ct->ctbs.recv.cmds, blob);
++	err = ct_register_buffer(ct, GUC_CTB_TYPE_GUC2HOST,
++				 desc, cmds, ct->ctbs.recv.size * 4);
++
+ 	if (unlikely(err))
+ 		goto err_out;
+ 
+-	err = ct_register_buffer(ct, base + ptrdiff(ct->ctbs.send.desc, blob),
+-				 INTEL_GUC_CT_BUFFER_TYPE_SEND);
++	desc = base + ptrdiff(ct->ctbs.send.desc, blob);
++	cmds = base + ptrdiff(ct->ctbs.send.cmds, blob);
++	err = ct_register_buffer(ct, GUC_CTB_TYPE_HOST2GUC,
++				 desc, cmds, ct->ctbs.send.size * 4);
++
+ 	if (unlikely(err))
+ 		goto err_deregister;
+ 
+@@ -303,7 +314,7 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
+ 	return 0;
+ 
+ err_deregister:
+-	ct_deregister_buffer(ct, INTEL_GUC_CT_BUFFER_TYPE_RECV);
++	ct_deregister_buffer(ct, GUC_CTB_TYPE_GUC2HOST);
+ err_out:
+ 	CT_PROBE_ERROR(ct, "Failed to enable CTB (%pe)\n", ERR_PTR(err));
+ 	return err;
+@@ -322,8 +333,8 @@ void intel_guc_ct_disable(struct intel_guc_ct *ct)
+ 	ct->enabled = false;
+ 
+ 	if (intel_guc_is_fw_running(guc)) {
+-		ct_deregister_buffer(ct, INTEL_GUC_CT_BUFFER_TYPE_SEND);
+-		ct_deregister_buffer(ct, INTEL_GUC_CT_BUFFER_TYPE_RECV);
++		ct_deregister_buffer(ct, GUC_CTB_TYPE_HOST2GUC);
++		ct_deregister_buffer(ct, GUC_CTB_TYPE_GUC2HOST);
+ 	}
+ }
+ 
+@@ -355,24 +366,6 @@ static void write_barrier(struct intel_guc_ct *ct)
+ 	}
+ }
+ 
+-/**
+- * DOC: CTB Host to GuC request
+- *
+- * Format of the CTB Host to GuC request message is as follows::
+- *
+- *      +------------+---------+---------+---------+---------+
+- *      |   msg[0]   |   [1]   |   [2]   |   ...   |  [n-1]  |
+- *      +------------+---------+---------+---------+---------+
+- *      |   MESSAGE  |       MESSAGE PAYLOAD                 |
+- *      +   HEADER   +---------+---------+---------+---------+
+- *      |            |    0    |    1    |   ...   |    n    |
+- *      +============+=========+=========+=========+=========+
+- *      |  len >= 1  |  FENCE  |     request specific data   |
+- *      +------+-----+---------+---------+---------+---------+
+- *
+- *                   ^-----------------len-------------------^
+- */
+-
+ static int ct_write(struct intel_guc_ct *ct,
+ 		    const u32 *action,
+ 		    u32 len /* in dwords */,
+@@ -385,20 +378,22 @@ static int ct_write(struct intel_guc_ct *ct,
+ 	u32 size = ctb->size;
+ 	u32 used;
+ 	u32 header;
++	u32 hxg;
+ 	u32 *cmds = ctb->cmds;
+ 	unsigned int i;
+ 
+-	if (unlikely(desc->is_in_error))
++	if (unlikely(ctb->broken))
+ 		return -EPIPE;
+ 
+-	if (unlikely(!IS_ALIGNED(head | tail, 4) ||
+-		     (tail | head) >= size))
++	if (unlikely(desc->status))
+ 		goto corrupted;
+ 
+-	/* later calculations will be done in dwords */
+-	head /= 4;
+-	tail /= 4;
+-	size /= 4;
++	if (unlikely((tail | head) >= size)) {
++		CT_ERROR(ct, "Invalid offsets head=%u tail=%u (size=%u)\n",
++			 head, tail, size);
++		desc->status |= GUC_CTB_STATUS_OVERFLOW;
++		goto corrupted;
++	}
+ 
+ 	/*
+ 	 * tail == head condition indicates empty. GuC FW does not support
+@@ -414,22 +409,25 @@ static int ct_write(struct intel_guc_ct *ct,
+ 		return -ENOSPC;
+ 
+ 	/*
+-	 * Write the message. The format is the following:
+-	 * DW0: header (including action code)
+-	 * DW1: fence
+-	 * DW2+: action data
++	 * dw0: CT header (including fence)
++	 * dw1: HXG header (including action code)
++	 * dw2+: action data
+ 	 */
+-	header = (len << GUC_CT_MSG_LEN_SHIFT) |
+-		 GUC_CT_MSG_SEND_STATUS |
+-		 (action[0] << GUC_CT_MSG_ACTION_SHIFT);
++	header = FIELD_PREP(GUC_CTB_MSG_0_FORMAT, GUC_CTB_FORMAT_HXG) |
++		 FIELD_PREP(GUC_CTB_MSG_0_NUM_DWORDS, len) |
++		 FIELD_PREP(GUC_CTB_MSG_0_FENCE, fence);
+ 
+-	CT_DEBUG(ct, "writing %*ph %*ph %*ph\n",
+-		 4, &header, 4, &fence, 4 * (len - 1), &action[1]);
++	hxg = FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
++	      FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION |
++			 GUC_HXG_REQUEST_MSG_0_DATA0, action[0]);
++
++	CT_DEBUG(ct, "writing (tail %u) %*ph %*ph %*ph\n",
++		 tail, 4, &header, 4, &hxg, 4 * (len - 1), &action[1]);
+ 
+ 	cmds[tail] = header;
+ 	tail = (tail + 1) % size;
+ 
+-	cmds[tail] = fence;
++	cmds[tail] = hxg;
+ 	tail = (tail + 1) % size;
+ 
+ 	for (i = 1; i < len; i++) {
+@@ -444,14 +442,15 @@ static int ct_write(struct intel_guc_ct *ct,
+ 	 */
+ 	write_barrier(ct);
+ 
+-	/* now update desc tail (back in bytes) */
+-	desc->tail = tail * 4;
++	/* now update descriptor */
++	WRITE_ONCE(desc->tail, tail);
++
+ 	return 0;
+ 
+ corrupted:
+-	CT_ERROR(ct, "Corrupted descriptor addr=%#x head=%u tail=%u size=%u\n",
+-		 desc->addr, desc->head, desc->tail, desc->size);
+-	desc->is_in_error = 1;
++	CT_ERROR(ct, "Corrupted descriptor head=%u tail=%u status=%#x\n",
++		 desc->head, desc->tail, desc->status);
++	ctb->broken = true;
+ 	return -EPIPE;
+ }
+ 
+@@ -478,7 +477,9 @@ static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
+ 	 * up to that length of time, then switch to a slower sleep-wait loop.
+ 	 * No GuC command should ever take longer than 10ms.
+ 	 */
+-#define done INTEL_GUC_MSG_IS_RESPONSE(READ_ONCE(req->status))
++#define done \
++	(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, READ_ONCE(req->status)) == \
++	 GUC_HXG_ORIGIN_GUC)
+ 	err = wait_for_us(done, 10);
+ 	if (err)
+ 		err = wait_for(done, 10);
+@@ -533,21 +534,21 @@ static int ct_send(struct intel_guc_ct *ct,
+ 	if (unlikely(err))
+ 		goto unlink;
+ 
+-	if (!INTEL_GUC_MSG_IS_RESPONSE_SUCCESS(*status)) {
++	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, *status) != GUC_HXG_TYPE_RESPONSE_SUCCESS) {
+ 		err = -EIO;
+ 		goto unlink;
+ 	}
+ 
+ 	if (response_buf) {
+ 		/* There shall be no data in the status */
+-		WARN_ON(INTEL_GUC_MSG_TO_DATA(request.status));
++		WARN_ON(FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, request.status));
+ 		/* Return actual response len */
+ 		err = request.response_len;
+ 	} else {
+ 		/* There shall be no response payload */
+ 		WARN_ON(request.response_len);
+ 		/* Return data decoded from the status dword */
+-		err = INTEL_GUC_MSG_TO_DATA(*status);
++		err = FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, *status);
+ 	}
+ 
+ unlink:
+@@ -584,21 +585,6 @@ int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
+ 	return ret;
+ }
+ 
+-static inline unsigned int ct_header_get_len(u32 header)
+-{
+-	return (header >> GUC_CT_MSG_LEN_SHIFT) & GUC_CT_MSG_LEN_MASK;
+-}
+-
+-static inline unsigned int ct_header_get_action(u32 header)
+-{
+-	return (header >> GUC_CT_MSG_ACTION_SHIFT) & GUC_CT_MSG_ACTION_MASK;
+-}
+-
+-static inline bool ct_header_is_response(u32 header)
+-{
+-	return !!(header & GUC_CT_MSG_IS_RESPONSE);
+-}
+-
+ static struct ct_incoming_msg *ct_alloc_msg(u32 num_dwords)
+ {
+ 	struct ct_incoming_msg *msg;
+@@ -631,17 +617,18 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
+ 	unsigned int i;
+ 	u32 header;
+ 
+-	if (unlikely(desc->is_in_error))
++	if (unlikely(ctb->broken))
+ 		return -EPIPE;
+ 
+-	if (unlikely(!IS_ALIGNED(head | tail, 4) ||
+-		     (tail | head) >= size))
++	if (unlikely(desc->status))
+ 		goto corrupted;
+ 
+-	/* later calculations will be done in dwords */
+-	head /= 4;
+-	tail /= 4;
+-	size /= 4;
++	if (unlikely((tail | head) >= size)) {
++		CT_ERROR(ct, "Invalid offsets head=%u tail=%u (size=%u)\n",
++			 head, tail, size);
++		desc->status |= GUC_CTB_STATUS_OVERFLOW;
++		goto corrupted;
++	}
+ 
+ 	/* tail == head condition indicates empty */
+ 	available = tail - head;
+@@ -660,7 +647,7 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
+ 	head = (head + 1) % size;
+ 
+ 	/* message len with header */
+-	len = ct_header_get_len(header) + 1;
++	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, header) + GUC_CTB_MSG_MIN_LEN;
+ 	if (unlikely(len > (u32)available)) {
+ 		CT_ERROR(ct, "Incomplete message %*ph %*ph %*ph\n",
+ 			 4, &header,
+@@ -668,6 +655,7 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
+ 			      size - head : available - 1), &cmds[head],
+ 			 4 * (head + available - 1 > size ?
+ 			      available - 1 - size + head : 0), &cmds[0]);
++		desc->status |= GUC_CTB_STATUS_UNDERFLOW;
+ 		goto corrupted;
+ 	}
+ 
+@@ -690,65 +678,36 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
+ 	}
+ 	CT_DEBUG(ct, "received %*ph\n", 4 * len, (*msg)->msg);
+ 
+-	desc->head = head * 4;
++	/* now update descriptor */
++	WRITE_ONCE(desc->head, head);
++
+ 	return available - len;
+ 
+ corrupted:
+-	CT_ERROR(ct, "Corrupted descriptor addr=%#x head=%u tail=%u size=%u\n",
+-		 desc->addr, desc->head, desc->tail, desc->size);
+-	desc->is_in_error = 1;
++	CT_ERROR(ct, "Corrupted descriptor head=%u tail=%u status=%#x\n",
++		 desc->head, desc->tail, desc->status);
++	ctb->broken = true;
+ 	return -EPIPE;
+ }
+ 
+-/**
+- * DOC: CTB GuC to Host response
+- *
+- * Format of the CTB GuC to Host response message is as follows::
+- *
+- *      +------------+---------+---------+---------+---------+---------+
+- *      |   msg[0]   |   [1]   |   [2]   |   [3]   |   ...   |  [n-1]  |
+- *      +------------+---------+---------+---------+---------+---------+
+- *      |   MESSAGE  |       MESSAGE PAYLOAD                           |
+- *      +   HEADER   +---------+---------+---------+---------+---------+
+- *      |            |    0    |    1    |    2    |   ...   |    n    |
+- *      +============+=========+=========+=========+=========+=========+
+- *      |  len >= 2  |  FENCE  |  STATUS |   response specific data    |
+- *      +------+-----+---------+---------+---------+---------+---------+
+- *
+- *                   ^-----------------------len-----------------------^
+- */
+-
+ static int ct_handle_response(struct intel_guc_ct *ct, struct ct_incoming_msg *response)
+ {
+-	u32 header = response->msg[0];
+-	u32 len = ct_header_get_len(header);
+-	u32 fence;
+-	u32 status;
+-	u32 datalen;
++	u32 len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, response->msg[0]);
++	u32 fence = FIELD_GET(GUC_CTB_MSG_0_FENCE, response->msg[0]);
++	const u32 *hxg = &response->msg[GUC_CTB_MSG_MIN_LEN];
++	const u32 *data = &hxg[GUC_HXG_MSG_MIN_LEN];
++	u32 datalen = len - GUC_HXG_MSG_MIN_LEN;
+ 	struct ct_request *req;
+ 	unsigned long flags;
+ 	bool found = false;
+ 	int err = 0;
+ 
+-	GEM_BUG_ON(!ct_header_is_response(header));
+-
+-	/* Response payload shall at least include fence and status */
+-	if (unlikely(len < 2)) {
+-		CT_ERROR(ct, "Corrupted response (len %u)\n", len);
+-		return -EPROTO;
+-	}
+-
+-	fence = response->msg[1];
+-	status = response->msg[2];
+-	datalen = len - 2;
+-
+-	/* Format of the status follows RESPONSE message */
+-	if (unlikely(!INTEL_GUC_MSG_IS_RESPONSE(status))) {
+-		CT_ERROR(ct, "Corrupted response (status %#x)\n", status);
+-		return -EPROTO;
+-	}
++	GEM_BUG_ON(len < GUC_HXG_MSG_MIN_LEN);
++	GEM_BUG_ON(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg[0]) != GUC_HXG_ORIGIN_GUC);
++	GEM_BUG_ON(FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]) != GUC_HXG_TYPE_RESPONSE_SUCCESS &&
++		   FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]) != GUC_HXG_TYPE_RESPONSE_FAILURE);
+ 
+-	CT_DEBUG(ct, "response fence %u status %#x\n", fence, status);
++	CT_DEBUG(ct, "response fence %u status %#x\n", fence, hxg[0]);
+ 
+ 	spin_lock_irqsave(&ct->requests.lock, flags);
+ 	list_for_each_entry(req, &ct->requests.pending, link) {
+@@ -764,9 +723,9 @@ static int ct_handle_response(struct intel_guc_ct *ct, struct ct_incoming_msg *r
+ 			err = -EMSGSIZE;
+ 		}
+ 		if (datalen)
+-			memcpy(req->response_buf, response->msg + 3, 4 * datalen);
++			memcpy(req->response_buf, data, 4 * datalen);
+ 		req->response_len = datalen;
+-		WRITE_ONCE(req->status, status);
++		WRITE_ONCE(req->status, hxg[0]);
+ 		found = true;
+ 		break;
+ 	}
+@@ -787,14 +746,16 @@ static int ct_handle_response(struct intel_guc_ct *ct, struct ct_incoming_msg *r
+ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *request)
+ {
+ 	struct intel_guc *guc = ct_to_guc(ct);
+-	u32 header, action, len;
++	const u32 *hxg;
+ 	const u32 *payload;
++	u32 hxg_len, action, len;
+ 	int ret;
+ 
+-	header = request->msg[0];
+-	payload = &request->msg[1];
+-	action = ct_header_get_action(header);
+-	len = ct_header_get_len(header);
++	hxg = &request->msg[GUC_CTB_MSG_MIN_LEN];
++	hxg_len = request->size - GUC_CTB_MSG_MIN_LEN;
++	payload = &hxg[GUC_HXG_MSG_MIN_LEN];
++	action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, hxg[0]);
++	len = hxg_len - GUC_HXG_MSG_MIN_LEN;
+ 
+ 	CT_DEBUG(ct, "request %x %*ph\n", action, 4 * len, payload);
+ 
+@@ -856,29 +817,12 @@ static void ct_incoming_request_worker_func(struct work_struct *w)
+ 		queue_work(system_unbound_wq, &ct->requests.worker);
+ }
+ 
+-/**
+- * DOC: CTB GuC to Host request
+- *
+- * Format of the CTB GuC to Host request message is as follows::
+- *
+- *      +------------+---------+---------+---------+---------+---------+
+- *      |   msg[0]   |   [1]   |   [2]   |   [3]   |   ...   |  [n-1]  |
+- *      +------------+---------+---------+---------+---------+---------+
+- *      |   MESSAGE  |       MESSAGE PAYLOAD                           |
+- *      +   HEADER   +---------+---------+---------+---------+---------+
+- *      |            |    0    |    1    |    2    |   ...   |    n    |
+- *      +============+=========+=========+=========+=========+=========+
+- *      |     len    |            request specific data                |
+- *      +------+-----+---------+---------+---------+---------+---------+
+- *
+- *                   ^-----------------------len-----------------------^
+- */
+-
+-static int ct_handle_request(struct intel_guc_ct *ct, struct ct_incoming_msg *request)
++static int ct_handle_event(struct intel_guc_ct *ct, struct ct_incoming_msg *request)
+ {
++	const u32 *hxg = &request->msg[GUC_CTB_MSG_MIN_LEN];
+ 	unsigned long flags;
+ 
+-	GEM_BUG_ON(ct_header_is_response(request->msg[0]));
++	GEM_BUG_ON(FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]) != GUC_HXG_TYPE_EVENT);
+ 
+ 	spin_lock_irqsave(&ct->requests.lock, flags);
+ 	list_add_tail(&request->link, &ct->requests.incoming);
+@@ -888,15 +832,53 @@ static int ct_handle_request(struct intel_guc_ct *ct, struct ct_incoming_msg *re
+ 	return 0;
+ }
+ 
+-static void ct_handle_msg(struct intel_guc_ct *ct, struct ct_incoming_msg *msg)
++static int ct_handle_hxg(struct intel_guc_ct *ct, struct ct_incoming_msg *msg)
+ {
+-	u32 header = msg->msg[0];
++	u32 origin, type;
++	u32 *hxg;
+ 	int err;
+ 
+-	if (ct_header_is_response(header))
++	if (unlikely(msg->size < GUC_CTB_HXG_MSG_MIN_LEN))
++		return -EBADMSG;
++
++	hxg = &msg->msg[GUC_CTB_MSG_MIN_LEN];
++
++	origin = FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg[0]);
++	if (unlikely(origin != GUC_HXG_ORIGIN_GUC)) {
++		err = -EPROTO;
++		goto failed;
++	}
++
++	type = FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]);
++	switch (type) {
++	case GUC_HXG_TYPE_EVENT:
++		err = ct_handle_event(ct, msg);
++		break;
++	case GUC_HXG_TYPE_RESPONSE_SUCCESS:
++	case GUC_HXG_TYPE_RESPONSE_FAILURE:
+ 		err = ct_handle_response(ct, msg);
++		break;
++	default:
++		err = -EOPNOTSUPP;
++	}
++
++	if (unlikely(err)) {
++failed:
++		CT_ERROR(ct, "Failed to handle HXG message (%pe) %*ph\n",
++			 ERR_PTR(err), 4 * GUC_HXG_MSG_MIN_LEN, hxg);
++	}
++	return err;
++}
++
++static void ct_handle_msg(struct intel_guc_ct *ct, struct ct_incoming_msg *msg)
++{
++	u32 format = FIELD_GET(GUC_CTB_MSG_0_FORMAT, msg->msg[0]);
++	int err;
++
++	if (format == GUC_CTB_FORMAT_HXG)
++		err = ct_handle_hxg(ct, msg);
+ 	else
+-		err = ct_handle_request(ct, msg);
++		err = -EOPNOTSUPP;
+ 
+ 	if (unlikely(err)) {
+ 		CT_ERROR(ct, "Failed to process CT message (%pe) %*ph\n",
+diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
+--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
++++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
+@@ -31,13 +31,15 @@ struct intel_guc;
+  * @lock: protects access to the commands buffer and buffer descriptor
+  * @desc: pointer to the buffer descriptor
+  * @cmds: pointer to the commands buffer
+- * @size: size of the commands buffer
++ * @size: size of the commands buffer in dwords
++ * @broken: flag to indicate if descriptor data is broken
+  */
+ struct intel_guc_ct_buffer {
+ 	spinlock_t lock;
+ 	struct guc_ct_buffer_desc *desc;
+ 	u32 *cmds;
+ 	u32 size;
++	bool broken;
+ };
+ 
+ 
+@@ -59,7 +61,7 @@ struct intel_guc_ct {
+ 	struct tasklet_struct receive_tasklet;
+ 
+ 	struct {
+-		u32 last_fence; /* last fence used to send request */
++		u16 last_fence; /* last fence used to send request */
+ 
+ 		spinlock_t lock; /* protects pending requests list */
+ 		struct list_head pending; /* requests waiting for response */
+diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
++++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+@@ -81,10 +81,8 @@
+ #define   GUC_LOG_ALLOC_IN_MEGABYTE	(1 << 3)
+ #define   GUC_LOG_CRASH_SHIFT		4
+ #define   GUC_LOG_CRASH_MASK		(0x3 << GUC_LOG_CRASH_SHIFT)
+-#define   GUC_LOG_DPC_SHIFT		6
+-#define   GUC_LOG_DPC_MASK	        (0x7 << GUC_LOG_DPC_SHIFT)
+-#define   GUC_LOG_ISR_SHIFT		9
+-#define   GUC_LOG_ISR_MASK	        (0x7 << GUC_LOG_ISR_SHIFT)
++#define   GUC_LOG_DEBUG_SHIFT		6
++#define   GUC_LOG_DEBUG_MASK	        (0xF << GUC_LOG_DEBUG_SHIFT)
+ #define   GUC_LOG_BUF_ADDR_SHIFT	12
+ 
+ #define GUC_CTL_WA			1
+@@ -247,32 +245,14 @@ struct guc_stage_desc {
+ 
+ /* Scheduling policy settings */
+ 
+-/* Reset engine upon preempt failure */
+-#define POLICY_RESET_ENGINE		(1<<0)
+-/* Preempt to idle on quantum expiry */
+-#define POLICY_PREEMPT_TO_IDLE		(1<<1)
+-
+-#define POLICY_MAX_NUM_WI 15
+-#define POLICY_DEFAULT_DPC_PROMOTE_TIME_US 500000
+-#define POLICY_DEFAULT_EXECUTION_QUANTUM_US 1000000
+-#define POLICY_DEFAULT_PREEMPTION_TIME_US 500000
+-#define POLICY_DEFAULT_FAULT_TIME_US 250000
+-
+-struct guc_policy {
+-	/* Time for one workload to execute. (in micro seconds) */
+-	u32 execution_quantum;
+-	/* Time to wait for a preemption request to completed before issuing a
+-	 * reset. (in micro seconds). */
+-	u32 preemption_time;
+-	/* How much time to allow to run after the first fault is observed.
+-	 * Then preempt afterwards. (in micro seconds) */
+-	u32 fault_time;
+-	u32 policy_flags;
+-	u32 reserved[8];
+-} __packed;
++#define GLOBAL_POLICY_MAX_NUM_WI 15
++
++/* Don't reset an engine upon preemption failure */
++#define GLOBAL_POLICY_DISABLE_ENGINE_RESET				BIT(0)
++
++#define GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US 500000
+ 
+ struct guc_policies {
+-	struct guc_policy policy[GUC_CLIENT_PRIORITY_NUM][GUC_MAX_ENGINE_CLASSES];
+ 	u32 submission_queue_depth[GUC_MAX_ENGINE_CLASSES];
+ 	/* In micro seconds. How much time to allow before DPC processing is
+ 	 * called back via interrupt (to prevent DPC queue drain starving).
+@@ -286,6 +266,7 @@ struct guc_policies {
+ 	 * idle. */
+ 	u32 max_num_work_items;
+ 
++	u32 global_flags;
+ 	u32 reserved[4];
+ } __packed;
+ 
+@@ -311,29 +292,13 @@ struct guc_gt_system_info {
+ 	u32 generic_gt_sysinfo[GUC_GENERIC_GT_SYSINFO_MAX];
+ } __packed;
+ 
+-/* Clients info */
+-struct guc_ct_pool_entry {
+-	struct guc_ct_buffer_desc desc;
+-	u32 reserved[7];
+-} __packed;
+-
+-#define GUC_CT_POOL_SIZE	2
+-
+-struct guc_clients_info {
+-	u32 clients_num;
+-	u32 reserved0[13];
+-	u32 ct_pool_addr;
+-	u32 ct_pool_count;
+-	u32 reserved[4];
+-} __packed;
+-
+ /* GuC Additional Data Struct */
+ struct guc_ads {
+ 	struct guc_mmio_reg_set reg_state_list[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
+ 	u32 reserved0;
+ 	u32 scheduler_policies;
+ 	u32 gt_system_info;
+-	u32 clients_info;
++	u32 reserved1;
+ 	u32 control_data;
+ 	u32 golden_context_lrca[GUC_MAX_ENGINE_CLASSES];
+ 	u32 eng_state_size[GUC_MAX_ENGINE_CLASSES];
+@@ -344,8 +309,7 @@ struct guc_ads {
+ /* GuC logging structures */
+ 
+ enum guc_log_buffer_type {
+-	GUC_ISR_LOG_BUFFER,
+-	GUC_DPC_LOG_BUFFER,
++	GUC_DEBUG_LOG_BUFFER,
+ 	GUC_CRASH_DUMP_LOG_BUFFER,
+ 	GUC_MAX_LOG_BUFFER
+ };
+@@ -414,23 +378,6 @@ struct guc_shared_ctx_data {
+ 	struct guc_ctx_report preempt_ctx_report[GUC_MAX_ENGINES_NUM];
+ } __packed;
+ 
+-#define __INTEL_GUC_MSG_GET(T, m) \
+-	(((m) & INTEL_GUC_MSG_ ## T ## _MASK) >> INTEL_GUC_MSG_ ## T ## _SHIFT)
+-#define INTEL_GUC_MSG_TO_TYPE(m)	__INTEL_GUC_MSG_GET(TYPE, m)
+-#define INTEL_GUC_MSG_TO_DATA(m)	__INTEL_GUC_MSG_GET(DATA, m)
+-#define INTEL_GUC_MSG_TO_CODE(m)	__INTEL_GUC_MSG_GET(CODE, m)
+-
+-#define __INTEL_GUC_MSG_TYPE_IS(T, m) \
+-	(INTEL_GUC_MSG_TO_TYPE(m) == INTEL_GUC_MSG_TYPE_ ## T)
+-#define INTEL_GUC_MSG_IS_REQUEST(m)	__INTEL_GUC_MSG_TYPE_IS(REQUEST, m)
+-#define INTEL_GUC_MSG_IS_RESPONSE(m)	__INTEL_GUC_MSG_TYPE_IS(RESPONSE, m)
+-
+-#define INTEL_GUC_MSG_IS_RESPONSE_SUCCESS(m) \
+-	 (typecheck(u32, (m)) && \
+-	  ((m) & (INTEL_GUC_MSG_TYPE_MASK | INTEL_GUC_MSG_CODE_MASK)) == \
+-	  ((INTEL_GUC_MSG_TYPE_RESPONSE << INTEL_GUC_MSG_TYPE_SHIFT) | \
+-	   (INTEL_GUC_RESPONSE_STATUS_SUCCESS << INTEL_GUC_MSG_CODE_SHIFT)))
+-
+ /* This action will be programmed in C1BC - SOFT_SCRATCH_15_REG */
+ enum intel_guc_recv_message {
+ 	INTEL_GUC_RECV_MSG_CRASH_DUMP_POSTED = BIT(1),
+diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
+--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
++++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
+@@ -197,10 +197,8 @@ static bool guc_check_log_buf_overflow(struct intel_guc_log *log,
+ static unsigned int guc_get_log_buffer_size(enum guc_log_buffer_type type)
+ {
+ 	switch (type) {
+-	case GUC_ISR_LOG_BUFFER:
+-		return ISR_BUFFER_SIZE;
+-	case GUC_DPC_LOG_BUFFER:
+-		return DPC_BUFFER_SIZE;
++	case GUC_DEBUG_LOG_BUFFER:
++		return DEBUG_BUFFER_SIZE;
+ 	case GUC_CRASH_DUMP_LOG_BUFFER:
+ 		return CRASH_BUFFER_SIZE;
+ 	default:
+@@ -245,7 +243,7 @@ static void guc_read_update_log_buffer(struct intel_guc_log *log)
+ 	src_data += PAGE_SIZE;
+ 	dst_data += PAGE_SIZE;
+ 
+-	for (type = GUC_ISR_LOG_BUFFER; type < GUC_MAX_LOG_BUFFER; type++) {
++	for (type = GUC_DEBUG_LOG_BUFFER; type < GUC_MAX_LOG_BUFFER; type++) {
+ 		/*
+ 		 * Make a copy of the state structure, inside GuC log buffer
+ 		 * (which is uncached mapped), on the stack to avoid reading
+@@ -463,21 +461,16 @@ int intel_guc_log_create(struct intel_guc_log *log)
+ 	 *  +===============================+ 00B
+ 	 *  |    Crash dump state header    |
+ 	 *  +-------------------------------+ 32B
+-	 *  |       DPC state header        |
++	 *  |      Debug state header       |
+ 	 *  +-------------------------------+ 64B
+-	 *  |       ISR state header        |
+-	 *  +-------------------------------+ 96B
+ 	 *  |                               |
+ 	 *  +===============================+ PAGE_SIZE (4KB)
+ 	 *  |        Crash Dump logs        |
+ 	 *  +===============================+ + CRASH_SIZE
+-	 *  |           DPC logs            |
+-	 *  +===============================+ + DPC_SIZE
+-	 *  |           ISR logs            |
+-	 *  +===============================+ + ISR_SIZE
++	 *  |          Debug logs           |
++	 *  +===============================+ + DEBUG_SIZE
+ 	 */
+-	guc_log_size = PAGE_SIZE + CRASH_BUFFER_SIZE + DPC_BUFFER_SIZE +
+-			ISR_BUFFER_SIZE;
++	guc_log_size = PAGE_SIZE + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE;
+ 
+ 	vma = intel_guc_allocate_vma(guc, guc_log_size);
+ 	if (IS_ERR(vma)) {
+@@ -675,10 +668,8 @@ static const char *
+ stringify_guc_log_type(enum guc_log_buffer_type type)
+ {
+ 	switch (type) {
+-	case GUC_ISR_LOG_BUFFER:
+-		return "ISR";
+-	case GUC_DPC_LOG_BUFFER:
+-		return "DPC";
++	case GUC_DEBUG_LOG_BUFFER:
++		return "DEBUG";
+ 	case GUC_CRASH_DUMP_LOG_BUFFER:
+ 		return "CRASH";
+ 	default:
+@@ -708,7 +699,7 @@ void intel_guc_log_info(struct intel_guc_log *log, struct drm_printer *p)
+ 
+ 	drm_printf(p, "\tRelay full count: %u\n", log->relay.full_count);
+ 
+-	for (type = GUC_ISR_LOG_BUFFER; type < GUC_MAX_LOG_BUFFER; type++) {
++	for (type = GUC_DEBUG_LOG_BUFFER; type < GUC_MAX_LOG_BUFFER; type++) {
+ 		drm_printf(p, "\t%s:\tflush count %10u, overflow count %10u\n",
+ 			   stringify_guc_log_type(type),
+ 			   log->stats[type].flush,
+diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h
+--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h
++++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h
+@@ -17,12 +17,10 @@ struct intel_guc;
+ 
+ #ifdef CONFIG_DRM_I915_DEBUG_GUC
+ #define CRASH_BUFFER_SIZE	SZ_2M
+-#define DPC_BUFFER_SIZE		SZ_8M
+-#define ISR_BUFFER_SIZE		SZ_8M
++#define DEBUG_BUFFER_SIZE	SZ_16M
+ #else
+ #define CRASH_BUFFER_SIZE	SZ_8K
+-#define DPC_BUFFER_SIZE		SZ_32K
+-#define ISR_BUFFER_SIZE		SZ_32K
++#define DEBUG_BUFFER_SIZE	SZ_64K
+ #endif
+ 
+ /*
+diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
++++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+@@ -48,19 +48,19 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
+  * firmware as TGL.
+  */
+ #define INTEL_UC_FIRMWARE_DEFS(fw_def, guc_def, huc_def) \
+-	fw_def(ALDERLAKE_S, 0, guc_def(tgl, 49, 0, 1), huc_def(tgl,  7, 5, 0)) \
+-	fw_def(ROCKETLAKE,  0, guc_def(tgl, 49, 0, 1), huc_def(tgl,  7, 5, 0)) \
+-	fw_def(TIGERLAKE,   0, guc_def(tgl, 49, 0, 1), huc_def(tgl,  7, 5, 0)) \
+-	fw_def(JASPERLAKE,  0, guc_def(ehl, 49, 0, 1), huc_def(ehl,  9, 0, 0)) \
+-	fw_def(ELKHARTLAKE, 0, guc_def(ehl, 49, 0, 1), huc_def(ehl,  9, 0, 0)) \
+-	fw_def(ICELAKE,     0, guc_def(icl, 49, 0, 1), huc_def(icl,  9, 0, 0)) \
+-	fw_def(COMETLAKE,   5, guc_def(cml, 49, 0, 1), huc_def(cml,  4, 0, 0)) \
+-	fw_def(COMETLAKE,   0, guc_def(kbl, 49, 0, 1), huc_def(kbl,  4, 0, 0)) \
+-	fw_def(COFFEELAKE,  0, guc_def(kbl, 49, 0, 1), huc_def(kbl,  4, 0, 0)) \
+-	fw_def(GEMINILAKE,  0, guc_def(glk, 49, 0, 1), huc_def(glk,  4, 0, 0)) \
+-	fw_def(KABYLAKE,    0, guc_def(kbl, 49, 0, 1), huc_def(kbl,  4, 0, 0)) \
+-	fw_def(BROXTON,     0, guc_def(bxt, 49, 0, 1), huc_def(bxt,  2, 0, 0)) \
+-	fw_def(SKYLAKE,     0, guc_def(skl, 49, 0, 1), huc_def(skl,  2, 0, 0))
++	fw_def(ALDERLAKE_S, 0, guc_def(tgl, 62, 0, 0), huc_def(tgl,  7, 5, 0)) \
++	fw_def(ROCKETLAKE,  0, guc_def(tgl, 62, 0, 0), huc_def(tgl,  7, 5, 0)) \
++	fw_def(TIGERLAKE,   0, guc_def(tgl, 62, 0, 0), huc_def(tgl,  7, 5, 0)) \
++	fw_def(JASPERLAKE,  0, guc_def(ehl, 62, 0, 0), huc_def(ehl,  9, 0, 0)) \
++	fw_def(ELKHARTLAKE, 0, guc_def(ehl, 62, 0, 0), huc_def(ehl,  9, 0, 0)) \
++	fw_def(ICELAKE,     0, guc_def(icl, 62, 0, 0), huc_def(icl,  9, 0, 0)) \
++	fw_def(COMETLAKE,   5, guc_def(cml, 62, 0, 0), huc_def(cml,  4, 0, 0)) \
++	fw_def(COMETLAKE,   0, guc_def(kbl, 62, 0, 0), huc_def(kbl,  4, 0, 0)) \
++	fw_def(COFFEELAKE,  0, guc_def(kbl, 62, 0, 0), huc_def(kbl,  4, 0, 0)) \
++	fw_def(GEMINILAKE,  0, guc_def(glk, 62, 0, 0), huc_def(glk,  4, 0, 0)) \
++	fw_def(KABYLAKE,    0, guc_def(kbl, 62, 0, 0), huc_def(kbl,  4, 0, 0)) \
++	fw_def(BROXTON,     0, guc_def(bxt, 62, 0, 0), huc_def(bxt,  2, 0, 0)) \
++	fw_def(SKYLAKE,     0, guc_def(skl, 62, 0, 0), huc_def(skl,  2, 0, 0))
+ 
+ #define __MAKE_UC_FW_PATH(prefix_, name_, major_, minor_, patch_) \
+ 	"i915/" \
diff --git a/0001-drm-i915-guc-Relax-CTB-response-timeout.patch b/0001-drm-i915-guc-Relax-CTB-response-timeout.patch
new file mode 100644
index 000000000000..5fb9d582ea1c
--- /dev/null
+++ b/0001-drm-i915-guc-Relax-CTB-response-timeout.patch
@@ -0,0 +1,54 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Matthew Brost <matthew.brost@intel.com>
+Date: Thu, 8 Jul 2021 09:20:49 -0700
+Subject: [PATCH] drm/i915/guc: Relax CTB response timeout
+
+In upcoming patch we will allow more CTB requests to be sent in
+parallel to the GuC for processing, so we shouldn't assume any more
+that GuC will always reply without 10ms.
+
+Use bigger value hardcoded value of 1s instead.
+
+v2: Add CONFIG_DRM_I915_GUC_CTB_TIMEOUT config option
+v3:
+ (Daniel Vetter)
+  - Use hardcoded value of 1s rather than config option
+v4:
+ (Michal)
+  - Use defines for timeout values
+
+Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
+Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
+Link: https://patchwork.freedesktop.org/patch/msgid/20210708162055.129996-2-matthew.brost@intel.com
+(cherry picked from commit 1ccf7294b76d28d5151f024351c747ccf101d66e)
+---
+ drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
++++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+@@ -475,14 +475,18 @@ static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
+ 	/*
+ 	 * Fast commands should complete in less than 10us, so sample quickly
+ 	 * up to that length of time, then switch to a slower sleep-wait loop.
+-	 * No GuC command should ever take longer than 10ms.
++	 * No GuC command should ever take longer than 10ms but many GuC
++	 * commands can be inflight at time, so use a 1s timeout on the slower
++	 * sleep-wait loop.
+ 	 */
++#define GUC_CTB_RESPONSE_TIMEOUT_SHORT_MS 10
++#define GUC_CTB_RESPONSE_TIMEOUT_LONG_MS 1000
+ #define done \
+ 	(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, READ_ONCE(req->status)) == \
+ 	 GUC_HXG_ORIGIN_GUC)
+-	err = wait_for_us(done, 10);
++	err = wait_for_us(done, GUC_CTB_RESPONSE_TIMEOUT_SHORT_MS);
+ 	if (err)
+-		err = wait_for(done, 10);
++		err = wait_for(done, GUC_CTB_RESPONSE_TIMEOUT_LONG_MS);
+ #undef done
+ 
+ 	if (unlikely(err))
diff --git a/0001-drm-i915-guc-Add-stall-timer-to-non-blocking-CTB-sen.patch b/0001-drm-i915-guc-Add-stall-timer-to-non-blocking-CTB-sen.patch
new file mode 100644
index 000000000000..22c8bc8a6e97
--- /dev/null
+++ b/0001-drm-i915-guc-Add-stall-timer-to-non-blocking-CTB-sen.patch
@@ -0,0 +1,184 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Matthew Brost <matthew.brost@intel.com>
+Date: Thu, 8 Jul 2021 09:20:53 -0700
+Subject: [PATCH] drm/i915/guc: Add stall timer to non blocking CTB send
+ function
+
+Implement a stall timer which fails H2G CTBs once a period of time
+with no forward progress is reached to prevent deadlock.
+
+v2:
+ (Michal)
+  - Improve error message in ct_deadlock()
+  - Set broken when ct_deadlock() returns true
+  - Return -EPIPE on ct_deadlock()
+v3:
+ (Michal)
+  - Add ms to stall timer comment
+ (Matthew)
+  - Move broken check to intel_guc_ct_send()
+
+Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
+Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
+Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
+Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
+Link: https://patchwork.freedesktop.org/patch/msgid/20210708162055.129996-6-matthew.brost@intel.com
+(cherry picked from commit b43b9950486eb9b229493fc91cdabbbb4d07cfbc)
+---
+ drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 62 ++++++++++++++++++++---
+ drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h |  4 ++
+ 2 files changed, 59 insertions(+), 7 deletions(-)
+
+diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
++++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+@@ -4,6 +4,9 @@
+  */
+ 
+ #include <linux/circ_buf.h>
++#include <linux/ktime.h>
++#include <linux/time64.h>
++#include <linux/timekeeping.h>
+ 
+ #include "i915_drv.h"
+ #include "intel_guc_ct.h"
+@@ -317,6 +320,7 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
+ 		goto err_deregister;
+ 
+ 	ct->enabled = true;
++	ct->stall_time = KTIME_MAX;
+ 
+ 	return 0;
+ 
+@@ -390,9 +394,6 @@ static int ct_write(struct intel_guc_ct *ct,
+ 	u32 *cmds = ctb->cmds;
+ 	unsigned int i;
+ 
+-	if (unlikely(ctb->broken))
+-		return -EPIPE;
+-
+ 	if (unlikely(desc->status))
+ 		goto corrupted;
+ 
+@@ -506,6 +507,25 @@ static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
+ 	return err;
+ }
+ 
++#define GUC_CTB_TIMEOUT_MS	1500
++static inline bool ct_deadlocked(struct intel_guc_ct *ct)
++{
++	long timeout = GUC_CTB_TIMEOUT_MS;
++	bool ret = ktime_ms_delta(ktime_get(), ct->stall_time) > timeout;
++
++	if (unlikely(ret)) {
++		struct guc_ct_buffer_desc *send = ct->ctbs.send.desc;
++		struct guc_ct_buffer_desc *recv = ct->ctbs.send.desc;
++
++		CT_ERROR(ct, "Communication stalled for %lld ms, desc status=%#x,%#x\n",
++			 ktime_ms_delta(ktime_get(), ct->stall_time),
++			 send->status, recv->status);
++		ct->ctbs.send.broken = true;
++	}
++
++	return ret;
++}
++
+ static inline bool h2g_has_room(struct intel_guc_ct_buffer *ctb, u32 len_dw)
+ {
+ 	struct guc_ct_buffer_desc *desc = ctb->desc;
+@@ -517,6 +537,26 @@ static inline bool h2g_has_room(struct intel_guc_ct_buffer *ctb, u32 len_dw)
+ 	return space >= len_dw;
+ }
+ 
++static int has_room_nb(struct intel_guc_ct *ct, u32 len_dw)
++{
++	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
++
++	lockdep_assert_held(&ct->ctbs.send.lock);
++
++	if (unlikely(!h2g_has_room(ctb, len_dw))) {
++		if (ct->stall_time == KTIME_MAX)
++			ct->stall_time = ktime_get();
++
++		if (unlikely(ct_deadlocked(ct)))
++			return -EPIPE;
++		else
++			return -EBUSY;
++	}
++
++	ct->stall_time = KTIME_MAX;
++	return 0;
++}
++
+ static int ct_send_nb(struct intel_guc_ct *ct,
+ 		      const u32 *action,
+ 		      u32 len,
+@@ -529,11 +569,9 @@ static int ct_send_nb(struct intel_guc_ct *ct,
+ 
+ 	spin_lock_irqsave(&ctb->lock, spin_flags);
+ 
+-	ret = h2g_has_room(ctb, len + GUC_CTB_HDR_LEN);
+-	if (unlikely(!ret)) {
+-		ret = -EBUSY;
++	ret = has_room_nb(ct, len + GUC_CTB_HDR_LEN);
++	if (unlikely(ret))
+ 		goto out;
+-	}
+ 
+ 	fence = ct_get_next_fence(ct);
+ 	ret = ct_write(ct, action, len, fence, flags);
+@@ -576,8 +614,13 @@ static int ct_send(struct intel_guc_ct *ct,
+ retry:
+ 	spin_lock_irqsave(&ctb->lock, flags);
+ 	if (unlikely(!h2g_has_room(ctb, len + GUC_CTB_HDR_LEN))) {
++		if (ct->stall_time == KTIME_MAX)
++			ct->stall_time = ktime_get();
+ 		spin_unlock_irqrestore(&ctb->lock, flags);
+ 
++		if (unlikely(ct_deadlocked(ct)))
++			return -EPIPE;
++
+ 		if (msleep_interruptible(sleep_period_ms))
+ 			return -EINTR;
+ 		sleep_period_ms = sleep_period_ms << 1;
+@@ -585,6 +628,8 @@ static int ct_send(struct intel_guc_ct *ct,
+ 		goto retry;
+ 	}
+ 
++	ct->stall_time = KTIME_MAX;
++
+ 	fence = ct_get_next_fence(ct);
+ 	request.fence = fence;
+ 	request.status = 0;
+@@ -647,6 +692,9 @@ int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
+ 		return -ENODEV;
+ 	}
+ 
++	if (unlikely(ct->ctbs.send.broken))
++		return -EPIPE;
++
+ 	if (flags & INTEL_GUC_CT_SEND_NB)
+ 		return ct_send_nb(ct, action, len, flags);
+ 
+diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
+--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
++++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
+@@ -9,6 +9,7 @@
+ #include <linux/interrupt.h>
+ #include <linux/spinlock.h>
+ #include <linux/workqueue.h>
++#include <linux/ktime.h>
+ 
+ #include "intel_guc_fwif.h"
+ 
+@@ -68,6 +69,9 @@ struct intel_guc_ct {
+ 		struct list_head incoming; /* incoming requests */
+ 		struct work_struct worker; /* handler for incoming requests */
+ 	} requests;
++
++	/** @stall_time: time of first time a CTB submission is stalled */
++	ktime_t stall_time;
+ };
+ 
+ void intel_guc_ct_init_early(struct intel_guc_ct *ct);
diff --git a/0001-INTEL_DII-NOT_UPSTREAM-Fixup-GuC-submission-to-under.patch b/0001-INTEL_DII-NOT_UPSTREAM-Fixup-GuC-submission-to-under.patch
new file mode 100644
index 000000000000..c507fd8b5979
--- /dev/null
+++ b/0001-INTEL_DII-NOT_UPSTREAM-Fixup-GuC-submission-to-under.patch
@@ -0,0 +1,55 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Matthew Brost <matthew.brost@intel.com>
+Date: Tue, 9 Nov 2021 10:14:59 -0800
+Subject: [PATCH] INTEL_DII/NOT_UPSTREAM: Fixup GuC submission to understand
+ -EPIPE rather than -EIO
+
+The CT code returns -EPIPE on error rather than -EIO, make the GuC
+submission code understand that. Applying in a patch rather than correct
+place in pile as all of this code is going to replaced soon by the
+backport.
+
+Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+---
+ drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
++++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+@@ -992,7 +992,7 @@ static int gse_dequeue_one_context(struct guc_submit_engine *gse)
+ 		ret = tasklet_register_context(gse, last);
+ 		if (unlikely(ret == -EINPROGRESS))
+ 			goto blk_tasklet;
+-		else if (unlikely(ret == -EIO))
++		else if (unlikely(ret == -EPIPE))
+ 			goto deadlk;
+ 		else if (unlikely(ret == -EBUSY))
+ 			goto schedule_tasklet;
+@@ -1016,7 +1016,7 @@ static int gse_dequeue_one_context(struct guc_submit_engine *gse)
+ 
+ add_request:
+ 		ret = gse_add_request(gse, last);
+-		if (unlikely(ret == -EIO))
++		if (unlikely(ret == -EPIPE))
+ 			goto deadlk;
+ 		else if (ret == -EBUSY)
+ 			goto schedule_tasklet;
+@@ -1740,7 +1740,7 @@ static int gse_bypass_tasklet_submit(struct guc_submit_engine *gse,
+ 		ret = gse_add_request(gse, rq);
+ 	}
+ 
+-	if (unlikely(ret == -EIO))
++	if (unlikely(ret == -EPIPE))
+ 		disable_submission(gse->guc);
+ 
+ 	return ret;
+@@ -3029,7 +3029,7 @@ static int guc_request_alloc(struct i915_request *rq)
+ 	if (context_needs_lrc_desc_pin(ce, !!ret)) {
+ 		ret = guc_lrc_desc_pin(ce, true);
+ 		if (unlikely(ret)) {	/* unwind */
+-			if (ret == -EIO) {	/* GPU will be reset */
++			if (ret == -EPIPE) {	/* GPU will be reset */
+ 				disable_submission(guc);
+ 				goto out;
+ 			}
diff --git a/0001-INTEL_DII-drm-i915-guc-Relax-CTB-response-timeout.patch b/0001-INTEL_DII-drm-i915-guc-Relax-CTB-response-timeout.patch
deleted file mode 100644
index bd892ca3c100..000000000000
--- a/0001-INTEL_DII-drm-i915-guc-Relax-CTB-response-timeout.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Date: Mon, 1 Feb 2021 16:35:15 +0100
-Subject: [PATCH] INTEL_DII: drm/i915/guc: Relax CTB response timeout
-
-In upcoming patch we will allow more CTB requests to be sent in
-parallel to the GuC for procesing, so we shouldn't assume any more
-that GuC will always reply without 10ms.
-
-Use bigger value from CONFIG_DRM_I915_HEARTBEAT_INTERVAL instead.
-
-Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Reviewed-by: Matthew Brost <matthew.brost@intel.com>
----
- drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
---- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
-+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
-@@ -436,17 +436,23 @@ static int ct_write(struct intel_guc_ct *ct,
-  */
- static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
- {
-+	long timeout;
- 	int err;
- 
- 	/*
- 	 * Fast commands should complete in less than 10us, so sample quickly
- 	 * up to that length of time, then switch to a slower sleep-wait loop.
- 	 * No GuC command should ever take longer than 10ms.
-+	 *
-+	 * However, there might be other CT requests in flight before this one,
-+	 * so use @CONFIG_DRM_I915_HEARTBEAT_INTERVAL as backup timeout value.
- 	 */
-+	timeout = max(10, CONFIG_DRM_I915_HEARTBEAT_INTERVAL);
-+
- #define done INTEL_GUC_MSG_IS_RESPONSE(READ_ONCE(req->status))
- 	err = wait_for_us(done, 10);
- 	if (err)
--		err = wait_for(done, 10);
-+		err = wait_for(done, timeout);
- #undef done
- 
- 	if (unlikely(err))
diff --git a/0001-INTEL_DII-drm-i915-guc-Update-MMIO-based-communicati.patch b/0001-INTEL_DII-drm-i915-guc-Update-MMIO-based-communicati.patch
deleted file mode 100644
index 2f53d665dd84..000000000000
--- a/0001-INTEL_DII-drm-i915-guc-Update-MMIO-based-communicati.patch
+++ /dev/null
@@ -1,239 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Date: Sun, 28 Jun 2020 17:33:17 +0200
-Subject: [PATCH] INTEL_DII: drm/i915/guc: Update MMIO based communication
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The MMIO based Host-to-GuC communication protocol has been
-updated to use unified HXG messages.
-
-Update our intel_guc_send_mmio() function by correctly handle
-BUSY, RETRY and FAILURE replies. Also update our documentation.
-
-v2: rebased
-v3: use HXG definitions
-v4: copy full response
-v5: minor doc fixes
-
-GuC: 55.0.0
-Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
-Reviewed-by: Michal Winiarski <michal.winiarski@intel.com> #v3
----
- .../gt/uc/abi/guc_communication_mmio_abi.h    | 63 ++++++-------
- drivers/gpu/drm/i915/gt/uc/intel_guc.c        | 92 ++++++++++++++-----
- 2 files changed, 97 insertions(+), 58 deletions(-)
-
-diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h
---- a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h
-+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h
-@@ -7,46 +7,43 @@
- #define _ABI_GUC_COMMUNICATION_MMIO_ABI_H
- 
- /**
-- * DOC: MMIO based communication
-+ * DOC: GuC MMIO based communication
-  *
-- * The MMIO based communication between Host and GuC uses software scratch
-- * registers, where first register holds data treated as message header,
-- * and other registers are used to hold message payload.
-+ * The MMIO based communication between Host and GuC relies on special
-+ * hardware registers which format could be defined by the software
-+ * (so called scratch registers).
-  *
-- * For Gen9+, GuC uses software scratch registers 0xC180-0xC1B8,
-- * but no H2G command takes more than 8 parameters and the GuC FW
-- * itself uses an 8-element array to store the H2G message.
-- *
-- *      +-----------+---------+---------+---------+
-- *      |  MMIO[0]  | MMIO[1] |   ...   | MMIO[n] |
-- *      +-----------+---------+---------+---------+
-- *      | header    |      optional payload       |
-- *      +======+====+=========+=========+=========+
-- *      | 31:28|type|         |         |         |
-- *      +------+----+         |         |         |
-- *      | 27:16|data|         |         |         |
-- *      +------+----+         |         |         |
-- *      |  15:0|code|         |         |         |
-- *      +------+----+---------+---------+---------+
-- *
-- * The message header consists of:
-- *
-- * - **type**, indicates message type
-- * - **code**, indicates message code, is specific for **type**
-- * - **data**, indicates message data, optional, depends on **code**
-+ * Each MMIO based message, both Host to GuC (H2G) and GuC to Host (G2H)
-+ * messages, which maximum length depends on number of available scratch
-+ * registers, is directly written into those scratch registers.
-  *
-- * The following message **types** are supported:
-+ * For Gen9+, there are 16 software scratch registers 0xC180-0xC1B8,
-+ * but no H2G command takes more than 8 parameters and the GuC firmware
-+ * itself uses an 8-element array to store the H2G message.
-  *
-- * - **REQUEST**, indicates Host-to-GuC request, requested GuC action code
-- *   must be priovided in **code** field. Optional action specific parameters
-- *   can be provided in remaining payload registers or **data** field.
-+ * For Gen11+, there are additional 4 registers 0x190240-0x19024C, which
-+ * are, regardless on lower count, preffered over legacy ones.
-  *
-- * - **RESPONSE**, indicates GuC-to-Host response from earlier GuC request,
-- *   action response status will be provided in **code** field. Optional
-- *   response data can be returned in remaining payload registers or **data**
-- *   field.
-+ * The MMIO based communication is mainly used during driver initialization
-+ * phase to setup the `CTB based communication`_ that will be used afterwards.
-  */
- 
- #define GUC_MAX_MMIO_MSG_LEN		8
- 
-+/**
-+ * DOC: MMIO HXG Message
-+ *
-+ * Format of the MMIO messages follows definitions of `HXG Message`_.
-+ *
-+ *  +---+-------+--------------------------------------------------------------+
-+ *  |   | Bits  | Description                                                  |
-+ *  +===+=======+==============================================================+
-+ *  | 0 |  31:0 |  +--------------------------------------------------------+  |
-+ *  +---+-------+  |                                                        |  |
-+ *  |...|       |  |  Embedded `HXG Message`_                               |  |
-+ *  +---+-------+  |                                                        |  |
-+ *  | n |  31:0 |  +--------------------------------------------------------+  |
-+ *  +---+-------+--------------------------------------------------------------+
-+ */
-+
- #endif /* _ABI_GUC_COMMUNICATION_MMIO_ABI_H */
-diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
---- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
-+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
-@@ -386,29 +386,27 @@ void intel_guc_fini(struct intel_guc *guc)
- /*
-  * This function implements the MMIO based host to GuC interface.
-  */
--int intel_guc_send_mmio(struct intel_guc *guc, const u32 *action, u32 len,
-+int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
- 			u32 *response_buf, u32 response_buf_size)
- {
-+	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
- 	struct intel_uncore *uncore = guc_to_gt(guc)->uncore;
--	u32 status;
-+	u32 header;
- 	int i;
- 	int ret;
- 
- 	GEM_BUG_ON(!len);
- 	GEM_BUG_ON(len > guc->send_regs.count);
- 
--	/* We expect only action code */
--	GEM_BUG_ON(*action & ~INTEL_GUC_MSG_CODE_MASK);
--
--	/* If CT is available, we expect to use MMIO only during init/fini */
--	GEM_BUG_ON(*action != INTEL_GUC_ACTION_REGISTER_COMMAND_TRANSPORT_BUFFER &&
--		   *action != INTEL_GUC_ACTION_DEREGISTER_COMMAND_TRANSPORT_BUFFER);
-+	GEM_BUG_ON(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, request[0]) != GUC_HXG_ORIGIN_HOST);
-+	GEM_BUG_ON(FIELD_GET(GUC_HXG_MSG_0_TYPE, request[0]) != GUC_HXG_TYPE_REQUEST);
- 
- 	mutex_lock(&guc->send_mutex);
- 	intel_uncore_forcewake_get(uncore, guc->send_regs.fw_domains);
- 
-+retry:
- 	for (i = 0; i < len; i++)
--		intel_uncore_write(uncore, guc_send_reg(guc, i), action[i]);
-+		intel_uncore_write(uncore, guc_send_reg(guc, i), request[i]);
- 
- 	intel_uncore_posting_read(uncore, guc_send_reg(guc, i - 1));
- 
-@@ -420,30 +418,74 @@ int intel_guc_send_mmio(struct intel_guc *guc, const u32 *action, u32 len,
- 	 */
- 	ret = __intel_wait_for_register_fw(uncore,
- 					   guc_send_reg(guc, 0),
--					   INTEL_GUC_MSG_TYPE_MASK,
--					   INTEL_GUC_MSG_TYPE_RESPONSE <<
--					   INTEL_GUC_MSG_TYPE_SHIFT,
--					   10, 10, &status);
--	/* If GuC explicitly returned an error, convert it to -EIO */
--	if (!ret && !INTEL_GUC_MSG_IS_RESPONSE_SUCCESS(status))
--		ret = -EIO;
-+					   GUC_HXG_MSG_0_ORIGIN,
-+					   FIELD_PREP(GUC_HXG_MSG_0_ORIGIN,
-+						      GUC_HXG_ORIGIN_GUC),
-+					   10, 10, &header);
-+	if (unlikely(ret)) {
-+timeout:
-+		drm_err(&i915->drm, "mmio request %#x: no reply %x\n",
-+			request[0], header);
-+		goto out;
-+	}
- 
--	if (ret) {
--		DRM_ERROR("MMIO: GuC action %#x failed with error %d %#x\n",
--			  action[0], ret, status);
-+	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) == GUC_HXG_TYPE_NO_RESPONSE_BUSY) {
-+#define done ({ header = intel_uncore_read(uncore, guc_send_reg(guc, 0)); \
-+		FIELD_GET(GUC_HXG_MSG_0_ORIGIN, header) != GUC_HXG_ORIGIN_GUC || \
-+		FIELD_GET(GUC_HXG_MSG_0_TYPE, header) != GUC_HXG_TYPE_NO_RESPONSE_BUSY; })
-+
-+		ret = wait_for(done, 1000);
-+		if (unlikely(ret))
-+			goto timeout;
-+		if (unlikely(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, header) !=
-+				       GUC_HXG_ORIGIN_GUC))
-+			goto proto;
-+#undef done
-+	}
-+
-+	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) == GUC_HXG_TYPE_NO_RESPONSE_RETRY) {
-+		u32 reason = FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, header);
-+
-+		drm_dbg(&i915->drm, "mmio request %#x: retrying, reason %u\n",
-+			request[0], reason);
-+		goto retry;
-+	}
-+
-+	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) == GUC_HXG_TYPE_RESPONSE_FAILURE) {
-+		u32 hint = FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, header);
-+		u32 error = FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, header);
-+
-+		drm_err(&i915->drm, "mmio request %#x: failure %x/%u\n",
-+			request[0], error, hint);
-+		ret = -ENXIO;
-+		goto out;
-+	}
-+
-+	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) != GUC_HXG_TYPE_RESPONSE_SUCCESS) {
-+proto:
-+		drm_err(&i915->drm, "mmio request %#x: unexpected reply %#x\n",
-+			request[0], header);
-+		ret = -EPROTO;
- 		goto out;
- 	}
- 
- 	if (response_buf) {
--		int count = min(response_buf_size, guc->send_regs.count - 1);
-+		int count = min(response_buf_size, guc->send_regs.count);
- 
--		for (i = 0; i < count; i++)
-+		GEM_BUG_ON(!count);
-+
-+		response_buf[0] = header;
-+
-+		for (i = 1; i < count; i++)
- 			response_buf[i] = intel_uncore_read(uncore,
--							    guc_send_reg(guc, i + 1));
--	}
-+							    guc_send_reg(guc, i));
- 
--	/* Use data from the GuC response as our return value */
--	ret = INTEL_GUC_MSG_TO_DATA(status);
-+		/* Use number of copied dwords as our return value */
-+		ret = count;
-+	} else {
-+		/* Use data from the GuC response as our return value */
-+		ret = FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, header);
-+	}
- 
- out:
- 	intel_uncore_forcewake_put(uncore, guc->send_regs.fw_domains);
diff --git a/0001-INTEL_DII-drm-i915-guc-Update-CTB-response-status-de.patch b/0001-INTEL_DII-drm-i915-guc-Update-CTB-response-status-de.patch
deleted file mode 100644
index f733162b104f..000000000000
--- a/0001-INTEL_DII-drm-i915-guc-Update-CTB-response-status-de.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Date: Fri, 19 Mar 2021 20:06:34 +0100
-Subject: [PATCH] INTEL_DII: drm/i915/guc: Update CTB response status
- definition
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Format of the STATUS dword in CTB response message now follows
-definition of the HXG header. Update our code and remove any
-obsolete legacy definitions.
-
-GuC: 55.0.0
-Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Acked-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
----
- drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h |  1 -
- drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c       | 12 ++++++------
- drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h     | 17 -----------------
- 3 files changed, 6 insertions(+), 24 deletions(-)
-
-diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
---- a/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
-+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
-@@ -7,7 +7,6 @@
- #define _ABI_GUC_ERRORS_ABI_H
- 
- enum intel_guc_response_status {
--	INTEL_GUC_RESPONSE_STATUS_SUCCESS = 0x0,
- 	INTEL_GUC_RESPONSE_STATUS_GENERIC_FAIL = 0xF000,
- };
- 
-diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
---- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
-+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
-@@ -455,7 +455,7 @@ static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
- 	 */
- 	timeout = max(10, CONFIG_DRM_I915_HEARTBEAT_INTERVAL);
- 
--#define done INTEL_GUC_MSG_IS_RESPONSE(READ_ONCE(req->status))
-+#define done (FIELD_GET(GUC_HXG_MSG_0_ORIGIN, READ_ONCE(req->status)) == GUC_HXG_ORIGIN_GUC)
- 	err = wait_for_us(done, 10);
- 	if (err)
- 		err = wait_for(done, timeout);
-@@ -510,21 +510,21 @@ static int ct_send(struct intel_guc_ct *ct,
- 	if (unlikely(err))
- 		goto unlink;
- 
--	if (!INTEL_GUC_MSG_IS_RESPONSE_SUCCESS(*status)) {
-+	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, *status) != GUC_HXG_TYPE_RESPONSE_SUCCESS) {
- 		err = -EIO;
- 		goto unlink;
- 	}
- 
- 	if (response_buf) {
- 		/* There shall be no data in the status */
--		WARN_ON(INTEL_GUC_MSG_TO_DATA(request.status));
-+		WARN_ON(FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, request.status));
- 		/* Return actual response len */
- 		err = request.response_len;
- 	} else {
- 		/* There shall be no response payload */
- 		WARN_ON(request.response_len);
- 		/* Return data decoded from the status dword */
--		err = INTEL_GUC_MSG_TO_DATA(*status);
-+		err = FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, *status);
- 	}
- 
- unlink:
-@@ -719,8 +719,8 @@ static int ct_handle_response(struct intel_guc_ct *ct, struct ct_incoming_msg *r
- 	status = response->msg[2];
- 	datalen = len - 2;
- 
--	/* Format of the status follows RESPONSE message */
--	if (unlikely(!INTEL_GUC_MSG_IS_RESPONSE(status))) {
-+	/* Format of the status dword follows HXG header */
-+	if (unlikely(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, status) != GUC_HXG_ORIGIN_GUC)) {
- 		CT_ERROR(ct, "Corrupted response (status %#x)\n", status);
- 		return -EPROTO;
- 	}
-diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
---- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
-+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
-@@ -428,23 +428,6 @@ struct guc_shared_ctx_data {
- 	struct guc_ctx_report preempt_ctx_report[GUC_MAX_ENGINES_NUM];
- } __packed;
- 
--#define __INTEL_GUC_MSG_GET(T, m) \
--	(((m) & INTEL_GUC_MSG_ ## T ## _MASK) >> INTEL_GUC_MSG_ ## T ## _SHIFT)
--#define INTEL_GUC_MSG_TO_TYPE(m)	__INTEL_GUC_MSG_GET(TYPE, m)
--#define INTEL_GUC_MSG_TO_DATA(m)	__INTEL_GUC_MSG_GET(DATA, m)
--#define INTEL_GUC_MSG_TO_CODE(m)	__INTEL_GUC_MSG_GET(CODE, m)
--
--#define __INTEL_GUC_MSG_TYPE_IS(T, m) \
--	(INTEL_GUC_MSG_TO_TYPE(m) == INTEL_GUC_MSG_TYPE_ ## T)
--#define INTEL_GUC_MSG_IS_REQUEST(m)	__INTEL_GUC_MSG_TYPE_IS(REQUEST, m)
--#define INTEL_GUC_MSG_IS_RESPONSE(m)	__INTEL_GUC_MSG_TYPE_IS(RESPONSE, m)
--
--#define INTEL_GUC_MSG_IS_RESPONSE_SUCCESS(m) \
--	 (typecheck(u32, (m)) && \
--	  ((m) & (INTEL_GUC_MSG_TYPE_MASK | INTEL_GUC_MSG_CODE_MASK)) == \
--	  ((INTEL_GUC_MSG_TYPE_RESPONSE << INTEL_GUC_MSG_TYPE_SHIFT) | \
--	   (INTEL_GUC_RESPONSE_STATUS_SUCCESS << INTEL_GUC_MSG_CODE_SHIFT)))
--
- /* This action will be programmed in C1BC - SOFT_SCRATCH_15_REG */
- enum intel_guc_recv_message {
- 	INTEL_GUC_RECV_MSG_CRASH_DUMP_POSTED = BIT(1),
diff --git a/0001-INTEL_DII-drm-i915-guc-Support-per-context-schedulin.patch b/0001-INTEL_DII-drm-i915-guc-Support-per-context-schedulin.patch
deleted file mode 100644
index ba7ec96e8f11..000000000000
--- a/0001-INTEL_DII-drm-i915-guc-Support-per-context-schedulin.patch
+++ /dev/null
@@ -1,104 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: John Harrison <John.C.Harrison@Intel.com>
-Date: Tue, 16 Feb 2021 12:46:27 -0800
-Subject: [PATCH] INTEL_DII: drm/i915/guc: Support per context scheduling
- policies
-
-GuC firmware v53.0.0 introduced per context scheduling policies. This
-includes changes to some of the ADS structures which are required to
-load the firmware even if not using GuC submission.
-
-Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
----
- drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c  | 26 +++--------------
- drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h | 31 +++++----------------
- 2 files changed, 11 insertions(+), 46 deletions(-)
-
-diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
---- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
-+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
-@@ -59,30 +59,12 @@ static u32 guc_ads_blob_size(struct intel_guc *guc)
- 	       guc_ads_private_data_size(guc);
- }
- 
--static void guc_policy_init(struct guc_policy *policy)
--{
--	policy->execution_quantum = POLICY_DEFAULT_EXECUTION_QUANTUM_US;
--	policy->preemption_time = POLICY_DEFAULT_PREEMPTION_TIME_US;
--	policy->fault_time = POLICY_DEFAULT_FAULT_TIME_US;
--	policy->policy_flags = 0;
--}
--
- static void guc_policies_init(struct guc_policies *policies)
- {
--	struct guc_policy *policy;
--	u32 p, i;
--
--	policies->dpc_promote_time = POLICY_DEFAULT_DPC_PROMOTE_TIME_US;
--	policies->max_num_work_items = POLICY_MAX_NUM_WI;
--
--	for (p = 0; p < GUC_CLIENT_PRIORITY_NUM; p++) {
--		for (i = 0; i < GUC_MAX_ENGINE_CLASSES; i++) {
--			policy = &policies->policy[p][i];
--
--			guc_policy_init(policy);
--		}
--	}
--
-+	policies->dpc_promote_time = GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US;
-+	policies->max_num_work_items = GLOBAL_POLICY_MAX_NUM_WI;
-+	/* Disable automatic resets as not yet supported. */
-+	policies->global_flags = GLOBAL_POLICY_DISABLE_ENGINE_RESET;
- 	policies->is_valid = 1;
- }
- 
-diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
---- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
-+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
-@@ -261,32 +261,14 @@ struct guc_stage_desc {
- 
- /* Scheduling policy settings */
- 
--/* Reset engine upon preempt failure */
--#define POLICY_RESET_ENGINE		(1<<0)
--/* Preempt to idle on quantum expiry */
--#define POLICY_PREEMPT_TO_IDLE		(1<<1)
--
--#define POLICY_MAX_NUM_WI 15
--#define POLICY_DEFAULT_DPC_PROMOTE_TIME_US 500000
--#define POLICY_DEFAULT_EXECUTION_QUANTUM_US 1000000
--#define POLICY_DEFAULT_PREEMPTION_TIME_US 500000
--#define POLICY_DEFAULT_FAULT_TIME_US 250000
--
--struct guc_policy {
--	/* Time for one workload to execute. (in micro seconds) */
--	u32 execution_quantum;
--	/* Time to wait for a preemption request to completed before issuing a
--	 * reset. (in micro seconds). */
--	u32 preemption_time;
--	/* How much time to allow to run after the first fault is observed.
--	 * Then preempt afterwards. (in micro seconds) */
--	u32 fault_time;
--	u32 policy_flags;
--	u32 reserved[8];
--} __packed;
-+#define GLOBAL_POLICY_MAX_NUM_WI 15
-+
-+/* Don't reset an engine upon preemption failure */
-+#define GLOBAL_POLICY_DISABLE_ENGINE_RESET				BIT(0)
-+
-+#define GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US 500000
- 
- struct guc_policies {
--	struct guc_policy policy[GUC_CLIENT_PRIORITY_NUM][GUC_MAX_ENGINE_CLASSES];
- 	u32 submission_queue_depth[GUC_MAX_ENGINE_CLASSES];
- 	/* In micro seconds. How much time to allow before DPC processing is
- 	 * called back via interrupt (to prevent DPC queue drain starving).
-@@ -300,6 +282,7 @@ struct guc_policies {
- 	 * idle. */
- 	u32 max_num_work_items;
- 
-+	u32 global_flags;
- 	u32 reserved[4];
- } __packed;
- 
diff --git a/0001-INTEL_DII-drm-i915-guc-Add-flag-for-mark-broken-CTB.patch b/0001-INTEL_DII-drm-i915-guc-Add-flag-for-mark-broken-CTB.patch
deleted file mode 100644
index 3cbbcc491459..000000000000
--- a/0001-INTEL_DII-drm-i915-guc-Add-flag-for-mark-broken-CTB.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Date: Thu, 8 Apr 2021 14:24:28 +0200
-Subject: [PATCH] INTEL_DII: drm/i915/guc: Add flag for mark broken CTB
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Once CTB descriptor is found in error state, either set by GuC
-or us, there is no need continue checking descriptor any more,
-we can rely on our internal flag.
-
-v2: Clear ctb->broken in guc_ct_buffer_reset (Matthew Brost)
-
-Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Acked-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
----
- drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 13 +++++++++++--
- drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h |  2 ++
- 2 files changed, 13 insertions(+), 2 deletions(-)
-
-diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
---- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
-+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
-@@ -123,6 +123,7 @@ static void guc_ct_buffer_desc_init(struct guc_ct_buffer_desc *desc,
- 
- static void guc_ct_buffer_reset(struct intel_guc_ct_buffer *ctb, u32 cmds_addr)
- {
-+	ctb->broken = false;
- 	guc_ct_buffer_desc_init(ctb->desc, cmds_addr, ctb->size);
- }
- 
-@@ -365,9 +366,12 @@ static int ct_write(struct intel_guc_ct *ct,
- 	u32 *cmds = ctb->cmds;
- 	unsigned int i;
- 
--	if (unlikely(desc->is_in_error))
-+	if (unlikely(ctb->broken))
- 		return -EPIPE;
- 
-+	if (unlikely(desc->is_in_error))
-+		goto corrupted;
-+
- 	if (unlikely(!IS_ALIGNED(head | tail, 4) ||
- 		     (tail | head) >= size))
- 		goto corrupted;
-@@ -423,6 +427,7 @@ static int ct_write(struct intel_guc_ct *ct,
- 	CT_ERROR(ct, "Corrupted descriptor addr=%#x head=%u tail=%u size=%u\n",
- 		 desc->addr, desc->head, desc->tail, desc->size);
- 	desc->is_in_error = 1;
-+	ctb->broken = true;
- 	return -EPIPE;
- }
- 
-@@ -608,9 +613,12 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
- 	unsigned int i;
- 	u32 header;
- 
--	if (unlikely(desc->is_in_error))
-+	if (unlikely(ctb->broken))
- 		return -EPIPE;
- 
-+	if (unlikely(desc->is_in_error))
-+		goto corrupted;
-+
- 	if (unlikely(!IS_ALIGNED(head | tail, 4) ||
- 		     (tail | head) >= size))
- 		goto corrupted;
-@@ -674,6 +682,7 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
- 	CT_ERROR(ct, "Corrupted descriptor addr=%#x head=%u tail=%u size=%u\n",
- 		 desc->addr, desc->head, desc->tail, desc->size);
- 	desc->is_in_error = 1;
-+	ctb->broken = true;
- 	return -EPIPE;
- }
- 
-diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
---- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
-+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
-@@ -32,12 +32,14 @@ struct intel_guc;
-  * @desc: pointer to the buffer descriptor
-  * @cmds: pointer to the commands buffer
-  * @size: size of the commands buffer
-+ * @broken: flag to indicate if descriptor data is broken
-  */
- struct intel_guc_ct_buffer {
- 	spinlock_t lock;
- 	struct guc_ct_buffer_desc *desc;
- 	u32 *cmds;
- 	u32 size;
-+	bool broken;
- };
- 
- 
diff --git a/0001-INTEL_DII-drm-i915-guc-New-definition-of-the-CTB-des.patch b/0001-INTEL_DII-drm-i915-guc-New-definition-of-the-CTB-des.patch
deleted file mode 100644
index e43b2a8f0f4d..000000000000
--- a/0001-INTEL_DII-drm-i915-guc-New-definition-of-the-CTB-des.patch
+++ /dev/null
@@ -1,271 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Date: Thu, 4 Mar 2021 21:56:06 +0100
-Subject: [PATCH] INTEL_DII: drm/i915/guc: New definition of the CTB descriptor
-
-Definition of the CTB descriptor has changed, leaving only
-minimal shared fields like HEAD/TAIL/STATUS.
-
-Both HEAD and TAIL are now in dwords.
-
-Add some ABI documentation and implement required changes.
-
-GuC: 57.0.0
-GuC: 60.0.0
-Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
----
- .../gt/uc/abi/guc_communication_ctb_abi.h     | 70 ++++++++++++++-----
- drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 70 +++++++++----------
- drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |  2 +-
- 3 files changed, 85 insertions(+), 57 deletions(-)
-
-diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
---- a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
-+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
-@@ -7,6 +7,58 @@
- #define _ABI_GUC_COMMUNICATION_CTB_ABI_H
- 
- #include <linux/types.h>
-+#include <linux/build_bug.h>
-+
-+#include "guc_messages_abi.h"
-+
-+/**
-+ * DOC: CT Buffer
-+ *
-+ * TBD
-+ */
-+
-+/**
-+ * DOC: CTB Descriptor
-+ *
-+ *  +---+-------+--------------------------------------------------------------+
-+ *  |   | Bits  | Description                                                  |
-+ *  +===+=======+==============================================================+
-+ *  | 0 |  31:0 | **HEAD** - offset (in dwords) to the last dword that was     |
-+ *  |   |       | read from the `CT Buffer`_.                                  |
-+ *  |   |       | It can only be updated by the receiver.                      |
-+ *  +---+-------+--------------------------------------------------------------+
-+ *  | 1 |  31:0 | **TAIL** - offset (in dwords) to the last dword that was     |
-+ *  |   |       | written to the `CT Buffer`_.                                 |
-+ *  |   |       | It can only be updated by the sender.                        |
-+ *  +---+-------+--------------------------------------------------------------+
-+ *  | 2 |  31:0 | **STATUS** - status of the CTB                               |
-+ *  |   |       |                                                              |
-+ *  |   |       |   - _`GUC_CTB_STATUS_NO_ERROR` = 0 (normal operation)        |
-+ *  |   |       |   - _`GUC_CTB_STATUS_OVERFLOW` = 1 (head/tail too large)     |
-+ *  |   |       |   - _`GUC_CTB_STATUS_UNDERFLOW` = 2 (truncated message)      |
-+ *  |   |       |   - _`GUC_CTB_STATUS_MISMATCH` = 4 (head/tail modified)      |
-+ *  |   |       |   - _`GUC_CTB_STATUS_NO_BACKCHANNEL` = 8                     |
-+ *  |   |       |   - _`GUC_CTB_STATUS_MALFORMED_MSG` = 16                     |
-+ *  +---+-------+--------------------------------------------------------------+
-+ *  |...|       | RESERVED = MBZ                                               |
-+ *  +---+-------+--------------------------------------------------------------+
-+ *  | 15|  31:0 | RESERVED = MBZ                                               |
-+ *  +---+-------+--------------------------------------------------------------+
-+ */
-+
-+struct guc_ct_buffer_desc {
-+	u32 head;
-+	u32 tail;
-+	u32 status;
-+#define GUC_CTB_STATUS_NO_ERROR				0
-+#define GUC_CTB_STATUS_OVERFLOW				(1 << 0)
-+#define GUC_CTB_STATUS_UNDERFLOW			(1 << 1)
-+#define GUC_CTB_STATUS_MISMATCH				(1 << 2)
-+#define GUC_CTB_STATUS_NO_BACKCHANNEL			(1 << 3)
-+#define GUC_CTB_STATUS_MALFORMED_MSG			(1 << 4)
-+	u32 reserved[13];
-+} __packed;
-+static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
- 
- /**
-  * DOC: CTB based communication
-@@ -60,24 +112,6 @@
-  * - **flags**, holds various bits to control message handling
-  */
- 
--/*
-- * Describes single command transport buffer.
-- * Used by both guc-master and clients.
-- */
--struct guc_ct_buffer_desc {
--	u32 addr;		/* gfx address */
--	u64 host_private;	/* host private data */
--	u32 size;		/* size in bytes */
--	u32 head;		/* offset updated by GuC*/
--	u32 tail;		/* offset updated by owner */
--	u32 is_in_error;	/* error indicator */
--	u32 reserved1;
--	u32 reserved2;
--	u32 owner;		/* id of the channel owner */
--	u32 owner_sub_id;	/* owner-defined field for extra tracking */
--	u32 reserved[5];
--} __packed;
--
- /* Type of command transport buffer */
- #define INTEL_GUC_CT_BUFFER_TYPE_SEND	0x0u
- #define INTEL_GUC_CT_BUFFER_TYPE_RECV	0x1u
-diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
---- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
-+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
-@@ -112,32 +112,28 @@ static inline const char *guc_ct_buffer_type_to_str(u32 type)
- 	}
- }
- 
--static void guc_ct_buffer_desc_init(struct guc_ct_buffer_desc *desc,
--				    u32 cmds_addr, u32 size)
-+static void guc_ct_buffer_desc_init(struct guc_ct_buffer_desc *desc)
- {
- 	memset(desc, 0, sizeof(*desc));
--	desc->addr = cmds_addr;
--	desc->size = size;
--	desc->owner = CTB_OWNER_HOST;
- }
- 
--static void guc_ct_buffer_reset(struct intel_guc_ct_buffer *ctb, u32 cmds_addr)
-+static void guc_ct_buffer_reset(struct intel_guc_ct_buffer *ctb)
- {
- 	ctb->broken = false;
--	guc_ct_buffer_desc_init(ctb->desc, cmds_addr, ctb->size);
-+	guc_ct_buffer_desc_init(ctb->desc);
- }
- 
- static void guc_ct_buffer_init(struct intel_guc_ct_buffer *ctb,
- 			       struct guc_ct_buffer_desc *desc,
--			       u32 *cmds, u32 size)
-+			       u32 *cmds, u32 size_in_bytes)
- {
--	GEM_BUG_ON(size % 4);
-+	GEM_BUG_ON(size_in_bytes % 4);
- 
- 	ctb->desc = desc;
- 	ctb->cmds = cmds;
--	ctb->size = size;
-+	ctb->size = size_in_bytes / 4;
- 
--	guc_ct_buffer_reset(ctb, 0);
-+	guc_ct_buffer_reset(ctb);
- }
- 
- static int guc_action_register_ct_buffer(struct intel_guc *guc,
-@@ -279,10 +275,10 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
- 
- 	/* (re)initialize descriptors */
- 	cmds = base + ptrdiff(ct->ctbs.send.cmds, blob);
--	guc_ct_buffer_reset(&ct->ctbs.send, cmds);
-+	guc_ct_buffer_reset(&ct->ctbs.send);
- 
- 	cmds = base + ptrdiff(ct->ctbs.recv.cmds, blob);
--	guc_ct_buffer_reset(&ct->ctbs.recv, cmds);
-+	guc_ct_buffer_reset(&ct->ctbs.recv);
- 
- 	/*
- 	 * Register both CT buffers starting with RECV buffer.
-@@ -369,17 +365,15 @@ static int ct_write(struct intel_guc_ct *ct,
- 	if (unlikely(ctb->broken))
- 		return -EPIPE;
- 
--	if (unlikely(desc->is_in_error))
-+	if (unlikely(desc->status))
- 		goto corrupted;
- 
--	if (unlikely(!IS_ALIGNED(head | tail, 4) ||
--		     (tail | head) >= size))
-+	if (unlikely((tail | head) >= size)) {
-+		CT_ERROR(ct, "Invalid offsets head=%u tail=%u (size=%u)\n",
-+			 head, tail, size);
-+		desc->status |= GUC_CTB_STATUS_OVERFLOW;
- 		goto corrupted;
--
--	/* later calculations will be done in dwords */
--	head /= 4;
--	tail /= 4;
--	size /= 4;
-+	}
- 
- 	/*
- 	 * tail == head condition indicates empty. GuC FW does not support
-@@ -419,14 +413,14 @@ static int ct_write(struct intel_guc_ct *ct,
- 	}
- 	GEM_BUG_ON(tail > size);
- 
--	/* now update desc tail (back in bytes) */
--	desc->tail = tail * 4;
-+	/* now update descriptor */
-+	WRITE_ONCE(desc->tail, tail);
-+
- 	return 0;
- 
- corrupted:
--	CT_ERROR(ct, "Corrupted descriptor addr=%#x head=%u tail=%u size=%u\n",
--		 desc->addr, desc->head, desc->tail, desc->size);
--	desc->is_in_error = 1;
-+	CT_ERROR(ct, "Corrupted descriptor head=%u tail=%u status=%#x\n",
-+		 desc->head, desc->tail, desc->status);
- 	ctb->broken = true;
- 	return -EPIPE;
- }
-@@ -616,17 +610,15 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
- 	if (unlikely(ctb->broken))
- 		return -EPIPE;
- 
--	if (unlikely(desc->is_in_error))
-+	if (unlikely(desc->status))
- 		goto corrupted;
- 
--	if (unlikely(!IS_ALIGNED(head | tail, 4) ||
--		     (tail | head) >= size))
-+	if (unlikely((tail | head) >= size)) {
-+		CT_ERROR(ct, "Invalid offsets head=%u tail=%u (size=%u)\n",
-+			 head, tail, size);
-+		desc->status |= GUC_CTB_STATUS_OVERFLOW;
- 		goto corrupted;
--
--	/* later calculations will be done in dwords */
--	head /= 4;
--	tail /= 4;
--	size /= 4;
-+	}
- 
- 	/* tail == head condition indicates empty */
- 	available = tail - head;
-@@ -653,6 +645,7 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
- 			      size - head : available - 1), &cmds[head],
- 			 4 * (head + available - 1 > size ?
- 			      available - 1 - size + head : 0), &cmds[0]);
-+		desc->status |= GUC_CTB_STATUS_UNDERFLOW;
- 		goto corrupted;
- 	}
- 
-@@ -675,13 +668,14 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
- 	}
- 	CT_DEBUG(ct, "received %*ph\n", 4 * len, (*msg)->msg);
- 
--	desc->head = head * 4;
-+	/* now update descriptor */
-+	WRITE_ONCE(desc->head, head);
-+
- 	return available - len;
- 
- corrupted:
--	CT_ERROR(ct, "Corrupted descriptor addr=%#x head=%u tail=%u size=%u\n",
--		 desc->addr, desc->head, desc->tail, desc->size);
--	desc->is_in_error = 1;
-+	CT_ERROR(ct, "Corrupted descriptor head=%u tail=%u status=%#x\n",
-+		 desc->head, desc->tail, desc->status);
- 	ctb->broken = true;
- 	return -EPIPE;
- }
-diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
---- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
-+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
-@@ -31,7 +31,7 @@ struct intel_guc;
-  * @lock: protects access to the commands buffer and buffer descriptor
-  * @desc: pointer to the buffer descriptor
-  * @cmds: pointer to the commands buffer
-- * @size: size of the commands buffer
-+ * @size: size of the commands buffer in dwords
-  * @broken: flag to indicate if descriptor data is broken
-  */
- struct intel_guc_ct_buffer {
diff --git a/0001-INTEL_DII-drm-i915-guc-New-definition-of-the-CTB-reg.patch b/0001-INTEL_DII-drm-i915-guc-New-definition-of-the-CTB-reg.patch
deleted file mode 100644
index e820388e1b32..000000000000
--- a/0001-INTEL_DII-drm-i915-guc-New-definition-of-the-CTB-reg.patch
+++ /dev/null
@@ -1,305 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Date: Thu, 4 Mar 2021 21:56:06 +0100
-Subject: [PATCH] INTEL_DII: drm/i915/guc: New definition of the CTB
- registration action
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Definition of the CTB registration action has changed.
-Add some ABI documentation and implement required changes.
-
-v2: fix doc, use proper mask for dereg (Matthew)
-v3: convert ctb.size in dwords back to bytes on register ctb
-v4: minor kernel-doc fixes
-
-GuC: 57.0.0
-Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Cc: Matthew Brost <matthew.brost@intel.com>
-Acked-by: Piotr Piórkowski <piotr.piorkowski@intel.com> #4
----
- .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  | 107 ++++++++++++++++++
- .../gt/uc/abi/guc_communication_ctb_abi.h     |   4 -
- drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  76 ++++++++-----
- 3 files changed, 152 insertions(+), 35 deletions(-)
-
-diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
---- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
-+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
-@@ -6,6 +6,113 @@
- #ifndef _ABI_GUC_ACTIONS_ABI_H
- #define _ABI_GUC_ACTIONS_ABI_H
- 
-+/**
-+ * DOC: HOST2GUC_REGISTER_CTB
-+ *
-+ * This message is used as part of the `CTB based communication`_ setup.
-+ *
-+ * This message must be sent as `MMIO HXG Message`_.
-+ *
-+ *  +---+-------+--------------------------------------------------------------+
-+ *  |   | Bits  | Description                                                  |
-+ *  +===+=======+==============================================================+
-+ *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
-+ *  |   +-------+--------------------------------------------------------------+
-+ *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
-+ *  |   +-------+--------------------------------------------------------------+
-+ *  |   | 27:16 | DATA0 = MBZ                                                  |
-+ *  |   +-------+--------------------------------------------------------------+
-+ *  |   |  15:0 | ACTION = _`GUC_ACTION_HOST2GUC_REGISTER_CTB` = 0x5200        |
-+ *  +---+-------+--------------------------------------------------------------+
-+ *  | 1 | 31:12 | RESERVED = MBZ                                               |
-+ *  |   +-------+--------------------------------------------------------------+
-+ *  |   |  11:8 | **TYPE** - type for the `CT Buffer`_                         |
-+ *  |   |       |                                                              |
-+ *  |   |       |   - _`GUC_CTB_TYPE_HOST2GUC` = 0                             |
-+ *  |   |       |   - _`GUC_CTB_TYPE_GUC2HOST` = 1                             |
-+ *  |   +-------+--------------------------------------------------------------+
-+ *  |   |   7:0 | **SIZE** - size of the `CT Buffer`_ in 4K units minus 1      |
-+ *  +---+-------+--------------------------------------------------------------+
-+ *  | 2 |  31:0 | **DESC_ADDR** - GGTT address of the `CTB Descriptor`_        |
-+ *  +---+-------+--------------------------------------------------------------+
-+ *  | 3 |  31:0 | **BUFF_ADDF** - GGTT address of the `CT Buffer`_             |
-+ *  +---+-------+--------------------------------------------------------------+
-+*
-+ *  +---+-------+--------------------------------------------------------------+
-+ *  |   | Bits  | Description                                                  |
-+ *  +===+=======+==============================================================+
-+ *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
-+ *  |   +-------+--------------------------------------------------------------+
-+ *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
-+ *  |   +-------+--------------------------------------------------------------+
-+ *  |   |  27:0 | DATA0 = MBZ                                                  |
-+ *  +---+-------+--------------------------------------------------------------+
-+ */
-+#define GUC_ACTION_HOST2GUC_REGISTER_CTB		0x4505 // FIXME 0x5200
-+
-+#define HOST2GUC_REGISTER_CTB_REQUEST_MSG_LEN		(GUC_HXG_REQUEST_MSG_MIN_LEN + 3u)
-+#define HOST2GUC_REGISTER_CTB_REQUEST_MSG_0_MBZ		GUC_HXG_REQUEST_MSG_0_DATA0
-+#define HOST2GUC_REGISTER_CTB_REQUEST_MSG_1_MBZ		(0xfffff << 12)
-+#define HOST2GUC_REGISTER_CTB_REQUEST_MSG_1_TYPE	(0xf << 8)
-+#define   GUC_CTB_TYPE_HOST2GUC				0u
-+#define   GUC_CTB_TYPE_GUC2HOST				1u
-+#define HOST2GUC_REGISTER_CTB_REQUEST_MSG_1_SIZE	(0xff << 0)
-+#define HOST2GUC_REGISTER_CTB_REQUEST_MSG_2_DESC_ADDR	GUC_HXG_REQUEST_MSG_n_DATAn
-+#define HOST2GUC_REGISTER_CTB_REQUEST_MSG_3_BUFF_ADDR	GUC_HXG_REQUEST_MSG_n_DATAn
-+
-+#define HOST2GUC_REGISTER_CTB_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
-+#define HOST2GUC_REGISTER_CTB_RESPONSE_MSG_0_MBZ	GUC_HXG_RESPONSE_MSG_0_DATA0
-+
-+/**
-+ * DOC: HOST2GUC_DEREGISTER_CTB
-+ *
-+ * This message is used as part of the `CTB based communication`_ teardown.
-+ *
-+ * This message must be sent as `MMIO HXG Message`_.
-+ *
-+ *  +---+-------+--------------------------------------------------------------+
-+ *  |   | Bits  | Description                                                  |
-+ *  +===+=======+==============================================================+
-+ *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
-+ *  |   +-------+--------------------------------------------------------------+
-+ *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
-+ *  |   +-------+--------------------------------------------------------------+
-+ *  |   | 27:16 | DATA0 = MBZ                                                  |
-+ *  |   +-------+--------------------------------------------------------------+
-+ *  |   |  15:0 | ACTION = _`GUC_ACTION_HOST2GUC_DEREGISTER_CTB` = 0x5201      |
-+ *  +---+-------+--------------------------------------------------------------+
-+ *  | 1 | 31:12 | RESERVED = MBZ                                               |
-+ *  |   +-------+--------------------------------------------------------------+
-+ *  |   |  11:8 | **TYPE** - type of the `CT Buffer`_                          |
-+ *  |   |       |                                                              |
-+ *  |   |       | see `GUC_ACTION_HOST2GUC_REGISTER_CTB`_                      |
-+ *  |   +-------+--------------------------------------------------------------+
-+ *  |   |   7:0 | RESERVED = MBZ                                               |
-+ *  +---+-------+--------------------------------------------------------------+
-+*
-+ *  +---+-------+--------------------------------------------------------------+
-+ *  |   | Bits  | Description                                                  |
-+ *  +===+=======+==============================================================+
-+ *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
-+ *  |   +-------+--------------------------------------------------------------+
-+ *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
-+ *  |   +-------+--------------------------------------------------------------+
-+ *  |   |  27:0 | DATA0 = MBZ                                                  |
-+ *  +---+-------+--------------------------------------------------------------+
-+ */
-+#define GUC_ACTION_HOST2GUC_DEREGISTER_CTB		0x4506 // FIXME 0x5201
-+
-+#define HOST2GUC_DEREGISTER_CTB_REQUEST_MSG_LEN		(GUC_HXG_REQUEST_MSG_MIN_LEN + 1u)
-+#define HOST2GUC_DEREGISTER_CTB_REQUEST_MSG_0_MBZ	GUC_HXG_REQUEST_MSG_0_DATA0
-+#define HOST2GUC_DEREGISTER_CTB_REQUEST_MSG_1_MBZ	(0xfffff << 12)
-+#define HOST2GUC_DEREGISTER_CTB_REQUEST_MSG_1_TYPE	(0xf << 8)
-+#define HOST2GUC_DEREGISTER_CTB_REQUEST_MSG_1_MBZ2	(0xff << 0)
-+
-+#define HOST2GUC_DEREGISTER_CTB_RESPONSE_MSG_LEN	GUC_HXG_RESPONSE_MSG_MIN_LEN
-+#define HOST2GUC_DEREGISTER_CTB_RESPONSE_MSG_0_MBZ	GUC_HXG_RESPONSE_MSG_0_DATA0
-+
-+/* legacy definitions */
-+
- enum intel_guc_action {
- 	INTEL_GUC_ACTION_DEFAULT = 0x0,
- 	INTEL_GUC_ACTION_REQUEST_PREEMPTION = 0x2,
-diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
---- a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
-+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
-@@ -112,10 +112,6 @@ static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
-  * - **flags**, holds various bits to control message handling
-  */
- 
--/* Type of command transport buffer */
--#define INTEL_GUC_CT_BUFFER_TYPE_SEND	0x0u
--#define INTEL_GUC_CT_BUFFER_TYPE_RECV	0x1u
--
- /*
-  * Definition of the command transport message header (DW0)
-  *
-diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
---- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
-+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
-@@ -103,9 +103,9 @@ void intel_guc_ct_init_early(struct intel_guc_ct *ct)
- static inline const char *guc_ct_buffer_type_to_str(u32 type)
- {
- 	switch (type) {
--	case INTEL_GUC_CT_BUFFER_TYPE_SEND:
-+	case GUC_CTB_TYPE_HOST2GUC:
- 		return "SEND";
--	case INTEL_GUC_CT_BUFFER_TYPE_RECV:
-+	case GUC_CTB_TYPE_GUC2HOST:
- 		return "RECV";
- 	default:
- 		return "<invalid>";
-@@ -136,25 +136,33 @@ static void guc_ct_buffer_init(struct intel_guc_ct_buffer *ctb,
- 	guc_ct_buffer_reset(ctb);
- }
- 
--static int guc_action_register_ct_buffer(struct intel_guc *guc,
--					 u32 desc_addr,
--					 u32 type)
-+static int guc_action_register_ct_buffer(struct intel_guc *guc, u32 type,
-+					 u32 desc_addr, u32 buff_addr, u32 size)
- {
--	u32 action[] = {
--		INTEL_GUC_ACTION_REGISTER_COMMAND_TRANSPORT_BUFFER,
--		desc_addr,
--		sizeof(struct guc_ct_buffer_desc),
--		type
-+	u32 request[HOST2GUC_REGISTER_CTB_REQUEST_MSG_LEN] = {
-+		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
-+		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
-+		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_HOST2GUC_REGISTER_CTB),
-+		FIELD_PREP(HOST2GUC_REGISTER_CTB_REQUEST_MSG_1_SIZE, size / SZ_4K - 1) |
-+		FIELD_PREP(HOST2GUC_REGISTER_CTB_REQUEST_MSG_1_TYPE, type),
-+		FIELD_PREP(HOST2GUC_REGISTER_CTB_REQUEST_MSG_2_DESC_ADDR, desc_addr),
-+		FIELD_PREP(HOST2GUC_REGISTER_CTB_REQUEST_MSG_3_BUFF_ADDR, buff_addr),
- 	};
- 
--	/* Can't use generic send(), CT registration must go over MMIO */
--	return intel_guc_send_mmio(guc, action, ARRAY_SIZE(action), NULL, 0);
-+	GEM_BUG_ON(type != GUC_CTB_TYPE_HOST2GUC && type != GUC_CTB_TYPE_GUC2HOST);
-+	GEM_BUG_ON(size % SZ_4K);
-+
-+	/* CT registration must go over MMIO */
-+	return intel_guc_send_mmio(guc, request, ARRAY_SIZE(request), NULL, 0);
- }
- 
--static int ct_register_buffer(struct intel_guc_ct *ct, u32 desc_addr, u32 type)
-+static int ct_register_buffer(struct intel_guc_ct *ct, u32 type,
-+			      u32 desc_addr, u32 buff_addr, u32 size)
- {
--	int err = guc_action_register_ct_buffer(ct_to_guc(ct), desc_addr, type);
-+	int err;
- 
-+	err = guc_action_register_ct_buffer(ct_to_guc(ct), type,
-+					    desc_addr, buff_addr, size);
- 	if (unlikely(err))
- 		CT_ERROR(ct, "Failed to register %s buffer (err=%d)\n",
- 			 guc_ct_buffer_type_to_str(type), err);
-@@ -163,14 +171,17 @@ static int ct_register_buffer(struct intel_guc_ct *ct, u32 desc_addr, u32 type)
- 
- static int guc_action_deregister_ct_buffer(struct intel_guc *guc, u32 type)
- {
--	u32 action[] = {
--		INTEL_GUC_ACTION_DEREGISTER_COMMAND_TRANSPORT_BUFFER,
--		CTB_OWNER_HOST,
--		type
-+	u32 request[HOST2GUC_DEREGISTER_CTB_REQUEST_MSG_LEN] = {
-+		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
-+		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
-+		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_HOST2GUC_DEREGISTER_CTB),
-+		FIELD_PREP(HOST2GUC_DEREGISTER_CTB_REQUEST_MSG_1_TYPE, type),
- 	};
- 
--	/* Can't use generic send(), CT deregistration must go over MMIO */
--	return intel_guc_send_mmio(guc, action, ARRAY_SIZE(action), NULL, 0);
-+	GEM_BUG_ON(type != GUC_CTB_TYPE_HOST2GUC && type != GUC_CTB_TYPE_GUC2HOST);
-+
-+	/* CT deregistration must go over MMIO */
-+	return intel_guc_send_mmio(guc, request, ARRAY_SIZE(request), NULL, 0);
- }
- 
- static int ct_deregister_buffer(struct intel_guc_ct *ct, u32 type)
-@@ -258,7 +269,7 @@ void intel_guc_ct_fini(struct intel_guc_ct *ct)
- int intel_guc_ct_enable(struct intel_guc_ct *ct)
- {
- 	struct intel_guc *guc = ct_to_guc(ct);
--	u32 base, cmds;
-+	u32 base, desc, cmds;
- 	void *blob;
- 	int err;
- 
-@@ -274,23 +285,26 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
- 	GEM_BUG_ON(blob != ct->ctbs.send.desc);
- 
- 	/* (re)initialize descriptors */
--	cmds = base + ptrdiff(ct->ctbs.send.cmds, blob);
- 	guc_ct_buffer_reset(&ct->ctbs.send);
--
--	cmds = base + ptrdiff(ct->ctbs.recv.cmds, blob);
- 	guc_ct_buffer_reset(&ct->ctbs.recv);
- 
- 	/*
- 	 * Register both CT buffers starting with RECV buffer.
- 	 * Descriptors are in first half of the blob.
- 	 */
--	err = ct_register_buffer(ct, base + ptrdiff(ct->ctbs.recv.desc, blob),
--				 INTEL_GUC_CT_BUFFER_TYPE_RECV);
-+	desc = base + ptrdiff(ct->ctbs.recv.desc, blob);
-+	cmds = base + ptrdiff(ct->ctbs.recv.cmds, blob);
-+	err = ct_register_buffer(ct, GUC_CTB_TYPE_GUC2HOST,
-+				 desc, cmds, ct->ctbs.recv.size * 4);
-+
- 	if (unlikely(err))
- 		goto err_out;
- 
--	err = ct_register_buffer(ct, base + ptrdiff(ct->ctbs.send.desc, blob),
--				 INTEL_GUC_CT_BUFFER_TYPE_SEND);
-+	desc = base + ptrdiff(ct->ctbs.send.desc, blob);
-+	cmds = base + ptrdiff(ct->ctbs.send.cmds, blob);
-+	err = ct_register_buffer(ct, GUC_CTB_TYPE_HOST2GUC,
-+				 desc, cmds, ct->ctbs.send.size * 4);
-+
- 	if (unlikely(err))
- 		goto err_deregister;
- 
-@@ -299,7 +313,7 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
- 	return 0;
- 
- err_deregister:
--	ct_deregister_buffer(ct, INTEL_GUC_CT_BUFFER_TYPE_RECV);
-+	ct_deregister_buffer(ct, GUC_CTB_TYPE_GUC2HOST);
- err_out:
- 	CT_PROBE_ERROR(ct, "Failed to enable CTB (%pe)\n", ERR_PTR(err));
- 	return err;
-@@ -318,8 +332,8 @@ void intel_guc_ct_disable(struct intel_guc_ct *ct)
- 	ct->enabled = false;
- 
- 	if (intel_guc_is_fw_running(guc)) {
--		ct_deregister_buffer(ct, INTEL_GUC_CT_BUFFER_TYPE_SEND);
--		ct_deregister_buffer(ct, INTEL_GUC_CT_BUFFER_TYPE_RECV);
-+		ct_deregister_buffer(ct, GUC_CTB_TYPE_HOST2GUC);
-+		ct_deregister_buffer(ct, GUC_CTB_TYPE_GUC2HOST);
- 	}
- }
- 
diff --git a/0001-INTEL_DII-drm-i915-guc-New-CTB-based-communication.patch b/0001-INTEL_DII-drm-i915-guc-New-CTB-based-communication.patch
deleted file mode 100644
index 930c50580d66..000000000000
--- a/0001-INTEL_DII-drm-i915-guc-New-CTB-based-communication.patch
+++ /dev/null
@@ -1,395 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Date: Thu, 8 Apr 2021 10:11:50 +0200
-Subject: [PATCH] INTEL_DII: drm/i915/guc: New CTB based communication
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Format of the CTB messages has changed:
- - support for multiple formats
- - message fence is now part of the header
- - reuse of unified HXG message formats
-
-v2: rebased
-v3: introduce hxg_len
-
-Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Acked-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
----
- .../gt/uc/abi/guc_communication_ctb_abi.h     |  56 +++++
- drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 194 +++++++-----------
- drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |   2 +-
- 3 files changed, 135 insertions(+), 117 deletions(-)
-
-diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
---- a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
-+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
-@@ -60,6 +60,62 @@ struct guc_ct_buffer_desc {
- } __packed;
- static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
- 
-+/**
-+ * DOC: CTB Message
-+ *
-+ *  +---+-------+--------------------------------------------------------------+
-+ *  |   | Bits  | Description                                                  |
-+ *  +===+=======+==============================================================+
-+ *  | 0 | 31:16 | **FENCE** - message identifier                               |
-+ *  |   +-------+--------------------------------------------------------------+
-+ *  |   | 15:12 | **FORMAT** - format of the CTB message                       |
-+ *  |   |       |  - _`GUC_CTB_FORMAT_HXG` = 0 - see `CTB HXG Message`_        |
-+ *  |   +-------+--------------------------------------------------------------+
-+ *  |   |  11:8 | **RESERVED**                                                 |
-+ *  |   +-------+--------------------------------------------------------------+
-+ *  |   |   7:0 | **NUM_DWORDS** - length of the CTB message (w/o header)      |
-+ *  +---+-------+--------------------------------------------------------------+
-+ *  | 1 |  31:0 | optional (depends on FORMAT)                                 |
-+ *  +---+-------+                                                              |
-+ *  |...|       |                                                              |
-+ *  +---+-------+                                                              |
-+ *  | n |  31:0 |                                                              |
-+ *  +---+-------+--------------------------------------------------------------+
-+ */
-+
-+#define GUC_CTB_MSG_MIN_LEN			1u
-+#define GUC_CTB_MSG_MAX_LEN			256u
-+#define GUC_CTB_MSG_0_FENCE			(0xffff << 16)
-+#define GUC_CTB_MSG_0_FORMAT			(0xf << 12)
-+#define   GUC_CTB_FORMAT_HXG			0u
-+#define GUC_CTB_MSG_0_RESERVED			(0xf << 8)
-+#define GUC_CTB_MSG_0_NUM_DWORDS		(0xff << 0)
-+
-+/**
-+ * DOC: CTB HXG Message
-+ *
-+ *  +---+-------+--------------------------------------------------------------+
-+ *  |   | Bits  | Description                                                  |
-+ *  +===+=======+==============================================================+
-+ *  | 0 | 31:16 | FENCE                                                        |
-+ *  |   +-------+--------------------------------------------------------------+
-+ *  |   | 15:12 | FORMAT = GUC_CTB_FORMAT_HXG_                                 |
-+ *  |   +-------+--------------------------------------------------------------+
-+ *  |   |  11:8 | RESERVED = MBZ                                               |
-+ *  |   +-------+--------------------------------------------------------------+
-+ *  |   |   7:0 | NUM_DWORDS = length (in dwords) of the embedded HXG message  |
-+ *  +---+-------+--------------------------------------------------------------+
-+ *  | 1 |  31:0 |  +--------------------------------------------------------+  |
-+ *  +---+-------+  |                                                        |  |
-+ *  |...|       |  |  Embedded `HXG Message`_                               |  |
-+ *  +---+-------+  |                                                        |  |
-+ *  | n |  31:0 |  +--------------------------------------------------------+  |
-+ *  +---+-------+--------------------------------------------------------------+
-+ */
-+
-+#define GUC_CTB_HXG_MSG_MIN_LEN		(GUC_CTB_MSG_MIN_LEN + GUC_HXG_MSG_MIN_LEN)
-+#define GUC_CTB_HXG_MSG_MAX_LEN		GUC_CTB_MSG_MAX_LEN
-+
- /**
-  * DOC: CTB based communication
-  *
-diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
---- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
-+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
-@@ -343,24 +343,6 @@ static u32 ct_get_next_fence(struct intel_guc_ct *ct)
- 	return ++ct->requests.last_fence;
- }
- 
--/**
-- * DOC: CTB Host to GuC request
-- *
-- * Format of the CTB Host to GuC request message is as follows::
-- *
-- *      +------------+---------+---------+---------+---------+
-- *      |   msg[0]   |   [1]   |   [2]   |   ...   |  [n-1]  |
-- *      +------------+---------+---------+---------+---------+
-- *      |   MESSAGE  |       MESSAGE PAYLOAD                 |
-- *      +   HEADER   +---------+---------+---------+---------+
-- *      |            |    0    |    1    |   ...   |    n    |
-- *      +============+=========+=========+=========+=========+
-- *      |  len >= 1  |  FENCE  |     request specific data   |
-- *      +------+-----+---------+---------+---------+---------+
-- *
-- *                   ^-----------------len-------------------^
-- */
--
- static int ct_write(struct intel_guc_ct *ct,
- 		    const u32 *action,
- 		    u32 len /* in dwords */,
-@@ -373,6 +355,7 @@ static int ct_write(struct intel_guc_ct *ct,
- 	u32 size = ctb->size;
- 	u32 used;
- 	u32 header;
-+	u32 hxg;
- 	u32 *cmds = ctb->cmds;
- 	unsigned int i;
- 
-@@ -403,22 +386,24 @@ static int ct_write(struct intel_guc_ct *ct,
- 		return -ENOSPC;
- 
- 	/*
--	 * Write the message. The format is the following:
--	 * DW0: header (including action code)
--	 * DW1: fence
--	 * DW2+: action data
-+	 * dw0: CT header (including fence)
-+	 * dw1: HXG header
- 	 */
--	header = (len << GUC_CT_MSG_LEN_SHIFT) |
--		 GUC_CT_MSG_SEND_STATUS |
--		 (action[0] << GUC_CT_MSG_ACTION_SHIFT);
-+	header = FIELD_PREP(GUC_CTB_MSG_0_FORMAT, GUC_CTB_FORMAT_HXG) |
-+		 FIELD_PREP(GUC_CTB_MSG_0_NUM_DWORDS, len) |
-+		 FIELD_PREP(GUC_CTB_MSG_0_FENCE, fence);
-+
-+	hxg = FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
-+	      FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION |
-+			 GUC_HXG_REQUEST_MSG_0_DATA0, action[0]);
- 
--	CT_DEBUG(ct, "writing %*ph %*ph %*ph\n",
--		 4, &header, 4, &fence, 4 * (len - 1), &action[1]);
-+	CT_DEBUG(ct, "writing (tail %u) %*ph %*ph %*ph\n",
-+		 tail, 4, &header, 4, &hxg, 4 * (len - 1), &action[1]);
- 
- 	cmds[tail] = header;
- 	tail = (tail + 1) % size;
- 
--	cmds[tail] = fence;
-+	cmds[tail] = hxg;
- 	tail = (tail + 1) % size;
- 
- 	for (i = 1; i < len; i++) {
-@@ -574,21 +559,6 @@ int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
- 	return ret;
- }
- 
--static inline unsigned int ct_header_get_len(u32 header)
--{
--	return (header >> GUC_CT_MSG_LEN_SHIFT) & GUC_CT_MSG_LEN_MASK;
--}
--
--static inline unsigned int ct_header_get_action(u32 header)
--{
--	return (header >> GUC_CT_MSG_ACTION_SHIFT) & GUC_CT_MSG_ACTION_MASK;
--}
--
--static inline bool ct_header_is_response(u32 header)
--{
--	return !!(header & GUC_CT_MSG_IS_RESPONSE);
--}
--
- static struct ct_incoming_msg *ct_alloc_msg(u32 num_dwords)
- {
- 	struct ct_incoming_msg *msg;
-@@ -651,7 +621,7 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
- 	head = (head + 1) % size;
- 
- 	/* message len with header */
--	len = ct_header_get_len(header) + 1;
-+	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, header) + GUC_CTB_MSG_MIN_LEN;
- 	if (unlikely(len > (u32)available)) {
- 		CT_ERROR(ct, "Incomplete message %*ph %*ph %*ph\n",
- 			 4, &header,
-@@ -694,55 +664,24 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
- 	return -EPIPE;
- }
- 
--/**
-- * DOC: CTB GuC to Host response
-- *
-- * Format of the CTB GuC to Host response message is as follows::
-- *
-- *      +------------+---------+---------+---------+---------+---------+
-- *      |   msg[0]   |   [1]   |   [2]   |   [3]   |   ...   |  [n-1]  |
-- *      +------------+---------+---------+---------+---------+---------+
-- *      |   MESSAGE  |       MESSAGE PAYLOAD                           |
-- *      +   HEADER   +---------+---------+---------+---------+---------+
-- *      |            |    0    |    1    |    2    |   ...   |    n    |
-- *      +============+=========+=========+=========+=========+=========+
-- *      |  len >= 2  |  FENCE  |  STATUS |   response specific data    |
-- *      +------+-----+---------+---------+---------+---------+---------+
-- *
-- *                   ^-----------------------len-----------------------^
-- */
--
- static int ct_handle_response(struct intel_guc_ct *ct, struct ct_incoming_msg *response)
- {
--	u32 header = response->msg[0];
--	u32 len = ct_header_get_len(header);
--	u32 fence;
--	u32 status;
--	u32 datalen;
-+	u32 len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, response->msg[0]);
-+	u32 fence = FIELD_GET(GUC_CTB_MSG_0_FENCE, response->msg[0]);
-+	const u32 *hxg = &response->msg[GUC_CTB_MSG_MIN_LEN];
-+	const u32 *data = &hxg[GUC_HXG_MSG_MIN_LEN];
-+	u32 datalen = len - GUC_HXG_MSG_MIN_LEN;
- 	struct ct_request *req;
- 	unsigned long flags;
- 	bool found = false;
- 	int err = 0;
- 
--	GEM_BUG_ON(!ct_header_is_response(header));
-+	GEM_BUG_ON(len < GUC_HXG_MSG_MIN_LEN);
-+	GEM_BUG_ON(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg[0]) != GUC_HXG_ORIGIN_GUC);
-+	GEM_BUG_ON(FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]) != GUC_HXG_TYPE_RESPONSE_SUCCESS &&
-+		   FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]) != GUC_HXG_TYPE_RESPONSE_FAILURE);
- 
--	/* Response payload shall at least include fence and status */
--	if (unlikely(len < 2)) {
--		CT_ERROR(ct, "Corrupted response (len %u)\n", len);
--		return -EPROTO;
--	}
--
--	fence = response->msg[1];
--	status = response->msg[2];
--	datalen = len - 2;
--
--	/* Format of the status dword follows HXG header */
--	if (unlikely(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, status) != GUC_HXG_ORIGIN_GUC)) {
--		CT_ERROR(ct, "Corrupted response (status %#x)\n", status);
--		return -EPROTO;
--	}
--
--	CT_DEBUG(ct, "response fence %u status %#x\n", fence, status);
-+	CT_DEBUG(ct, "response fence %u status %#x\n", fence, hxg[0]);
- 
- 	spin_lock_irqsave(&ct->requests.lock, flags);
- 	list_for_each_entry(req, &ct->requests.pending, link) {
-@@ -758,9 +697,9 @@ static int ct_handle_response(struct intel_guc_ct *ct, struct ct_incoming_msg *r
- 			err = -EMSGSIZE;
- 		}
- 		if (datalen)
--			memcpy(req->response_buf, response->msg + 3, 4 * datalen);
-+			memcpy(req->response_buf, data, 4 * datalen);
- 		req->response_len = datalen;
--		WRITE_ONCE(req->status, status);
-+		WRITE_ONCE(req->status, hxg[0]);
- 		found = true;
- 		break;
- 	}
-@@ -781,14 +720,16 @@ static int ct_handle_response(struct intel_guc_ct *ct, struct ct_incoming_msg *r
- static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *request)
- {
- 	struct intel_guc *guc = ct_to_guc(ct);
--	u32 header, action, len;
-+	const u32 *hxg;
- 	const u32 *payload;
-+	u32 hxg_len, action, len;
- 	int ret;
- 
--	header = request->msg[0];
--	payload = &request->msg[1];
--	action = ct_header_get_action(header);
--	len = ct_header_get_len(header);
-+	hxg = &request->msg[GUC_CTB_MSG_MIN_LEN];
-+	hxg_len = request->size - GUC_CTB_MSG_MIN_LEN;
-+	payload = &hxg[GUC_HXG_MSG_MIN_LEN];
-+	action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, hxg[0]);
-+	len = hxg_len - GUC_HXG_MSG_MIN_LEN;
- 
- 	CT_DEBUG(ct, "request %x %*ph\n", action, 4 * len, payload);
- 
-@@ -850,29 +791,12 @@ static void ct_incoming_request_worker_func(struct work_struct *w)
- 		queue_work(system_unbound_wq, &ct->requests.worker);
- }
- 
--/**
-- * DOC: CTB GuC to Host request
-- *
-- * Format of the CTB GuC to Host request message is as follows::
-- *
-- *      +------------+---------+---------+---------+---------+---------+
-- *      |   msg[0]   |   [1]   |   [2]   |   [3]   |   ...   |  [n-1]  |
-- *      +------------+---------+---------+---------+---------+---------+
-- *      |   MESSAGE  |       MESSAGE PAYLOAD                           |
-- *      +   HEADER   +---------+---------+---------+---------+---------+
-- *      |            |    0    |    1    |    2    |   ...   |    n    |
-- *      +============+=========+=========+=========+=========+=========+
-- *      |     len    |            request specific data                |
-- *      +------+-----+---------+---------+---------+---------+---------+
-- *
-- *                   ^-----------------------len-----------------------^
-- */
--
--static int ct_handle_request(struct intel_guc_ct *ct, struct ct_incoming_msg *request)
-+static int ct_handle_event(struct intel_guc_ct *ct, struct ct_incoming_msg *request)
- {
-+	const u32 *hxg = &request->msg[GUC_CTB_MSG_MIN_LEN];
- 	unsigned long flags;
- 
--	GEM_BUG_ON(ct_header_is_response(request->msg[0]));
-+	GEM_BUG_ON(FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]) != GUC_HXG_TYPE_EVENT);
- 
- 	spin_lock_irqsave(&ct->requests.lock, flags);
- 	list_add_tail(&request->link, &ct->requests.incoming);
-@@ -882,15 +806,53 @@ static int ct_handle_request(struct intel_guc_ct *ct, struct ct_incoming_msg *re
- 	return 0;
- }
- 
--static void ct_handle_msg(struct intel_guc_ct *ct, struct ct_incoming_msg *msg)
-+static int ct_handle_hxg(struct intel_guc_ct *ct, struct ct_incoming_msg *msg)
- {
--	u32 header = msg->msg[0];
-+	u32 origin, type;
-+	u32 *hxg;
- 	int err;
- 
--	if (ct_header_is_response(header))
-+	if (unlikely(msg->size < GUC_CTB_HXG_MSG_MIN_LEN))
-+		return -EBADMSG;
-+
-+	hxg = &msg->msg[GUC_CTB_MSG_MIN_LEN];
-+
-+	origin = FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg[0]);
-+	if (unlikely(origin != GUC_HXG_ORIGIN_GUC)) {
-+		err = -EPROTO;
-+		goto failed;
-+	}
-+
-+	type = FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]);
-+	switch (type) {
-+	case GUC_HXG_TYPE_EVENT:
-+		err = ct_handle_event(ct, msg);
-+		break;
-+	case GUC_HXG_TYPE_RESPONSE_SUCCESS:
-+	case GUC_HXG_TYPE_RESPONSE_FAILURE:
- 		err = ct_handle_response(ct, msg);
-+		break;
-+	default:
-+		err = -EOPNOTSUPP;
-+	}
-+
-+	if (unlikely(err)) {
-+failed:
-+		CT_ERROR(ct, "Failed to handle HXG message (%pe) %*ph\n",
-+			 ERR_PTR(err), 4 * GUC_HXG_MSG_MIN_LEN, hxg);
-+	}
-+	return err;
-+}
-+
-+static void ct_handle_msg(struct intel_guc_ct *ct, struct ct_incoming_msg *msg)
-+{
-+	u32 format = FIELD_GET(GUC_CTB_MSG_0_FORMAT, msg->msg[0]);
-+	int err;
-+
-+	if (format == GUC_CTB_FORMAT_HXG)
-+		err = ct_handle_hxg(ct, msg);
- 	else
--		err = ct_handle_request(ct, msg);
-+		err = -EOPNOTSUPP;
- 
- 	if (unlikely(err)) {
- 		CT_ERROR(ct, "Failed to process CT message (%pe) %*ph\n",
-diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
---- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
-+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
-@@ -61,7 +61,7 @@ struct intel_guc_ct {
- 	struct tasklet_struct receive_tasklet;
- 
- 	struct {
--		u32 last_fence; /* last fence used to send request */
-+		u16 last_fence; /* last fence used to send request */
- 
- 		spinlock_t lock; /* protects pending requests list */
- 		struct list_head pending; /* requests waiting for response */
diff --git a/0001-INTEL_DII-drm-i915-guc-Kill-guc_clients.ct_pool.patch b/0001-INTEL_DII-drm-i915-guc-Kill-guc_clients.ct_pool.patch
deleted file mode 100644
index 6429de098424..000000000000
--- a/0001-INTEL_DII-drm-i915-guc-Kill-guc_clients.ct_pool.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Date: Sun, 3 Nov 2019 14:13:54 +0100
-Subject: [PATCH] INTEL_DII: drm/i915/guc: Kill guc_clients.ct_pool
-
-CTB pool is now maintained internally by the GuC as part of its
-"private data". No need to allocate separate buffer and pass it
-to GuC as yet another ADS.
-
-v2: Rebased after updates for GuC v42 (JohnH).
-v3: Trivial merge (Matthew Brost)
-v4: moved up in pile GuC v57 (Michal)
-
-GuC: 57.0.0
-Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> #v1
-Acked-by: Matthew Brost <matthew.brost@intel.com> #v4
----
- drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c  | 12 ------------
- drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h | 12 +-----------
- 2 files changed, 1 insertion(+), 23 deletions(-)
-
-diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
---- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
-+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
-@@ -26,8 +26,6 @@
-  *      +---------------------------------------+
-  *      | guc_clients_info                      |
-  *      +---------------------------------------+
-- *      | guc_ct_pool_entry[size]               |
-- *      +---------------------------------------+
-  *      | padding                               |
-  *      +---------------------------------------+ <== 4K aligned
-  *      | private data                          |
-@@ -40,7 +38,6 @@ struct __guc_ads_blob {
- 	struct guc_policies policies;
- 	struct guc_gt_system_info system_info;
- 	struct guc_clients_info clients_info;
--	struct guc_ct_pool_entry ct_pool[GUC_CT_POOL_SIZE];
- } __packed;
- 
- static u32 guc_ads_private_data_size(struct intel_guc *guc)
-@@ -68,11 +65,6 @@ static void guc_policies_init(struct guc_policies *policies)
- 	policies->is_valid = 1;
- }
- 
--static void guc_ct_pool_entries_init(struct guc_ct_pool_entry *pool, u32 num)
--{
--	memset(pool, 0, num * sizeof(*pool));
--}
--
- static void guc_mapping_table_init(struct intel_gt *gt,
- 				   struct guc_gt_system_info *system_info)
- {
-@@ -161,11 +153,7 @@ static void __guc_ads_init(struct intel_guc *guc)
- 	base = intel_guc_ggtt_offset(guc, guc->ads_vma);
- 
- 	/* Clients info  */
--	guc_ct_pool_entries_init(blob->ct_pool, ARRAY_SIZE(blob->ct_pool));
--
- 	blob->clients_info.clients_num = 1;
--	blob->clients_info.ct_pool_addr = base + ptr_offset(blob, ct_pool);
--	blob->clients_info.ct_pool_count = ARRAY_SIZE(blob->ct_pool);
- 
- 	/* ADS */
- 	blob->ads.scheduler_policies = base + ptr_offset(blob, policies);
-diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
---- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
-+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
-@@ -309,19 +309,9 @@ struct guc_gt_system_info {
- } __packed;
- 
- /* Clients info */
--struct guc_ct_pool_entry {
--	struct guc_ct_buffer_desc desc;
--	u32 reserved[7];
--} __packed;
--
--#define GUC_CT_POOL_SIZE	2
--
- struct guc_clients_info {
- 	u32 clients_num;
--	u32 reserved0[13];
--	u32 ct_pool_addr;
--	u32 ct_pool_count;
--	u32 reserved[4];
-+	u32 reserved[19];
- } __packed;
- 
- /* GuC Additional Data Struct */
diff --git a/0001-INTEL_DII-drm-i915-guc-Kill-ads.client_info.patch b/0001-INTEL_DII-drm-i915-guc-Kill-ads.client_info.patch
deleted file mode 100644
index ad9faa446682..000000000000
--- a/0001-INTEL_DII-drm-i915-guc-Kill-ads.client_info.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Date: Thu, 6 May 2021 22:50:10 +0200
-Subject: [PATCH] INTEL_DII: drm/i915/guc: Kill ads.client_info
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-New GuC does not require it any more.
-
-GuC: 61.0.0
-Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
-Acked-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
----
- drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c  | 7 -------
- drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h | 8 +-------
- 2 files changed, 1 insertion(+), 14 deletions(-)
-
-diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
---- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
-+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
-@@ -24,8 +24,6 @@
-  *      +---------------------------------------+
-  *      | guc_gt_system_info                    |
-  *      +---------------------------------------+
-- *      | guc_clients_info                      |
-- *      +---------------------------------------+
-  *      | padding                               |
-  *      +---------------------------------------+ <== 4K aligned
-  *      | private data                          |
-@@ -37,7 +35,6 @@ struct __guc_ads_blob {
- 	struct guc_ads ads;
- 	struct guc_policies policies;
- 	struct guc_gt_system_info system_info;
--	struct guc_clients_info clients_info;
- } __packed;
- 
- static u32 guc_ads_private_data_size(struct intel_guc *guc)
-@@ -152,13 +149,9 @@ static void __guc_ads_init(struct intel_guc *guc)
- 
- 	base = intel_guc_ggtt_offset(guc, guc->ads_vma);
- 
--	/* Clients info  */
--	blob->clients_info.clients_num = 1;
--
- 	/* ADS */
- 	blob->ads.scheduler_policies = base + ptr_offset(blob, policies);
- 	blob->ads.gt_system_info = base + ptr_offset(blob, system_info);
--	blob->ads.clients_info = base + ptr_offset(blob, clients_info);
- 
- 	/* Private Data */
- 	blob->ads.private_data = base + guc_ads_private_data_offset(guc);
-diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
---- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
-+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
-@@ -308,19 +308,13 @@ struct guc_gt_system_info {
- 	u32 generic_gt_sysinfo[GUC_GENERIC_GT_SYSINFO_MAX];
- } __packed;
- 
--/* Clients info */
--struct guc_clients_info {
--	u32 clients_num;
--	u32 reserved[19];
--} __packed;
--
- /* GuC Additional Data Struct */
- struct guc_ads {
- 	struct guc_mmio_reg_set reg_state_list[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
- 	u32 reserved0;
- 	u32 scheduler_policies;
- 	u32 gt_system_info;
--	u32 clients_info;
-+	u32 reserved1;
- 	u32 control_data;
- 	u32 golden_context_lrca[GUC_MAX_ENGINE_CLASSES];
- 	u32 eng_state_size[GUC_MAX_ENGINE_CLASSES];
diff --git a/0001-INTEL_DII-drm-i915-guc-Unified-GuC-log.patch b/0001-INTEL_DII-drm-i915-guc-Unified-GuC-log.patch
deleted file mode 100644
index be3cd4c1b7bf..000000000000
--- a/0001-INTEL_DII-drm-i915-guc-Unified-GuC-log.patch
+++ /dev/null
@@ -1,167 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: John Harrison <John.C.Harrison@Intel.com>
-Date: Thu, 29 Apr 2021 15:04:15 -0700
-Subject: [PATCH] INTEL_DII: drm/i915/guc: Unified GuC log
-
-GuC v57 unified the 'DPC' and 'ISR' buffers into a single buffer with
-the option for it to be larger.
-
-Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
-Reviewed by Alan Previn <alan.previn.teres.alexis@intel.com>
----
- drivers/gpu/drm/i915/gt/uc/intel_guc.c      | 15 ++++-------
- drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h |  9 +++----
- drivers/gpu/drm/i915/gt/uc/intel_guc_log.c  | 29 +++++++--------------
- drivers/gpu/drm/i915/gt/uc/intel_guc_log.h  |  6 ++---
- 4 files changed, 20 insertions(+), 39 deletions(-)
-
-diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
---- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
-+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
-@@ -229,24 +229,19 @@ static u32 guc_ctl_log_params_flags(struct intel_guc *guc)
- 
- 	BUILD_BUG_ON(!CRASH_BUFFER_SIZE);
- 	BUILD_BUG_ON(!IS_ALIGNED(CRASH_BUFFER_SIZE, UNIT));
--	BUILD_BUG_ON(!DPC_BUFFER_SIZE);
--	BUILD_BUG_ON(!IS_ALIGNED(DPC_BUFFER_SIZE, UNIT));
--	BUILD_BUG_ON(!ISR_BUFFER_SIZE);
--	BUILD_BUG_ON(!IS_ALIGNED(ISR_BUFFER_SIZE, UNIT));
-+	BUILD_BUG_ON(!DEBUG_BUFFER_SIZE);
-+	BUILD_BUG_ON(!IS_ALIGNED(DEBUG_BUFFER_SIZE, UNIT));
- 
- 	BUILD_BUG_ON((CRASH_BUFFER_SIZE / UNIT - 1) >
- 			(GUC_LOG_CRASH_MASK >> GUC_LOG_CRASH_SHIFT));
--	BUILD_BUG_ON((DPC_BUFFER_SIZE / UNIT - 1) >
--			(GUC_LOG_DPC_MASK >> GUC_LOG_DPC_SHIFT));
--	BUILD_BUG_ON((ISR_BUFFER_SIZE / UNIT - 1) >
--			(GUC_LOG_ISR_MASK >> GUC_LOG_ISR_SHIFT));
-+	BUILD_BUG_ON((DEBUG_BUFFER_SIZE / UNIT - 1) >
-+			(GUC_LOG_DEBUG_MASK >> GUC_LOG_DEBUG_SHIFT));
- 
- 	flags = GUC_LOG_VALID |
- 		GUC_LOG_NOTIFY_ON_HALF_FULL |
- 		FLAG |
- 		((CRASH_BUFFER_SIZE / UNIT - 1) << GUC_LOG_CRASH_SHIFT) |
--		((DPC_BUFFER_SIZE / UNIT - 1) << GUC_LOG_DPC_SHIFT) |
--		((ISR_BUFFER_SIZE / UNIT - 1) << GUC_LOG_ISR_SHIFT) |
-+		((DEBUG_BUFFER_SIZE / UNIT - 1) << GUC_LOG_DEBUG_SHIFT) |
- 		(offset << GUC_LOG_BUF_ADDR_SHIFT);
- 
- 	#undef UNIT
-diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
---- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
-+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
-@@ -81,10 +81,8 @@
- #define   GUC_LOG_ALLOC_IN_MEGABYTE	(1 << 3)
- #define   GUC_LOG_CRASH_SHIFT		4
- #define   GUC_LOG_CRASH_MASK		(0x3 << GUC_LOG_CRASH_SHIFT)
--#define   GUC_LOG_DPC_SHIFT		6
--#define   GUC_LOG_DPC_MASK	        (0x7 << GUC_LOG_DPC_SHIFT)
--#define   GUC_LOG_ISR_SHIFT		9
--#define   GUC_LOG_ISR_MASK	        (0x7 << GUC_LOG_ISR_SHIFT)
-+#define   GUC_LOG_DEBUG_SHIFT		6
-+#define   GUC_LOG_DEBUG_MASK	        (0xF << GUC_LOG_DEBUG_SHIFT)
- #define   GUC_LOG_BUF_ADDR_SHIFT	12
- 
- #define GUC_CTL_WA			1
-@@ -325,8 +323,7 @@ struct guc_ads {
- /* GuC logging structures */
- 
- enum guc_log_buffer_type {
--	GUC_ISR_LOG_BUFFER,
--	GUC_DPC_LOG_BUFFER,
-+	GUC_DEBUG_LOG_BUFFER,
- 	GUC_CRASH_DUMP_LOG_BUFFER,
- 	GUC_MAX_LOG_BUFFER
- };
-diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
---- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
-+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
-@@ -197,10 +197,8 @@ static bool guc_check_log_buf_overflow(struct intel_guc_log *log,
- static unsigned int guc_get_log_buffer_size(enum guc_log_buffer_type type)
- {
- 	switch (type) {
--	case GUC_ISR_LOG_BUFFER:
--		return ISR_BUFFER_SIZE;
--	case GUC_DPC_LOG_BUFFER:
--		return DPC_BUFFER_SIZE;
-+	case GUC_DEBUG_LOG_BUFFER:
-+		return DEBUG_BUFFER_SIZE;
- 	case GUC_CRASH_DUMP_LOG_BUFFER:
- 		return CRASH_BUFFER_SIZE;
- 	default:
-@@ -245,7 +243,7 @@ static void guc_read_update_log_buffer(struct intel_guc_log *log)
- 	src_data += PAGE_SIZE;
- 	dst_data += PAGE_SIZE;
- 
--	for (type = GUC_ISR_LOG_BUFFER; type < GUC_MAX_LOG_BUFFER; type++) {
-+	for (type = GUC_DEBUG_LOG_BUFFER; type < GUC_MAX_LOG_BUFFER; type++) {
- 		/*
- 		 * Make a copy of the state structure, inside GuC log buffer
- 		 * (which is uncached mapped), on the stack to avoid reading
-@@ -463,21 +461,16 @@ int intel_guc_log_create(struct intel_guc_log *log)
- 	 *  +===============================+ 00B
- 	 *  |    Crash dump state header    |
- 	 *  +-------------------------------+ 32B
--	 *  |       DPC state header        |
-+	 *  |      Debug state header       |
- 	 *  +-------------------------------+ 64B
--	 *  |       ISR state header        |
--	 *  +-------------------------------+ 96B
- 	 *  |                               |
- 	 *  +===============================+ PAGE_SIZE (4KB)
- 	 *  |        Crash Dump logs        |
- 	 *  +===============================+ + CRASH_SIZE
--	 *  |           DPC logs            |
--	 *  +===============================+ + DPC_SIZE
--	 *  |           ISR logs            |
--	 *  +===============================+ + ISR_SIZE
-+	 *  |          Debug logs           |
-+	 *  +===============================+ + DEBUG_SIZE
- 	 */
--	guc_log_size = PAGE_SIZE + CRASH_BUFFER_SIZE + DPC_BUFFER_SIZE +
--			ISR_BUFFER_SIZE;
-+	guc_log_size = PAGE_SIZE + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE;
- 
- 	vma = intel_guc_allocate_vma(guc, guc_log_size);
- 	if (IS_ERR(vma)) {
-@@ -675,10 +668,8 @@ static const char *
- stringify_guc_log_type(enum guc_log_buffer_type type)
- {
- 	switch (type) {
--	case GUC_ISR_LOG_BUFFER:
--		return "ISR";
--	case GUC_DPC_LOG_BUFFER:
--		return "DPC";
-+	case GUC_DEBUG_LOG_BUFFER:
-+		return "DEBUG";
- 	case GUC_CRASH_DUMP_LOG_BUFFER:
- 		return "CRASH";
- 	default:
-@@ -708,7 +699,7 @@ void intel_guc_log_info(struct intel_guc_log *log, struct drm_printer *p)
- 
- 	drm_printf(p, "\tRelay full count: %u\n", log->relay.full_count);
- 
--	for (type = GUC_ISR_LOG_BUFFER; type < GUC_MAX_LOG_BUFFER; type++) {
-+	for (type = GUC_DEBUG_LOG_BUFFER; type < GUC_MAX_LOG_BUFFER; type++) {
- 		drm_printf(p, "\t%s:\tflush count %10u, overflow count %10u\n",
- 			   stringify_guc_log_type(type),
- 			   log->stats[type].flush,
-diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h
---- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h
-+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h
-@@ -17,12 +17,10 @@ struct intel_guc;
- 
- #ifdef CONFIG_DRM_I915_DEBUG_GUC
- #define CRASH_BUFFER_SIZE	SZ_2M
--#define DPC_BUFFER_SIZE		SZ_8M
--#define ISR_BUFFER_SIZE		SZ_8M
-+#define DEBUG_BUFFER_SIZE	SZ_16M
- #else
- #define CRASH_BUFFER_SIZE	SZ_8K
--#define DPC_BUFFER_SIZE		SZ_32K
--#define ISR_BUFFER_SIZE		SZ_32K
-+#define DEBUG_BUFFER_SIZE	SZ_64K
- #endif
- 
- /*
diff --git a/0001-INTEL_DII-drm-i915-guc-Update-firmware-to-v61.1.1.patch b/0001-INTEL_DII-drm-i915-guc-Update-firmware-to-v61.1.1.patch
deleted file mode 100644
index b20cec9af73d..000000000000
--- a/0001-INTEL_DII-drm-i915-guc-Update-firmware-to-v61.1.1.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: John Harrison <John.C.Harrison@Intel.com>
-Date: Tue, 22 Oct 2019 13:34:10 -0700
-Subject: [PATCH] INTEL_DII: drm/i915/guc: Update firmware to v61.1.1
-
-v13: Rebased after v49.0.1 going upstream (JohnH)
-v14: Updated to GuC v52.1.3 (JohnH).
-v15: Updated to GuC v54.0.1 (JohnH).
-v16: Unsquashed scheduling policy changes (JohnH)
-v17: Updated to GuC v56.1.1 (JohnH).
-v18: 57.0.0 (Michal)
-v19: Updated to GuC v58.0.0 (JohnH).
-v20: 60.0.0 (Michal)
-v21: Updated to GuC v60.1.0 (JohnH).
-v22: 60.1.2
-v23: 61.0.0 (michal)
-v24: Resolve minor conflict with adls upstream patch.(aswarup)
-v25: Updated to GuC v61.1.1 (JohnH).
-v26: Split GuC/HuC definition entries (JohnH).
-
-Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
-Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
----
- drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 26 ++++++++++++------------
- 1 file changed, 13 insertions(+), 13 deletions(-)
-
-diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
---- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
-+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
-@@ -49,19 +49,19 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
-  * firmware as TGL.
-  */
- #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_def) \
--	fw_def(ALDERLAKE_S,  0, guc_def(tgl,  49, 0, 1)) \
--	fw_def(ROCKETLAKE,   0, guc_def(tgl,  49, 0, 1)) \
--	fw_def(TIGERLAKE,    0, guc_def(tgl,  49, 0, 1)) \
--	fw_def(JASPERLAKE,   0, guc_def(ehl,  49, 0, 1)) \
--	fw_def(ELKHARTLAKE,  0, guc_def(ehl,  49, 0, 1)) \
--	fw_def(ICELAKE,      0, guc_def(icl,  49, 0, 1)) \
--	fw_def(COMETLAKE,    5, guc_def(cml,  49, 0, 1)) \
--	fw_def(COMETLAKE,    0, guc_def(kbl,  49, 0, 1)) \
--	fw_def(COFFEELAKE,   0, guc_def(kbl,  49, 0, 1)) \
--	fw_def(GEMINILAKE,   0, guc_def(glk,  49, 0, 1)) \
--	fw_def(KABYLAKE,     0, guc_def(kbl,  49, 0, 1)) \
--	fw_def(BROXTON,      0, guc_def(bxt,  49, 0, 1)) \
--	fw_def(SKYLAKE,      0, guc_def(skl,  49, 0, 1))
-+	fw_def(ALDERLAKE_S,  0, guc_def(tgl,  61, 1, 1)) \
-+	fw_def(ROCKETLAKE,   0, guc_def(tgl,  61, 1, 1)) \
-+	fw_def(TIGERLAKE,    0, guc_def(tgl,  61, 1, 1)) \
-+	fw_def(JASPERLAKE,   0, guc_def(ehl,  61, 1, 1)) \
-+	fw_def(ELKHARTLAKE,  0, guc_def(ehl,  61, 1, 1)) \
-+	fw_def(ICELAKE,      0, guc_def(icl,  61, 1, 1)) \
-+	fw_def(COMETLAKE,    5, guc_def(cml,  61, 1, 1)) \
-+	fw_def(COMETLAKE,    0, guc_def(kbl,  61, 1, 1)) \
-+	fw_def(COFFEELAKE,   0, guc_def(kbl,  61, 1, 1)) \
-+	fw_def(GEMINILAKE,   0, guc_def(glk,  61, 1, 1)) \
-+	fw_def(KABYLAKE,     0, guc_def(kbl,  61, 1, 1)) \
-+	fw_def(BROXTON,      0, guc_def(bxt,  61, 1, 1)) \
-+	fw_def(SKYLAKE,      0, guc_def(skl,  61, 1, 1))
- 
- #define INTEL_HUC_FIRMWARE_DEFS(fw_def, huc_def) \
- 	fw_def(ALDERLAKE_S,  0, huc_def(tgl,  7, 5, 0)) \
diff --git a/0001-INTEL_DII-drm-i915-guc-Add-stall-timer-to-non-blocki.patch b/0001-INTEL_DII-drm-i915-guc-Add-stall-timer-to-non-blocki.patch
deleted file mode 100644
index 0495e97b5635..000000000000
--- a/0001-INTEL_DII-drm-i915-guc-Add-stall-timer-to-non-blocki.patch
+++ /dev/null
@@ -1,142 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: John Harrison <John.C.Harrison@Intel.com>
-Date: Fri, 3 Jan 2020 10:42:06 -0800
-Subject: [PATCH] INTEL_DII: drm/i915/guc: Add stall timer to non blocking CTB
- send function
-
-Implement a stall timer which fails H2G CTBs once a period of time
-with no forward progress is reached to prevent deadlock.
-
-Also return -EDEADLK rather than -EPIPE when the H2G channel is in a bad
-state.
-
-v2: Added error message if CT is deadlocked.
-v3 (Daniele): Print GuC status on CT deadlock.
-v4: CT cleanups (Matthew Brost)
-v5: rebase on ctbs.send (Michal)
-v6: rebase on ctbs.lock (Michal)
-v7: rebase on new ctb.descriptor (Michal)
-v8: Add 2 to length as HXG now 2 dwords (Matthew Brost)
-v9: Return -EDEADLK instead of -EPIPE (Matthew Brost)
-v10: Return -EIO instead of -EDEADLK (Matthew Brost)
-
-Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
-CC: Matthew Brost <matthew.brost@intel.com>
-Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
-Signed-off-by: Matthew Brost <matthew.brost@intel.com>
----
- drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 48 +++++++++++++++++++++--
- 1 file changed, 45 insertions(+), 3 deletions(-)
-
-diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
---- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
-+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
-@@ -69,6 +69,8 @@ static inline struct drm_device *ct_to_drm(struct intel_guc_ct *ct)
- #define CTB_H2G_BUFFER_SIZE	(SZ_4K)
- #define CTB_G2H_BUFFER_SIZE	(SZ_4K)
- 
-+#define MAX_US_STALL_CTB	1000000
-+
- struct ct_request {
- 	struct list_head link;
- 	u32 fence;
-@@ -315,6 +317,7 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
- 
- 	ct->requests.last_fence = 1;
- 	ct->enabled = true;
-+	ct->stall_time = KTIME_MAX;
- 
- 	return 0;
- 
-@@ -378,7 +381,7 @@ static int ct_write(struct intel_guc_ct *ct,
- 	unsigned int i;
- 
- 	if (unlikely(ctb->broken))
--		return -EPIPE;
-+		return -EIO;
- 
- 	if (unlikely(desc->status))
- 		goto corrupted;
-@@ -449,7 +452,7 @@ static int ct_write(struct intel_guc_ct *ct,
- 	CT_ERROR(ct, "Corrupted descriptor head=%u tail=%u status=%#x\n",
- 		 desc->head, desc->tail, desc->status);
- 	ctb->broken = true;
--	return -EPIPE;
-+	return -EIO;
- }
- 
- /**
-@@ -494,6 +497,17 @@ static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
- 	return err;
- }
- 
-+static inline bool ct_deadlocked(struct intel_guc_ct *ct)
-+{
-+	bool ret = ktime_us_delta(ktime_get(), ct->stall_time) >
-+		MAX_US_STALL_CTB;
-+
-+	if (unlikely(ret))
-+		CT_ERROR(ct, "CT deadlocked\n");
-+
-+	return ret;
-+}
-+
- static inline bool ctb_has_room(struct intel_guc_ct_buffer *ctb, u32 len_dw)
- {
- 	struct guc_ct_buffer_desc *desc = ctb->desc;
-@@ -505,6 +519,26 @@ static inline bool ctb_has_room(struct intel_guc_ct_buffer *ctb, u32 len_dw)
- 	return space >= len_dw;
- }
- 
-+static int has_room_nb(struct intel_guc_ct *ct, u32 len_dw)
-+{
-+	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
-+
-+	lockdep_assert_held(&ct->ctbs.send.lock);
-+
-+	if (unlikely(!ctb_has_room(ctb, len_dw))) {
-+		if (ct->stall_time == KTIME_MAX)
-+			ct->stall_time = ktime_get();
-+
-+		if (unlikely(ct_deadlocked(ct)))
-+			return -EIO;
-+		else
-+			return -EBUSY;
-+	}
-+
-+	ct->stall_time = KTIME_MAX;
-+	return 0;
-+}
-+
- static int ct_send_nb(struct intel_guc_ct *ct,
- 		      const u32 *action,
- 		      u32 len,
-@@ -517,7 +551,7 @@ static int ct_send_nb(struct intel_guc_ct *ct,
- 
- 	spin_lock_irqsave(&ctb->lock, spin_flags);
- 
--	ret = ctb_has_room(ctb, len + 1);
-+	ret = has_room_nb(ct, len + 1);
- 	if (unlikely(ret))
- 		goto out;
- 
-@@ -561,11 +595,19 @@ static int ct_send(struct intel_guc_ct *ct,
- retry:
- 	spin_lock_irqsave(&ct->ctbs.send.lock, flags);
- 	if (unlikely(!ctb_has_room(ctb, len + 1))) {
-+		if (ct->stall_time == KTIME_MAX)
-+			ct->stall_time = ktime_get();
- 		spin_unlock_irqrestore(&ct->ctbs.send.lock, flags);
-+
-+		if (unlikely(ct_deadlocked(ct)))
-+			return -EIO;
-+
- 		cond_resched();
- 		goto retry;
- 	}
- 
-+	ct->stall_time = KTIME_MAX;
-+
- 	fence = ct_get_next_fence(ct);
- 	request.fence = fence;
- 	request.status = 0;
--
git-pile 0.98-dev
