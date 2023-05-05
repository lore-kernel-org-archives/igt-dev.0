Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B55FA10E576
 for <igt-dev@lists.freedesktop.org>; Fri,  5 May 2023 06:48:49 +0000 (UTC)
Date: Fri, 5 May 2023 08:48:44 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <20230505084844.1fd76b14@maurocar-mobl2>
In-Reply-To: <20230505061431.3157151-1-bhanuprakash.modem@intel.com>
References: <20230505061431.3157151-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] scripts/test_list: Create dir if it
 doesn't exist
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri,  5 May 2023 11:44:31 +0530
Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:

> To generate the testlist create the destination dir if it
> doesn't exist.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  scripts/test_list.py | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index 1c5e195eb..9ae1cd154 100755
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -1149,6 +1149,9 @@ class TestList:
>              fname = directory + "/" + test_prefix + fname + ".testlist"
>              fname = re.sub(r"[\s_]+", "-", fname)
>  
> +            if not os.path.exists(directory):
> +                os.makedirs(directory)
> +

Don't need to have it inside the for loop, as the directory is
the same for all test lists.

After moving it to be before the "for test in test_subtests.keys():"
loop:

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Regards,
Mauro
