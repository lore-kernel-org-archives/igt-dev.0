Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Intel-gfx@lists.freedesktop.org
Date: Fri,  3 Feb 2023 11:16:33 +0000
Message-Id: <20230203111636.4138202-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] More intel_gpu_top improvements
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Suggestion was received to omit repeating header lines when outputting to a file
and also to add the CVS mode for easy parsing. We have JSON but I guess CVS can
definitely be easier for some use cases.

Tvrtko Ursulin (3):
  intel_gpu_top: Do not repeat header lines in non-interactive output
  intel_gpu_top: Rename STDOUT to TEXT
  intel_gpu_top: Add CVS output format

 man/intel_gpu_top.rst |   3 +
 tools/intel_gpu_top.c | 137 +++++++++++++++++++++++++++++++++---------
 2 files changed, 111 insertions(+), 29 deletions(-)

-- 
2.34.1
