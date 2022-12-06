Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56E310E02A
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Dec 2022 08:55:59 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  6 Dec 2022 00:58:38 -0800
Message-Id: <20221206085849.271505-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 00/11] Resurrect GuC Relay Logging
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

This series brings GuC relay logging back to life by
re-aligning the (previously implicit, now query-able)
guc-log-relay subbuffer-specs, debugfs file handle names
and usages between intel_guc_logger tool and i915.

This series depends on fixes and updates on the
kernel side via this series:
https://patchwork.freedesktop.org/series/103767/

Changes from prio revs:
   v1: - With MTL and multi-tile, add support for GT-ID
         selection for GuC logging.
       - Add new design changes to flusher thread to do
         decoding of the GuC log buffer header data and
         unwrap all head-->tail regions into a linear
         sequence so we can concatenate the GuC log outoput
         file to make it look like a single large contiguous
         GuC Log buffer (as it it came direct from memory).
         This was a design miss from original code and is
         needed to ensure internal tools can decode the logs. 


Alan Previn (11):
  tools/intel_guc_logger: Re-enable basic functionality
  tools/intel_guc_logger: Refactor intel_guc_logger globals into structs
  tools/intel_guc_logger: Add GT-ID selection for intel_guc_logger
  tools/intel_guc_logger: Add helper function for flusher code
  tools/intel_guc_logger: Add GuC Log header structure definition
  tools/intel_guc_logger: Concatenate log samples into a contiguous
    file.
  tools/intel_guc_logger: Add overflow awareness.
  tools/intel_guc_logger: Limit relay logging output file to 4GB.
  tools/intel_guc_logger: By default don't change GuC log verbosity
  tools/intel_guc_logger: On exit, save any leftover GuC log data
  tools/intel_guc_logger: Add useful debug messages

 tools/intel_guc_logger.c | 851 +++++++++++++++++++++++++++++++--------
 1 file changed, 674 insertions(+), 177 deletions(-)


base-commit: c001793d5f22deb01918b6ba52af829794582df1
-- 
2.34.1
