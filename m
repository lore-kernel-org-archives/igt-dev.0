Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EFAA10EA85
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Mar 2023 12:26:50 +0000 (UTC)
Message-ID: <b2a499aa-f79b-ba66-b22a-adce4fd3dec4@intel.com>
Date: Wed, 29 Mar 2023 17:56:33 +0530
MIME-Version: 1.0
Content-Language: en-US
References: <20230329111954.2584660-1-mauro.chehab@linux.intel.com>
From: Swati Sharma <swati2.sharma@intel.com>
In-Reply-To: <20230329111954.2584660-1-mauro.chehab@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 0/2] Add support for prehistoric sphinx
 versions
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 29-Mar-23 4:49 PM, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Ubuntu 18.04 comes with a prehistoric version of Sphinx. While
> upstream is currently on version 6.1.x, Ubuntu comes with version
> 1.6.
> 
> Yet, adding support for it is not hard, as it is just a matter of
> adjusting the theme setup logic.
> 
> Mauro Carvalho Chehab (2):
>    conf.py: add some backward-compatibility bits
>    docs/testplan/conf.py: avoid using shutil include
> 
>   docs/testplan/conf.py | 46 +++++++++++++++++++++++++++++++++++--------
>   1 file changed, 38 insertions(+), 8 deletions(-)
> 

-- 
~Swati Sharma

